# Scripts - VS Code

_You can work on Scripts from VS Code. This is a more convenient way to write the code for scripts and debug. Also, there are additional features available._

### Getting started

<mark style="color:green;">**Step #1: Preparation**</mark>

1\) Create a new empty folder on your PC:

<div align="left"><figure><img src="../.gitbook/assets/image (924).png" alt="" width="563"><figcaption></figcaption></figure></div>

2\) Open this folder by VS Code and open Terminal.

{% hint style="info" %}
If you don't have Node installed, you must do this first.
{% endhint %}

***

<mark style="color:green;">**Step #2: Package Installation**</mark>

1\) In Terminal, run the following command:

```
npx --package=@pepperi-addons/user-defined-scripts-debugger init
```

<figure><img src="../.gitbook/assets/image (925).png" alt=""><figcaption></figcaption></figure>

2\) Wait till the installation is completed:

<div align="left"><figure><img src="../.gitbook/assets/image (926).png" alt="" width="503"><figcaption></figcaption></figure></div>

3\) When ready, you will see the following new folders and files:&#x20;

<div align="left"><figure><img src="../.gitbook/assets/image (927).png" alt="" width="202"><figcaption></figcaption></figure></div>

4\) Check README.md. It contains some basic explanations and commands:

```markdown
# User Defined Scripts Debugging Tool
A template and set of scripts useful in debugging scripts

## Paste your JWT
Paste a JWT in the jwt file

## Download your scripts
Run `npx pull-scripts` in the command line.
Yours scripts will be populated into a folder with the Distributor ID

## Update a specific script
Run `npx push-script <script.key>` to publish a script code to the server

## Debugging
Run `npx debug-script <script.key>` to publish a script to a local instance
Only works currently on MacOS use the mac catalyst app

## Attach
Run the vscode attach configuration to attach and debug a script
Put a debugger statement in the script to be able to debug live
Only works currently on MacOS use the mac catalyst app
Only works for scripts send using `debug-script`
```

***

<mark style="color:green;">**Step #3: Token**</mark>

1\) Copy the **idp\_token** of the environment where you're going to update a script:

<figure><img src="../.gitbook/assets/image (928).png" alt=""><figcaption></figcaption></figure>

2\) Paste the idp\_token to the **jwt** file:

<figure><img src="../.gitbook/assets/image (929).png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
Keep in mind that idp\_token is expiring every 15-20 min.&#x20;
{% endhint %}

***

<mark style="color:green;">**Step #4: Pulling scripts**</mark>

1\) In the Terminal run the following command:

```
npx pull-scripts
```

2\) A new folder with all available scripts from the selected environment will appear:

<div align="left"><figure><img src="../.gitbook/assets/image (1073).png" alt="" width="326"><figcaption></figcaption></figure></div>

{% hint style="info" %}
You can't create a new script via VS Code, only to edit the existing ones. The same is for script parameters: you have to add them manually in the backoffice.
{% endhint %}

***

<mark style="color:green;">**Step #5: Working on a script**</mark>

1\) Open the script and update the code as needed:&#x20;

<figure><img src="../.gitbook/assets/image (1074).png" alt=""><figcaption></figcaption></figure>

***

<mark style="color:green;">**Step #6: Pushing the update**</mark>

1\) When you complete working on the script, you need to send the update to Pepperi. In the Terminal, run the following command:

```
npx push-script <script.key>
```

Where **\<script.key>** is the UUID of the script which you can find in the script file header:&#x20;

<figure><img src="../.gitbook/assets/image (1000).png" alt=""><figcaption></figcaption></figure>

* **Example:**

```
npx push-script ac15904e-b228-4369-b155-76b9d71f059c
```

***

### Additional features&#x20;

#### <mark style="color:red;">1️⃣</mark> <mark style="color:blue;">Removing unnecessary red underline</mark>

VS Code can mark some code parts as errors which can be very annoying:

<div align="left"><figure><img src="../.gitbook/assets/image (1001).png" alt="" width="549"><figcaption></figcaption></figure></div>

To remove red underline:

