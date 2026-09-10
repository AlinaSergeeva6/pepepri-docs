---
title: "Scripts - VS Code"
order: 278
---
# Scripts - VS Code

*You can work on Scripts from VS Code. This is a more convenient way to write the code for scripts and debug. Also, there are additional features available.*

### Getting started

**Step #1: Preparation**

1) Create a new empty folder on your PC:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-168.png)

2) Open this folder by VS Code and open Terminal.

!!!info
If you don't have Node installed, you must do this first.
!!!

---

**Step #2: Package Installation**

1) In Terminal, run the following command:

```
npx --package=@pepperi-addons/user-defined-scripts-debugger init
```

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-169.png)

2) Wait till the installation is completed:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-170.png)

3) When ready, you will see the following new folders and files:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-171.png)

4) Check README.md. It contains some basic explanations and commands:

```
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

---

**Step #3: Token**

1) Copy the **idp\_token** of the environment where you're going to update a script:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-172.png)

2) Paste the idp\_token to the **jwt** file:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-173.png)

!!!info
Keep in mind that idp\_token is expiring every 15-20 min.
!!!

---

**Step #4: Pulling scripts**

1) In the Terminal run the following command:

```
npx pull-scripts
```

2) A new folder with all available scripts from the selected environment will appear:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-174.png)

!!!info
You can't create a new script via VS Code, only to edit the existing ones. The same is for script parameters: you have to add them manually in the backoffice.
!!!

---

**Step #5: Working on a script**

1) Open the script and update the code as needed:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-175.png)

---

**Step #6: Pushing the update**

1) When you complete working on the script, you need to send the update to Pepperi. In the Terminal, run the following command:

```
npx push-script <script.key>
```

Where **&lt;script.key>** is the UUID of the script which you can find in the script file header:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-176.png)

-   **Example:**

```
npx push-script ac15904e-b228-4369-b155-76b9d71f059c
```

---

### Additional features

#### 1️⃣ Removing unnecessary red underline

VS Code can mark some code parts as errors which can be very annoying:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-177.png)

To remove red underline:

1) Go to **tsconfig.json**

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-178.png)

2) Add **"strictNullChecks": false** to *compilerOptions*:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-179.png)

---

#### 2️⃣ Hints

When writing an API function in VS Code, it helps to know if any parameters are missing. The editor helps to ensure your API functions are properly written and error-free.

-   If a parameter is missing in your API function, VS Code will highlight this with an error indication:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-180.png)

-   VS Code will suggest the parameter you need to add:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-181.png)

-   Once you've added the suggested parameter and everything is correct, the error indication will disappear:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-182.png)

---

#### 3️⃣ Function required parameters

There could be cases when you need to know what parameters are required for a particular Pepperi function. Instructions:

1) Use **Ctrl + Left Mouse Button (LMB)** (for macOS: **Cmd + LMB**) on the function name:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-183.png)

2) This will redirect you to the function in the declaration file '**create-globals.d.ts**':

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-184.png)

3) Use **Ctrl + LMB** (for macOS: **Cmd + LMB**) on Params (the exact name could differ: UDTGetList**Params**, Get**Params**, Search**Params**, etc.):

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-185.png)

4) You will be redirected to '**index.d.ts**' and see the detailed list of parameters and their corresponding data types that the function accepts:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-186.png)

-   To see details, hover on the code element. Imagine, you'd like to know what ObjectIdentifier means. Hover on the element and see that it's either UUID (type: string) or InternalID (type: number):

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-187.png)

---

**4️⃣** **Function Output**:

This feature helps to understand what the function returns.

1) Follow steps 1-2 from 3️⃣ Function required parameters
2) Use **Ctrl + LMB** (for macOS: **Cmd + LMB**) on the Result (the name could differ: UDTGetList**Result**, Get**Result**, etc.).

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-188.png)

3) You will be redirected to '**index.d.ts**' and see the function output structure:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-189.png)

!!!warning
Sometimes index.d.ts could contain incomplete or outdated data
!!!

---

### Debugging

#### ❶ Alert

The simplest debugging tool you can use in Scripts is **client.alert()**. If you're not working from macOS this is basically the only method available.

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-190.png)

!!!warning
It has its own limitations, e.g. `client.alert()` will not work if the Script is used in the transaction.
!!!

---

#### ❷ Console.log

While you can write `console.log()` in Scripts, you won't be able to access these logs in DevTools as usual. You can use ❸ Built-in debugger for this purpose.

To see console logs in VS Code the following prerequisites are necessary:

-   Working from macOS;
-   A special version of the Pepperi app which is used for debugging;

**Follow the instructions:**

1) Run the application (version for debugging);
2) Open VS Code;
3) In VS Code click on "Run and Debug" in the left panel:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-191.png)

4) Click on the "Start Debugging" green arrow:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-192.png)

5) Go to "Debug Console". Here you will see all the application logs:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-193.png)

6) Go back to the app and trigger the script;
7) In "Debug Console" you will see the logs. Look for **ScriptKey** with your Script UUID:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-194.png)

Errors will be highlighted in red:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-195.png)

---

#### ❸ Built-in debugger

1) Go to Settings -> Configuration -> Scripts;
2) Select the script and click "Debugger":

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-196.png)

3) Enter parameters manually:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-197.png)

4) Debugging options:
-   console.log()
    -   will appear in the "Logs" section;

!!!warning
If there are too many console logs in your Script, they may not be shown in "Logs". To see logs:

-   open DevTools -> Network;
-   run the Script;
-   go to Response:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-198.png)
!!!

-   return:
    -   will appear in the "Results" section.

5) Click "Run":

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-199.png)

#### ❹ VS Code Debugger

You can use the debugger tool as well.

1) Add 'debugger' to your code:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-200.png)

2) Go to Terminal and run:

```
npx debug-script <script.key>
```

where &lt;script.key> = script UUID

3) Go to the app and trigger the script;
4) You will be redirected to VS Code to the debugger;
5) Hover over code elements to see values:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-201.png)

-   If the value is an object it could be displayed as "Proxy":

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-202.png)

In Debug Console write JSON.stringify(your\_object):

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-203.png)

### Possible errors

#### Fetch error while running npx debug-script &lt;script.key> command

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-204.png)

#### How to fix

-   make sure the app and VS Code are in one window:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-205.png)

-   run the command again.
