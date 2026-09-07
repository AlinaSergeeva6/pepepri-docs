# Converting UPC-A into UPC-E

**The Universal Product Code** (UPC or UPC code) is a barcode symbology that is widely used worldwide for tracking trade items in stores. There are many types of UPC, but the most popular is UPC-A and UPC-E:

* UPC or UPC-A - consists of 12 digits that are uniquely assigned to each trade item.
* UPC-E is the condensed version of the standard sized UPC-A numeric barcode.

![UPC (UPC-A) barcode](<../.gitbook/assets/image (186).png>)

![UPC-E barcode](<../.gitbook/assets/image (137).png>)



Sometimes a client wants to use both UPCs, but for some reason does not want or cannot provide them. We need to do the conversion ourselves. To do that we need to use JavaScript in Server Side Script dataflow task. Here is the site from where the code is used (this online converter does show the final result. for the final result, use the function below):&#x20;

[http://www.macrobarcode.com/csharp-barcode/upc-a\_to\_upc-e.shtml](http://www.macrobarcode.com/csharp-barcode/upc-a_to_upc-e.shtml)

Use this function and as a result you will UPC-E as a string

```
/* Converting UPC-A to UPC-E
  inputUpc: string
*/
function convertUPCAtoUPCE(inputUpc) {
  let UPCE = "";

  if (inputUpc.length < 12) {
    const holdString = "000000000000" + inputUpc;
    inputUpc = holdString.substring(holdString.length - 12);
  }

  if (inputUpc.substring(0, 1) != "0" && inputUpc.substring(0, 1) != "1") {
    return '';
  } else if (
    inputUpc.substring(3, 6) == "000" ||
    inputUpc.substring(3, 6) == "100" ||
    inputUpc.substring(3, 6) == "200"
  ) {
    UPCE =
      inputUpc.substring(1, 3) +
      (inputUpc.substring(8, 11) + inputUpc.substring(3, 4));
  } else if (inputUpc.substring(4, 6) == "00") {
    UPCE = inputUpc.substring(1, 4) + (inputUpc.substring(9, 11) + "3");
  } else if (inputUpc.substring(5, 6) == "0") {
    UPCE = inputUpc.substring(1, 6) + (inputUpc.substring(10, 11) + "4");
  } else if (Number.parseFloat(inputUpc.substring(10, 11)) >= 5) {
    UPCE = inputUpc.substring(1, 6) + inputUpc.substring(10, 11);
  } else {
    return '';
  }
  UPCE = inputUpc.substring(0, 1) + UPCE + inputUpc.substring(inputUpc.length - 1, inputUpc.length)
  return UPCE;
};

```

As an example:

```
convertUPCAtoUPCE("034000000074")  // The result should be '03400704'
convertUPCAtoUPCE("026100006612")  // The result should be '02666112'
```