<table data-view="cards"><thead><tr><th></th><th></th><th></th></tr></thead><tbody><tr><td>1) Go to <strong>tsconfig.json</strong></td><td><img src="../.gitbook/assets/image (823).png" alt="" data-size="original"></td><td></td></tr><tr><td>2) Add <strong>"strictNullChecks": false</strong> to <em>compilerOptions</em>:</td><td><img src="../.gitbook/assets/image (824).png" alt="" data-size="original"></td><td></td></tr></tbody></table>

***

#### 2️⃣ <mark style="color:blue;">Hints</mark>

When writing an API function in VS Code, it helps to know if any parameters are missing. The editor helps to ensure your API functions are properly written and error-free.

* If a parameter is missing in your API function, VS Code will highlight this with an error indication:

<div align="left"><figure><img src="../.gitbook/assets/image (826).png" alt="" width="359"><figcaption></figcaption></figure></div>

* VS Code will suggest the parameter you need to add:

<div align="left"><figure><img src="../.gitbook/assets/image (827).png" alt="" width="440"><figcaption></figcaption></figure></div>

* Once you've added the suggested parameter and everything is correct, the error indication will disappear:

<div align="left"><figure><img src="../.gitbook/assets/image (825).png" alt="" width="404"><figcaption></figcaption></figure></div>

***

#### 3️⃣ <mark style="color:blue;">Function required parameters</mark>

There could be cases when you need to know what parameters are required for a particular Pepperi function. Instructions:

1\) Use **Ctrl + Left Mouse Button (LMB)** (for macOS: **Cmd + LMB**) on the function name:&#x20;

<div align="left"><figure><img src="../.gitbook/assets/image (833).png" alt="" width="563"><figcaption></figcaption></figure></div>

2\) This will redirect you to the function in the declaration file '**create-globals.d.ts**':

<div align="left"><figure><img src="../.gitbook/assets/image (834).png" alt="" width="563"><figcaption></figcaption></figure></div>

3\) Use **Ctrl + LMB** (for macOS: **Cmd + LMB**) on Params (the exact name could differ: UDTGetList**Params**, Get**Params**, Search**Params**, etc.):&#x20;

<figure><img src="../.gitbook/assets/image (835).png" alt=""><figcaption></figcaption></figure>

4\) You will be redirected to '**index.d.ts**' and see the detailed list of parameters and their corresponding data types that the function accepts:&#x20;

<div align="left"><figure><img src="../.gitbook/assets/image (836).png" alt="" width="294"><figcaption></figcaption></figure></div>

* To see details, hover on the code element. \
  Imagine, you'd like to know what ObjectIdentifier means. Hover on the element and see that it's either UUID (type: string) or InternalID (type: number):

<div align="left"><figure><img src="../.gitbook/assets/image (837).png" alt="" width="212"><figcaption></figcaption></figure></div>

***

**4️⃣&#x20;**<mark style="color:blue;">**Function Output**</mark><mark style="color:blue;">:</mark>

This feature helps to understand what the function returns.

1\) Follow steps 1-2 from [#id-3-function-required-parameters](scripts-vs-code.md#id-3-function-required-parameters "mention")

2\) Use **Ctrl + LMB** (for macOS: **Cmd + LMB**) on the Result (the name could differ: UDTGetList**Result**, Get**Result**, etc.).&#x20;

<figure><img src="../.gitbook/assets/image (838).png" alt=""><figcaption></figcaption></figure>

3\) You will be redirected to '**index.d.ts**' and see the function output structure:

<div align="left"><figure><img src="../.gitbook/assets/image (839).png" alt="" width="365"><figcaption></figcaption></figure></div>

{% hint style="warning" %}
&#x20;Sometimes index.d.ts could contain incomplete or outdated data
{% endhint %}

***

### Debugging

#### ❶ <mark style="color:green;">**Alert**</mark>

The simplest debugging tool you can use in Scripts is **client.alert()**. If you're not working from macOS this is basically the only method available.

<div align="left"><figure><img src="../.gitbook/assets/image (1085).png" alt="" width="314"><figcaption></figcaption></figure></div>

{% hint style="warning" %}
It has its own limitations, e.g. `client.alert()` will not work if the Script is used in the transaction.
{% endhint %}

***

#### ❷ <mark style="color:green;">**Console.log**</mark>

