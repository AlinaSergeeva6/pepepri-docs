---
description: >-
  Examples can be found on Integration Examples: Server Side Scripting folder
  (59705)
---

# JS Script (Server Side Script)

In order to start using **Server Side Script**, the necessary Addon is set automatically for the client on Integration

![](<../../.gitbook/assets/Screenshot 2021-11-12 at 10.51.25.png>)

**In a word, the way it works:**

JS code as a string is sent to ------> the Addon(API request)  ------> it gets through evaluation  ------> JS code is executed&#x20;

**a.  if it is sync way:**  Integration Server waits for the answer from JS Server, response is received and sent to you (max execution time - 30 seconds);

**b.  if it is async way:**  request is sent -----> Integration sends request to Node  -----> response is received -----> task is finished (max execution time -  5-10 minutes);



**IMPORTANT** &#x20;

If time execution of JS code takes longer, exception will be returned&#x20;

If you want to prepare **dataflow task with JS scripting** you need to have these settings:

![](<../../.gitbook/assets/Screenshot 2021-11-12 at 10.52.41.png>)

**IMPORTANT:**    Source Object: **Server Side Script**

As a result you will get **a new tab JS Script**.&#x20;

In this Tab you need to put down the main logic which you need:

![](<../../.gitbook/assets/Screenshot 2021-11-12 at 10.46.41.png>)

You can find **possible functions in Server Api**:

![](<../../.gitbook/assets/Screenshot 2021-11-12 at 10.47.52.png>)

**a. get\_data**

**b. write\_log**

**c. get\_data\_details**

If you struggle to deal with get\_data function, this detailed instruction can come in hand&#x79;**:**

![](<../../.gitbook/assets/Screenshot 2021-11-12 at 10.49.22.png>)

The difference between **get\_data in UI tasks** and **get\_data in JS script** is the way you call this function :

&#x20;                 **UI task:** it is called as **a call\_back function**;

&#x20;                **JS Script:** it is called as **an async/await  function**;      &#x20;

&#x20;

**More detailed articles related to async/await  function:**

[https://developer.mozilla.org/ru/docs/Web/JavaScript/Reference/Statements/async\_function](https://developer.mozilla.org/ru/docs/Web/JavaScript/Reference/Statements/async_function)

[https://developer.mozilla.org/ru/docs/Web/JavaScript/Reference/Operators/await](https://developer.mozilla.org/ru/docs/Web/JavaScript/Reference/Operators/await)

[https://javascript.info/async-await](https://javascript.info/async-await)  . &#x20;

**Example:**

![](<../../.gitbook/assets/image (415).png>)

**Any manipulations can be provided with JS Script in dataflow task:**

![](<../../.gitbook/assets/image (55).png>)

**the magic button Parse JS**

![](<../../.gitbook/assets/Screenshot 2021-11-12 at 10.18.06.png>)

* gives an opportunity to parse the code on client's side (not execute but parse only)&#x20;
* it helps to find errors in the code before the execution -------> in order to do that remember about some necessary conditions:

![](<../../.gitbook/assets/Screenshot 2021-11-12 at 10.22.53.png>)

**HotKeys:**

**Ctrl + D** - parse JS

**Ctrl + S** - Save

Default Log of executed dataflow task if you work on get\_data function (it’s possible to debug with the help of write\_log function):

![](<../../.gitbook/assets/Screenshot 2021-11-12 at 11.06.55.png>)

**NOTE**

\-----------------------------------------------------------------------------------------------------

the way this write\_log performed can be different from the way it is shown in the code.&#x20;

&#x20;               e.g. **JS Code:**

&#x20;                                        write\_log({message: '1'})

&#x20;                                        write\_log({message: '2'})

&#x20;                           **Log:**

&#x20;                                         2

&#x20;                                         1

\-----------------------------------------------------------------------------------------------------&#x20;

**IT IS FOR EMERGENCIES ONLY (use in the extreme):**

If you need to increase time out for your purpose, set **server\_side\_script\_is\_ async**  in your dataflow task’s setting&#x73;**:**

![](<../../.gitbook/assets/image (427).png>)

**How to use this as a variable in http request:**

1\.     you prepare in settings   -----> **server\_side\_script**&#x20;

![](<../../.gitbook/assets/image (58).png>)

2\. prepare **the url in HTTP request**, using **{#text\_from\_script(!%server\_side\_script%!)#}** where

**a. {#text\_from\_script\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_#}** is a function call and

**b. (!%server\_side\_script%!)** is a setting call &#x20;

Instead of **(!%server\_side\_script%!)** you can put down any **JS as a string** with necessary "**return 'something'''** ----> this JS string must return **a string (not an array)**, because it will be inserted into the code straightly&#x20;

![](<../../.gitbook/assets/Screenshot 2021-11-12 at 10.36.22.png>)

**REMEMBER** to use double quotes    “……”&#x20;

**IMPORTANT**\
&#x20;           a. if you use in JS Script **InternalID**, it will be parsed as **WrntyID**. It can lead to errors

&#x20;           b. to avoid this mistake, put down instead of **‘InternalID’** -----> **‘Int’ + ‘ernailID’**
