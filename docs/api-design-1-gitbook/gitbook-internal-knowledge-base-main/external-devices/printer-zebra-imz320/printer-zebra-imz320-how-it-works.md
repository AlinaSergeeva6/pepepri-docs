# Printer Zebra iMZ320 - How it works

1\) User adds item to the cart and input signature (if needed).

2\) User activates Custom Home Page

3\) In the Custom Home page there 3 elements :

\
**tcode** - text area witch fills up with ZPL code

**myconsole** - User "Console log" which displayed status of the program

**Print button** - button which can be used for testing, because code will start compiling automatically.

![](<../../.gitbook/assets/1 (2).png>)

If you look on the code, you will see, that there js code which will transfer html to ZPL.

Here are some features you can use:

\
**getImageZPL** - image handler, for correct working of this code you must transform your header into base64 code ([https://www.base64encode.org/](https://www.base64encode.org/)), for signature there different logic.

**runSignature** - text handler, there you can change text output. (There many examples of implementation in my code.)

For testing purposes find sendToPrinter function and change onSaveAndClose to onSave, and after your code will transfer html to ZPL which one can be printed in the [http://labelary.com/viewer.html](http://labelary.com/viewer.html) to get visualisation of the future printed paper.     &#x20;

Example of full code:\
&#x20;        &#x20;

{% file src="../../.gitbook/assets/PrinterCodeConfig.txt" %}
