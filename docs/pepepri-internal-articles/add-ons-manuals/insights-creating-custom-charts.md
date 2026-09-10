---
title: "Insights - Creating Custom Charts"
order: 69
---
# Insights - Creating Custom Charts

Insights provides various ways to display customer data for better understanding and organization. The design of display elements can be found in the "Design" dropdown within the Content tab of each element.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-772.png)

The selected elements for the design are located in the Insights Charts Manager. Here, you can modify existing charts or add new ones as needed.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-773.png)

On Pages, charts are used to visualize different types of data in graphical form. Data retrieved through Data Queries needs to be processed and displayed according to the client’s requirements. In most cases, pre-configured charts are sufficient, as they include system indications and cover common customer needs.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-774.png)

However, if modifications are required—such as changes in data processing, specific query requirements, or adjustments in styles and display formats—you will need to create custom charts.

## Adding Charts

To add a new chart or update an existing one with new logic, follow these steps:

1.  Click the "Add" button.
2.  Enter the Name and Description of the chart.
3.  Select the Type of chart.
4.  Upload the required Template file.

Once the template file is uploaded, a preview with visualized test data will be displayed on the right side.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-775.png)

## Working with Chart Files

Most charts follow a structured approach to rendering and share key components:

### Chart Configuration

-   Most charts use a Configuration typedef to define chart settings, such as labels.
-   The ChartData structure includes Series, Groups, and DataSet.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-776.png)

### Class Definition

-   Most charts export a class named MyChart, where all logic is defined.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-777.png)

-   The class constructor initializes chart elements within the provided HTML container.
-   Styles are dynamically added to ensure proper rendering across different screen sizes.

### Chart Rendering

-   Charts instantiate an ApexCharts object using a configuration object.
-   A **ResizeObserver** monitors chart size changes and adjusts them accordingly.

### Update Functionality

-   The update() function processes incoming data and modifies the chart dynamically.
-   Data is formatted and structured before updating the chart series.

#### HTML and Configuration Handling

The getHTML() function generates the required HTML structure for the chart:

```
// first we create a div on the HTML element
        element.innerHTML = this.getHTML();
   getHTML() {
        return `<div id="canvas" style="height: 11rem; margin: 0;"></div>`;
    }
```

The getConfiguration() function builds the chart’s configuration object:

```
    getConfiguration(canvas, configuration) {
        Some code
    }
```

*Note:* Not all charts require the getConfiguration() function—some directly use the update() function without additional configurations.

#### Receiving Data

-   Data is provided via a ChartData object, containing Series, Groups, and DataSet.
-   Some charts also process benchmark data to compare actual values against predefined goals or additional parameters.
-   The update() function retrieves and formats data dynamically to be compatible with ApexCharts.

#### Rendering the Visual Chart

1.  The getHTML() function defines the HTML container (typically inserting a &lt;div> where the chart will be drawn).
2.  The getConfiguration() function constructs necessary configuration options, such as chart type, colors, and formatting rules.
3.  The ApexCharts instance is initialized in the constructor and reconfigured dynamically based on data changes.
4.  The chart updates visually using updateOptions() and updateSeries() functions.

### Examples

#### Example 1: Customizing Benchmark Colors

If you need a benchmark chart to use only two colors based on a Target value, you can update the standard Benchmark column chart configuration:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-778.png)

Changing several parameters allows you to change the overall appearance of the benchmark.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-779.png)

Old New

As a result, the benchmark will now display only two colors, depending on the Target value.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-780.png)

#### Example 2: Adding Custom HTML Styles

To add html styles you just need to update html in benchmark js file.

```
// System Chart variant
// update the card
   const card = this.canvas.querySelector('#canvas');
   card.innerHTML = `
        <p title="` + value1TooltipMsg + `" style="text-align: center; padding: 0; margin: 0; font-size: 2.5rem; font-weight: 700; line-height: 1.2;" class="font-family-title ellipsis">` + value1Msg + `</p>
        <p title="` + value2TooltipMsg + `" style="text-align: center; padding: 0; font-size: 1.25rem; font-weight: 600; line-height: 1.2;" class="bold color-dimmed font-family-body ellipsis">` + value2Msg + `</p>
   `;
```

Changing the html in this case allows us to replace the standard title that works when hovering over the value. The modified version replaces this with custom logic, which allows the title to work even on mobile devices, which the standard title is not capable of.

```
// Custom title implementation for mobile devices
// update the card
    const card = this.canvas.querySelector('#canvas');
    let updatedValue1TooltipMsg = value1TooltipMsg ? value1TooltipMsg : 0;
    card.innerHTML = `
	<div class="tooltip-container-first">
      <p style="text-align: center; padding: 0; margin: 0; font-size: 2.5rem; font-weight: 700; line-height: 1.2;" class="font-family-title ellipsis">
        <span class="tooltip-trigger-top">` + value1Msg + `</span>
        <span class="custom-tooltip">` + updatedValue1TooltipMsg + `</span>
      </p>
    </div>
    <div class="tooltip-container-second">
      <p style="text-align: center; padding: 0; font-size: 1.25rem; font-weight: 600; line-height: 1.2;" class="bold color-dimmed font-family-body ellipsis">
        <span class="tooltip-trigger-down">` + value2Msg + `</span>
        <span class="custom-tooltip-second">` + value2TooltipMsg + `</span>
      </p>
      </div>
    </div>
				<script>

document.querySelector('.tooltip-trigger-top').addEventListener('touchstart', function () {
  const tooltip = this.nextElementSibling;
  tooltip.style.visibility = tooltip.style.visibility === 'visible' ? 'hidden' : 'visible';
});
document.querySelector('.tooltip-trigger-down').addEventListener('touchstart', function () {
  const tooltip = this.nextElementSibling;
  tooltip.style.visibility = tooltip.style.visibility === 'visible' ? 'hidden' : 'visible';
});

    </script>
    <style>
        .tooltip-container {
        position: relative;
        display: inline-block;
      }
      .tooltip-container-first {
        position: relative;
        /* display: inline-block; */
      }

      .tooltip-container-second {
        position: relative;
        /* display: inline-block; */
      }

      .custom-tooltip {
        visibility: hidden;
        background-color: #fff;
        color: #000000;
        text-align: center;
        padding: 5px;
        border: 1px solid black;
        border-radius: 1px;
        font-size: 0.8rem;
        font-weight: normal;
        /*line-height: 0.8;*/
        position: absolute;
        top: 85%;
        left: 65%;
        /* transform: translateX(-50%); */
        white-space: nowrap;
        z-index: 1;
      }

      .custom-tooltip-second {
        visibility: hidden;
        background-color: #fff;
        color: #000000;
        text-align: center;
        padding: 5px;
        border: 1px solid black;
        border-radius: 1px;
        font-size: 0.8rem;
        font-weight: normal;
        /*line-height: 0.8;*/
        position: absolute;
        top: 85%;
        left: 65%;
        /* transform: translateX(-0%); */
        white-space: nowrap;
        z-index: 1;
      }

      .tooltip-container-first:hover .custom-tooltip,
      .tooltip-container-first:focus .custom-tooltip {
        visibility: visible;
      }

      .tooltip-container-second:hover .custom-tooltip-second,
      .tooltip-container-second:focus .custom-tooltip-second {
        visibility: visible;
      }
    </style>
				`;
```

As a result we will get value with title which work on hover also on mobile devices:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-781.png)

#### Additional Resources

For more examples, refer to the Services Demo Environment (7343) (30013939). Use the preview feature to explore different chart configurations.
