---
description: Describes the interface of the chart script JS
---

# Charts interface

The chart script file must export (using ES6 module export) a class that will receive an HTML element from the container and renders it however it wants and configuration, the configuration currently only has a "label" which is the title of the chart.\
\
The class must contain a **constructor** and a function called **update()** whose function is to prepare the data into the chart.\
The container will call this function after the instance is created and after the data is sent.

```javascript
 {
    DataQueries:[
      {
        Name: "Data1",
        Groups:["ActionDate"],
        Series: ["Series 1", "Series 2"]
      },
      {
        Name: "Data2",
        Groups:["ActionDate"],
        Series: ["Series 3"]
      }
    ],
    DataSet: [
      { "ActionDate": "Jan", "Series 1": this.getRandomNumber(), "Series 2": this.getRandomNumber(), "Series 3":this.getRandomNumber()},
      { "ActionDate": "Feb", "Series 1": this.getRandomNumber(), "Series 2": this.getRandomNumber() , "Series 3":this.getRandomNumber()},
      { "ActionDate": "Mar", "Series 1": this.getRandomNumber(), "Series 2": this.getRandomNumber() , "Series 3":this.getRandomNumber()},
      { "ActionDate": "Apr", "Series 1": this.getRandomNumber(), "Series 2": this.getRandomNumber() , "Series 3":this.getRandomNumber()},
      { "ActionDate": "May", "Series 1": this.getRandomNumber(), "Series 2": this.getRandomNumber() , "Series 3":this.getRandomNumber()},
      { "ActionDate": "Jun", "Series 1": this.getRandomNumber(), "Series 2": this.getRandomNumber() , "Series 3":this.getRandomNumber()}
    ]
  }
```

In addition to class, The chart script file must export an **array of dependencies** it used. \
For example, if he used chart js:

```javascript
  const deps = [
        'https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js'
    ];
```

## Full JS Example:

This is an example of a real chart including the implementation of the class and dependencies

