---
title: "Dynamics BC - VS Code environment configuration"
order: 116
---
# Dynamics BC - VS Code environment configuration

### Overview

Visual Studio Code is an essential tool for developing solutions and customisations for Dynamics 365 Business Central (BC). Here's why it is needed:

-   **AL Language Development Environment** \- all custom development in Dynamics BC is done using the AL programming language, which requires a modern code editor to write, manage, and debug the code effectively. VS Code provides robust support for AL language syntax highlighting, code completion, and debugging features.
-   **Integration with Business Central** \- VS Code is designed to connect directly to your Dynamics BC environment, allowing you to upload, test, and debug extensions in real time. Developers can easily publish their customisations directly to a BC sandbox environment from VS Code.
-   **Error Detection and Debugging** \- VS Code extensions support real-time error detection and debugging for AL code, ensuring higher code quality and faster troubleshooting.

### VS Code Extensions configuration

First of all, open VS Code and go to Extensions on the left bar. You need to install extensions listed below:

-   **AL Language extension for Microsoft Dynamics 365 Business Central**

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-531.png)

-   **AZ AL Dev Tools/AL Code Outline**

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-532.png)

### New project creation

Press `Ctrl + Shift + P` and type command `AL: Go!`

This will start the process of new project creating.

1.  Select **location** for the new project. Folder (*test-project* in this case) must not exist on your local machine - it will be created automatically:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-533.png)

1.  Select Dynamics BC **version**. If you are not sure which one to use, select the latest and change it in the configuration file later):

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-534.png)

1.  Select **Microsoft cloud sandbox**:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-535.png)

Initial configuration is finished. You’ll see some errors in the VS Code debug tab, don’t pay attention to them as we will fix everything at the next step.

### Connecting to Dynamics BC environment

Open `launch.json` file and change `environmentName` to the correct name of BC environment. You can find it in Dynamics BC admin panel:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-536.png)

!!!warning
You can use only environments with type **Sandbox** when developing. Production environments are not allowed.
!!!

Also, you need to add `tenant` property with your tenantID value, which can be found in Dynamics BC admin panel as well (in the URL):

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-537.png)

Here is an example of `launch.json` file:

```
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Microsoft cloud sandbox",
      "request": "launch",
      "type": "al",
      "environmentType": "Sandbox",
      "environmentName": "TestEnv",
      "tenant": "14ce8fa6-f5d2-4e8f-9362-8dfb5850e095",
      "startupObjectId": 22,
      "startupObjectType": "Page",
      "breakOnError": "All",
      "forceUpgrade": true,
      "launchBrowser": true,
      "enableLongRunningSqlStatements": true,
      "enableSqlInformationDebugger": true,
      "applicationFamily": "Wiise"
    }
  ]
}
```

Now press `Ctrl + Shift + P` and type command `AL: Download symbols` . This command is crucial for setting up your development environment with the necessary metadata from the base application and installed extensions.

Let's take a look at some of common issues, that can appear on current step, and how to solve them.

**Issue:** A package with publisher '**\[publisher\_name\]**', name '**\[application\_name\]**', and a version compatible with '**\[version\_number\]**' could not be found in the package cache folders: **\[path\_to\_project\]**

**Solution:** open `app.json` file and check `application` property. Value there should match your BC application environment version:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-538.png)

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-539.png)

In this case you should set:

```
"application": "23.0.0.0"
```

**Issue:** 'Namespace Support' is not available in runtime version '**\[current\_version\]**'. The supported runtime versions are: '**\[required\_version\]**' or greater.

**Solution:** open `app.json` file and check `runtime` property. In the VS Code debug tab you can see supported version, change it:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-540.png)

```
"runtime": "12.0"
```

### Difference between Sandbox and Production environments

**Production environment** - environment that a business can run their daily business in Business Central in, deployed on performance tiers in Azure with a guaranteed high level of availability and support. Production environments are backed up automatically and frequently to help protect business data.

Typically you can have one production environment. But, you can create additional production environments for training or performance testing. However, for training purposes, it's better to create a sandbox environment with production data. The reason why you can need additional production environments is to support offices in different countries/regions.

!!!info
Note that not all subscription types support multiple production environments
!!!

**Sandbox environment** - environments that you can play around with, use as a testbed for development, and delete at will. You can deploy apps straight from Visual Studio Code to a sandbox environment, and you can attach a debugging session to a sandbox. You can also safely use sandboxes for training, because it's a safe environment to experiment with. If anything goes wrong, you just delete the sandbox and start over.

You can create a sandbox environment that includes data from your production environment for debugging purposes.
