---
description: >-
  This example you can find in 'Integration Examples' (6685) ,UI Task name:
  Upload Any Data via xlsx
---

# Working with xlsx files using JavaScript

**Target/ Goal**

1\) Create or load data from .xlsx, .xls (Excel tables) or .csv files, work with them and update Pepperi (Transaction Item Scope, Lines etc.);&#x20;

2\) Retrieve data from Pepperi (Transaction Lines, Items etc.) and save it in .xlsx format.

**When it can be useful**

Update transaction lines, items etc. For example, customer wants second button called “upload excel” on cart that will give an option to upload items (according to their ExternalID and qty’s) from Desktop (WebApp).

#### What should we use

jQuery and Kendo:

*  First of all, we must load jQuery lib, example:&#x20;

```
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
```

*  Second, to take full advantage of the Excel export feature, we can download the JSZip library and include the file before the Kendo UI JavaScript files. Or, as JSZip is part of the Kendo UI distribution, we can make it available through the Kendo UI CDN:

```
<script src="https://kendo.cdn.telerik.com/2019.3.1023/js/jszip.min.js"></script>
```

* Thirdly, to create and work with .xlsx files we must include kendo lib, example:

```
<script src='https://kendo.cdn.telerik.com/2019.3.917/js/kendo.all.min.js'></script>
```

*  Finally, we should include xlsx library (It’s only for Uploading Data from Desktop), example:

```
<script src='https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.14.0/xlsx.full.min.js'></script>
```

#### Retrieving Data and Saving It

You retrieve data from standard resources by pepperi.api. … .get/search or even from dataflow tasks by get\_data in json format. You want to put this data into Excel table and save it on your (customers) Desktop.&#x20;

**Example:** You have got your data in format \[{Feature\_Name1: Value, Feature\_Name2: Value, …},..].

```
var data = [
  {"ExternalID": "HT3001","MainCategoryID": "Hats","CostPrice": 23},
  {"ExternalID": "HT3002","MainCategoryID": "Hats","CostPrice": 23},
  {"ExternalID": "HT3003","MainCategoryID": "Hats","CostPrice": 24},
  {"ExternalID": "HT3004","MainCategoryID": "Hats","CostPrice": 21},
  {"ExternalID": "HT3005","MainCategoryID": "Hats","CostPrice": 23}]

// Creating column names (ExternalID, MainCategory, CostPrice in our case)
var cols = {cells: []};
for (var i in data[0])
	cols.cells.push({value: i});

// Creating workbook with columns as first row
var workbook = new kendo.ooxml.Workbook({
	sheets: [{
		rows: [
			cols
		]
	}]
});

// Adding all data in required format
var single_row;
for (var i in data){
	single_row = {cells:[]} //row format to push
	for (var j in data[i])
		single_row.cells.push({value:data[i][j]}) // making one row
	workbook.options.sheets[0].rows.push(single_row); // adding this row to spreadsheet
}	

// Saving spreadsheet
var dataURL = workbook.toDataURL();
kendo.saveAs({
	dataURI: dataURL,
	fileName: 'Test.xlsx'
});

```

Result of after saving:

![](/broken/files/-LzkQlIQmy0eAniS4zcv)

**Note:**&#x20;

You can edit your workbook as you want (add new sheets, change column width etc.); to learn more follow the link - [https://docs.telerik.com/kendo-ui/api/javascript/ooxml/workbook](https://docs.telerik.com/kendo-ui/api/javascript/ooxml/workbook).&#x20;

Also with Kendo you can even create Excel spreadsheet form via .kendoSpreadsheet; to learn more follow the link - [https://demos.telerik.com/kendo-ui/spreadsheet](https://demos.telerik.com/kendo-ui/spreadsheet)

#### Uploading from Desktop

We have situation opposite to previous. We need to upload .xslx file from our desktop and then we can update Pepperi with it, for example.&#x20;

_First of all_, we need to create input field in html:

```
<input type="file" name="FileAttachment" id="select" class="upload" accept=".xls, .xlsx, .csv" />
```

As we can see, it allows to load even .csv files.&#x20;

_Next_, we bind our button to function:

```
$("#select").on("change", function (e) {handleFile(e);});
```

_Then_, we should define handleFile function:

```
var _json;
function handleFile(e){
	var files = e.target.files,
            f = files[0];	// Get our file
    var reader = new FileReader();	// Create new File Reader
    reader.onload = function (e) {
            var data = e.target.result;	// Get our data in special format
            var workbook = XLSX.read(data, {
                type: "binary"
            });	// Create workbook
            var sheetName = workbook.SheetNames[0];
            var sheet = workbook.Sheets[sheetName];	// Get our sheet

            _json = XLSX.utils.sheet_to_json(sheet);	// Parse sheet to json format
	}
	reader.readAsBinaryString(f)
}

```

Finally, we got our file in JSON format (\_json variable) and can interact with it.

Note: You should use callback function or setTimeout(function\_name, 1000) in order to get data in \_json variable.