```javascript

/**
 * @typedef Configuration A configuration object supplied to the chart by the embedder
 * @type {object}
 * @property {string} label The label of the chart
 */

/**
 * @typedef ChartData A data object supplied to the chart by the embedder containing the chart data
 * @type {object}
 * @property {string[]} Series The chart data Series
 * @property {string[]} Groups The chart data Groups
 * @property {object[]} DataSet The chart data DataSet
 */

/**
 * This is the class the embedder will use to render the chart
 * In this file we will use a chart from chart.js
 */
export default class MyChart {

    /**
     * The chart constructor.
     * 
     * @param {HTMLElement} element The embedder supplies this HTMLElement which can be used to render UI
     * @param {Configuration} configuration a JSON object that holds the chart specific configuration
     */
    constructor(element, configuration) {
        /**
         * The embedder of this chart will insert the chart data to this property
         * @type {ChartData}
         */
        this.data = {};

        // first we create a canvas on the HTML element
        element.innerHTML = this.getHTML();

        // retrieve the canvas element from the element
        const canvas = element.querySelector('canvas');

        // retrieve a chart.js configuration using the label from the embedder configuration
        const conf = this.getChartJSConfiguration();

        // create a chart.js Chart element on the canvas with the configuration
        this.chart = new Chart(canvas, conf);
    }

    /**
     * This function must be implemented by the chart
     * the embedder calls this function when there are changes to the chart data
     */
    update() {

        const groups = this.data.DataQueries.map((data) => data.Groups).flat();
        const series = this.data.DataQueries.map((data) => data.Series).flat();

        const uniqGroups = groups.filter(function (elem, index, self) {
            return index === self.indexOf(elem);
        });

        const uniqSeries = series.filter(function (elem, index, self) {
            return index === self.indexOf(elem);
        });

        const dataSet = this.data.DataSet;

        this.removeUnsupportedCharacters(uniqGroups, uniqSeries, dataSet);

        const colorsToAdd = uniqSeries.length - this.colors.length;
        if (colorsToAdd > 0) {
            this.addRandomColors(colorsToAdd);
        }

        // the data has multiple group by DataSet -> show them in the y-axis
        if (uniqGroups.length > 0) {

            this.chart.data = {
                datasets: uniqGroups.map(groupName => {
                    return uniqSeries.map((seriesName, seriesIndex) => {
                        return this.getGroupedDataSet(seriesName, seriesName, groupName, seriesIndex, dataSet);
                    })
                }).flat()
            }


        } else {
            // the data has no group by -> show the Series in the y-axis
            this.chart.data = {
                datasets: [
                    this.getDataSet(uniqSeries, dataSet)
                ],
                labels: uniqSeries
            }
            // hide the Series legend title
            this.chart.options.plugins.legend.display = false;
        }

        // update the chart.js chart
        this.chart.update();
    }

    removeUnsupportedCharacters(uniqGroups, uniqSeries, dataSet) {

        let foundGroupWithDot = false;
        for (let i = 0; i < uniqGroups.length; i++) {
            if (uniqGroups[i].indexOf('.') > -1) {
                foundGroupWithDot = true;
                uniqGroups[i] = uniqGroups[i].replace('.', '');
            }
        };

        let founSeriesWithDot = false;
        for (let i = 0; i < uniqSeries.length; i++) {
            if (uniqSeries[i].indexOf('.') > -1) {
                founSeriesWithDot = true;
                uniqSeries[i] = uniqSeries[i].replace('.', '');
            }
        };

        if (founSeriesWithDot || foundGroupWithDot) {
            for (let i = 0; i < dataSet.length; i++) {
                dataSet[i] = this.transformKeys(dataSet[i]);
            };
        }
    }

    addRandomColors(numberOfColorsToAdd) {
        for (var i = 0; i < numberOfColorsToAdd; i++) {
            const color = `${Math.floor(Math.random() * 255)},${Math.floor(Math.random() * 255)},${Math.floor(Math.random() * 255)}`;
            this.colors.push(color);
        }
    }

    /**
     * This function returns a dataset object array for a chart.js chart.
     */
    getGroupedDataSet(label, xAxisKey, yAxisKey, seriesIndex, dataSet) {
        const color = this.colors[seriesIndex];
        return {
            label: label,
            data: dataSet,
            borderColor: 'rgb(' + color + ')',
            backgroundColor: 'rgba(' + color + ', 0.33)',
            borderWidth: 1,
            parsing: {
                yAxisKey: yAxisKey,
                xAxisKey: xAxisKey
            }
        }
    }

    /**
     * This function returns a dataset object for a chart.js chart.
     */
    getDataSet(series, dataset) {
        const colors = series.map((serie, index) => this.colors[index]);
        return {
            data: series.map(Series => {
                return dataset[0][Series];
            }),
            borderColor: colors.map(color => `rgb(${color})`),
            backgroundColor: colors.map(color => `rgba(${color}, 0.33)`),
            borderWidth: 1,
        }
    }

    /**
     * This function returns a random color. 
     */
    colors = ['23, 102,166', '255, 152,0', '254,80,0', '131,179,12'];


    /**
     * This function returns an html which will be created in the embedder. 
     */
    getHTML() {
        return `<div >
                <canvas></canvas>
                </div>`;
    }

    /**
     * This function returns a chart.js configuration object. 
     */
    getChartJSConfiguration() {
        return {
            type: 'bar',
            options: {
                indexAxis: 'y',
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                },
                plugins: {
                    legend: {
                        labels: {
                            color: '#00000075',
                            boxHeight: 15,
                            padding: 10,
                        },
                        position: 'bottom',
                        align: 'start',
                    }
                }
            }
        };
    }

    transformKeys(obj) {
        return Object.keys(obj).reduce(function (o, prop) {
            var value = obj[prop];
            var newProp = prop.replace('.', '');
            o[newProp] = value;
            return o;
        }, {});
    }
}

// defines the dependencies required for the chart
export const deps = [
    'https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js'
];

```



