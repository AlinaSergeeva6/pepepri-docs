# Dynamics BC - VS Code environment configuration

### Overview

Visual Studio Code is an essential tool for developing solutions and customisations for Dynamics 365 Business Central (BC). Here's why it is needed:

* **AL Language Development Environment** - all custom development in Dynamics BC is done using the AL programming language, which requires a modern code editor to write, manage, and debug the code effectively. VS Code provides robust support for AL language syntax highlighting, code completion, and debugging features.
* **Integration with Business Central** - VS Code is designed to connect directly to your Dynamics BC environment, allowing you to upload, test, and debug extensions in real time. Developers can easily publish their customisations directly to a BC sandbox environment from VS Code.
* **Error Detection and Debugging** - VS Code extensions support real-time error detection and debugging for AL code, ensuring higher code quality and faster troubleshooting.



### VS Code Extensions configuration

First of all, open VS Code and go to Extensions on the left bar. You need to install extensions listed below:

* **AL Language extension for Microsoft Dynamics 365 Business Central**

<figure><img src="../../../../.gitbook/assets/image (974).png" alt=""><figcaption></figcaption></figure>

* **AZ AL Dev Tools/AL Code Outline**

<figure><img src="../../../../.gitbook/assets/image (975).png" alt=""><figcaption></figcaption></figure>



### New project creation

Press `Ctrl + Shift + P` and type command `AL: Go!`

This will start the process of new project creating.

1. Select **location** for the new project. Folder (_test-project_ in this case) must not exist on your local machine - it will be created automatically:

<figure><img src="../../../../.gitbook/assets/image (976).png" alt=""><figcaption></figcaption></figure>

2. Select Dynamics BC **version**. If you are not sure which one to use, select the latest and change it in the configuration file later):

<figure><img src="../../../../.gitbook/assets/image (840).png" alt=""><figcaption></figcaption></figure>

3. Select **Microsoft cloud sandbox**:

<figure><img src="../../../../.gitbook/assets/image (841).png" alt=""><figcaption></figcaption></figure>

Initial configuration is finished. You’ll see some errors in the VS Code debug tab, don’t pay attention to them as we will fix everything at the next step.&#x20;



### Connecting to Dynamics BC environment

Open `launch.json` file and change `environmentName` to the correct name of BC environment. You can find it in Dynamics BC admin panel:

<figure><img src="../../../../.gitbook/assets/image (842).png" alt=""><figcaption></figcaption></figure>

{% hint style="warning" %}
You can use only environments with type **Sandbox** when developing. Production environments are not allowed.
{% endhint %}

Also, you need to add `tenant` property with your tenantID value, which can be found in Dynamics BC admin panel as well (in the URL):

<figure><img src="../../../../.gitbook/assets/image (843).png" alt=""><figcaption></figcaption></figure>

Here is an example of `launch.json` file:&#x20;

```json
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

{% tabs %}
{% tab title="Issue #1" %}
<mark style="color:red;">**Issue:**</mark> <mark style="color:red;"></mark><mark style="color:red;">A package with publisher '</mark><mark style="color:red;">**\[publisher\_name]**</mark><mark style="color:red;">', name '</mark><mark style="color:red;">**\[application\_name]**</mark><mark style="color:red;">', and a version compatible with '</mark><mark style="color:red;">**\[version\_number]**</mark><mark style="color:red;">' could not be found in the package cache folders:</mark> <mark style="color:red;"></mark><mark style="color:red;">**\[path\_to\_project]**</mark>

<mark style="color:green;">**Solution:**</mark> open `app.json` file and check `application` property. Value there should match your BC application environment version:

<figure><img src="../../../../.gitbook/assets/image (844).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../../../.gitbook/assets/image (845).png" alt=""><figcaption></figcaption></figure>

In this case you should set:

```json
"application": "23.0.0.0"
```
{% endtab %}

{% tab title="Issue #2" %}


<mark style="color:red;">**Issue:**</mark> <mark style="color:red;"></mark><mark style="color:red;">'Namespace Support' is not available in runtime version '</mark><mark style="color:red;">**\[current\_version]**</mark><mark style="color:red;">'. The supported runtime versions are: '</mark><mark style="color:red;">**\[required\_version]**</mark><mark style="color:red;">' or greater.</mark>

<mark style="color:green;">**Solution:**</mark> open `app.json` file and check `runtime` property. In the VS Code debug tab you can see supported version, change it:

<figure><img src="../../../../.gitbook/assets/image (923).png" alt=""><figcaption></figcaption></figure>

```json
"runtime": "12.0"
```
{% endtab %}
{% endtabs %}



### Difference between Sandbox and Production environments

**Production environment** - environment that a business can run their daily business in Business Central in, deployed on performance tiers in Azure with a guaranteed high level of availability and support.\
Production environments are backed up automatically and frequently to help protect business data.&#x20;

Typically you can have one production environment. But, you can create additional production environments for training or performance testing. However, for training purposes, it's better to create a sandbox environment with production data. The reason why you can need additional production environments is to support offices in different countries/regions.&#x20;

{% hint style="info" %}
Note that not all subscription types support multiple production environments
{% endhint %}



**Sandbox environment** - environments that you can play around with, use as a testbed for development, and delete at will. You can deploy apps straight from Visual Studio Code to a sandbox environment, and you can attach a debugging session to a sandbox.\
You can also safely use sandboxes for training, because it's a safe environment to experiment with. If anything goes wrong, you just delete the sandbox and start over.

You can create a sandbox environment that includes data from your production environment for debugging purposes.

