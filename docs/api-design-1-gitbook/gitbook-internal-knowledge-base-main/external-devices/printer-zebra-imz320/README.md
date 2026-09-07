# Printer Zebra iMZ320

## &#x20;                                              **About printer**

For effective work we should know main elements of the printer:

![](<../../.gitbook/assets/1 (4).jpg>)

<br>

1\)     **Turn on button**:

·        To turn on printer press and hold this button and wait few seconds;

·        To turn off you need to press and release;

2\)     **Prints button**: prints an empty line if pressed;

3\)     **On indicator**: lights when printer is on;

4\)     **Power indicator**: lights when printer connected to power source;

5\)     **Addition indicator**: blinks or lights in special cases;

6\)     **Connection indicator**: lights when printer connected to another device;

## &#x20;                                      How connect to iPad

&#x20;First of all, we need to install special app in App Store, you can find it by name **Natuurnetwerk:**

![](<../../.gitbook/assets/2 (1).jpg>)

\
Then you can connect you iPad to printer via Bluetooth. Its main app with which pepperi app connects to print. If your iPad can’t find printer, you should install some additional apps like:

![](<../../.gitbook/assets/3 (5).jpg>)

\
·        **Zebra Printer Setup** – to see and set some printer settings;

·        **Zebra Utilities** – to test how printer work (print).

**Also you can use this example of code:**

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <button onclick="printTest()">Print Test ZPL</button>

    <script>
        const TEST_ZPL_CODE = `
            ^XA
            ^FO0,10
            ^FB400,3,0,C
            ^ANN,15,15
            ^FDTEST^FS

            ^FO0,60
            ^ANB,15,15
            ^FDNCD^FS

            ^FO20,60
            ^BY3
            ^BCN,50,,,
            ^FD123^FS

            ^FO340,120 
            ^ANN,15,15
            ^FDN^FS
            ^XZ
        `;

        function printTest(){
            var encodedString = window.btoa(unescape(encodeURIComponent(TEST_ZPL_CODE)));
            var string2print = 'nnbluetoothprint://?LabelData=' + encodedString +
                '&LabelDataType=ZPLBase64&SourceUrl=PepperiApp://';
            var string2printfinal = {
                url: string2print,
                options: {}
            };

            onOpenExternalRequest(string2printfinal);
        }

    </script>
</body>
</html>
```

\
<br>