While you can write `console.log()` in Scripts, you won't be able to access these logs in DevTools as usual. You can use [#built-in-debugger](scripts-vs-code.md#built-in-debugger "mention") for this purpose.

To see console logs in VS Code the following prerequisites are necessary:&#x20;

* Working from macOS;
* A special version of the Pepperi app which is used for debugging;

**Follow the instructions:**&#x20;

1\) Run the application (version for debugging);

2\) Open VS Code;

3\) In VS Code click on "Run and Debug" in the left panel:&#x20;

<div align="left"><figure><img src="../.gitbook/assets/image (1086).png" alt="" width="274"><figcaption></figcaption></figure></div>

4\) Click on the "Start Debugging" green arrow:&#x20;

<div align="left"><figure><img src="../.gitbook/assets/image (1087).png" alt="" width="306"><figcaption></figcaption></figure></div>

5\) Go to "Debug Console". Here you will see all the application logs:

<figure><img src="../.gitbook/assets/image (1090).png" alt=""><figcaption></figcaption></figure>

6\) Go back to the app and trigger the script;

7\) In "Debug Console" you will see the logs. Look for **ScriptKey** with your Script UUID:

<figure><img src="../.gitbook/assets/image (1104).png" alt=""><figcaption></figcaption></figure>

Errors will be highlighted in red:

<figure><img src="../.gitbook/assets/image (1105).png" alt=""><figcaption></figcaption></figure>

***

#### ❸ <mark style="color:green;">Built-in debugger</mark>

1\) Go to Settings -> Configuration -> Scripts;

2\) Select the script and click "Debugger":&#x20;

<div align="left"><figure><img src="../.gitbook/assets/image (977).png" alt="" width="446"><figcaption></figcaption></figure></div>

3\) Enter parameters manually:

<div align="left"><figure><img src="../.gitbook/assets/image (980).png" alt="" width="563"><figcaption></figcaption></figure></div>

4\) Debugging options:

* console.log()
  * will appear in the "Logs" section;

{% hint style="warning" %}
If there are too many console logs in your Script, they may not be shown in "Logs". To see logs:&#x20;

* open DevTools -> Network;
* run the Script;
* go to Response:

![](<../.gitbook/assets/image (981).png>)&#x20;
{% endhint %}

* return:&#x20;
  * will appear in the "Results" section.

5\) Click "Run":

<figure><img src="../.gitbook/assets/image (978).png" alt=""><figcaption></figcaption></figure>

#### ❹ <mark style="color:green;">VS Code</mark> <mark style="color:green;"></mark><mark style="color:green;">**Debugger**</mark>

You can use the debugger tool as well.

1\) Add 'debugger' to your code:

<figure><img src="../.gitbook/assets/image (1035).png" alt=""><figcaption></figcaption></figure>

2\) Go to Terminal and run:&#x20;

```
npx debug-script <script.key>
```

&#x20;where \<script.key> = script UUID

3\) Go to the app and trigger the script;

4\) You will be redirected to VS Code to the debugger;

5\) Hover over code elements to see values:&#x20;

<figure><img src="../.gitbook/assets/image (1036).png" alt=""><figcaption></figcaption></figure>

* If the value is an object it could be displayed as "Proxy":&#x20;

<div align="left"><figure><img src="../.gitbook/assets/image (1038).png" alt="" width="446"><figcaption></figcaption></figure></div>

In Debug Console write JSON.stringify(your\_object):

<figure><img src="../.gitbook/assets/image (1037).png" alt=""><figcaption></figcaption></figure>

### Possible errors

#### <mark style="color:red;">Fetch error while running</mark> <mark style="color:red;"></mark><mark style="color:red;">`npx debug-script <script.key>`</mark> <mark style="color:red;"></mark><mark style="color:red;">command</mark>

<figure><img src="../.gitbook/assets/image (1031).png" alt=""><figcaption></figcaption></figure>

#### <mark style="color:green;">How to fix</mark>

* make sure the app and VS Code are in one window:

<div align="left"><figure><img src="../.gitbook/assets/image (1034).png" alt="" width="563"><figcaption></figcaption></figure></div>

* run the command again.
