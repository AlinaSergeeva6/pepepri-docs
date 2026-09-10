---
title: "Configuration files structure"
order: 290
---
# Configuration files structure

Both Header and Body configs are .js files with special script which allows you to operate the view and functionality of your custom homepage.

## Header file internal structure.

#### Namespace.

The namespace of the header must be "customHeader".

#### Code description.

**You may find custom header code example file in attachment.** **Note: deeplink – part of the url call which used for navigation between elements within webapp.**

![](/static/4-1.png)

Where 1 is Transaction UUID, 2 is catalog/brand parameters**.**

|  |  |
| --- | --- |
| **Code** | Description |
| var customHeader = {}; | Namespace definition |
| (function() {}.apply(customHeader)); | Main executive function. |
| this.context;<br><br>this.accountUUID;<br><br>this.transactionName; | Context, account UUID,<br><br>transaction name global<br><br>variables. (Good example<br><br>of global |
| this.favIconURL = 'favicon url';<br><br>this.pageTitle = 'page Title'; | Fav Icon URL and page title.<br><br>**Notice: Since app.pepperi.com**<br><br>**runs over HTTPS all links for**<br><br>**includes (fonts, images, scripts, etc.)**<br><br>**must be provided from secure**<br><br>**(HTTPS) servers.**<br><br>**In other case you will**<br><br>**face the security error.** |
| this.setHtml = function() {<br><br>var str = "your html/css code here"<br><br>return str; } | In this function you allowed<br><br>to define your own HTML<br><br>representation of header.<br><br>**Notice: You may use HTML + CSS**<br><br>**bundle here defined as single**<br><br>**string wrapped into \`\` quotes.**<br><br>**HTML layout must have**<br><br>**&lt;header> tag for proper**<br><br>**functionality. For additional info –**<br><br>**see the example provided.** |
| this.initPlugin = function() {<br><br>var options = {<br><br>JsURLs: \[\],<br><br>cssURLs: \[\],<br><br>favIcon: this.favIconURL,<br><br>pageTitle: this.pageTitle<br><br>};<br><br>return options; | Header also initiates customization<br><br>plugin execution and<br><br>allows you to use config<br><br>files instead of using plain<br><br>code inside of the header file.<br><br>As you can see here fav url<br><br>and page title variables used<br><br>here. |
| this.onPluginLoad = function(context) {<br><br>this.context = context;<br><br>var data = JSON.parse(context.pluginData);<br><br>if (data) {<br><br>this.transactionName = data.typeName \|\| '';<br><br>this.accountUUID = data.accountUUID \|\| '';<br><br>}<br><br>this.getAccountStatus(); | On plugin load provides<br><br>entry point into custom<br><br>code execution. If you need<br><br>to initiate custom page with<br><br>some default stored values<br><br>(such as transaction name<br><br>and account uuid here), you<br><br>may do it in this function.<br><br>This function calls<br><br>getAccountStatus() for the<br><br>further execution. |
| this.getAccountStatus = function () {<br><br>var bridgeObject = {<br><br>fields: \['Name', 'UUID'\],<br><br>sorting: \[\],<br><br>responseCallback: 'customHeader.getCurrentAccountCallback'<br><br>};<br><br>pepperi.api.accounts.search(bridgeObject);<br><br>};<br><br>this.getCurrentAccountCallback = function (res) {<br><br>if (res && res.success && res.objects && res.objects.length)<br><br>this.accountUUID = res.objects\[0\].UUID; | You definitely need to<br><br>know which account<br><br>you **are** working with<br><br>so this function gives you such<br><br>an ability. |
| this.navigation = function(path) {<br><br>var eventData = {<br><br>detail: {<br><br>path: path<br><br>}<br><br>};<br><br>var event = new CustomEvent('navigateTo', eventData);<br><br>if (document.createEvent) {<br><br>window.dispatchEvent(event);<br><br>} else {<br><br>window.fireEvent('on' + event.eventType, event);<br><br>}<br><br>} | One of the most important<br><br>custom homepage functions.<br><br>It allow you to configure<br><br>transitions to internal Pepperi<br><br>deeplinks (to different catalogs<br><br>within order transaction.)<br><br>Basically this function used<br><br>within createNewOrder()<br><br>function which would be<br><br>described below |
| this.setSessionStorage = function(paramName, data) {<br><br>sessionStorage.setItem(paramName, data);<br><br>};<br><br>this.getSessionStorage = function(paramName) {<br><br>return sessionStorage.getItem(paramName);<br><br>}; | This two functions allow<br><br>you to store the information<br><br>you need in session storage.<br><br>The most typical usage –<br><br>store current transaction uuid<br><br>to prevent the creation of a<br><br>new transaction each time<br><br>when user switches between catalogs/transaction links |
| this.logout = function() {<br><br>var event = new CustomEvent('logout');<br><br>if (document.createEvent) {<br><br>window.dispatchEvent(event);<br><br>} else {<br><br>window.fireEvent('on' + event.eventType, event);<br><br>}<br><br>}; | Usage of this function allows<br><br>you to create the element with<br><br>logout functionality. Commonly<br><br>used with HTM onclick event like **customHeader.logout()** function. |
| this.changePassword = function() {<br><br>window.location.href = 'https://idp.pepperi.com/Account/ChangePassword';<br><br>}; | Calls Account/Change<br><br>Password |
| this.createNewOrder = function() {<br><br>let deepLink = 'Transactions/scope\_items/{{UUID}}?CurrentTab="%7B%5C"JsonFilter%5C":%5C"8dee937f-39ba-494b-b10d-8af30927d8b5%5C"%7D"';<br><br>deepLink = deepLink.replace(/\\"/g, '%22');<br><br>var bridgeObject = {<br><br>references: { account: { UUID: this.accountUUID },catalog: {Name: this.catalogName} },<br><br>type: { Name: this.transactionName },<br><br>responseCallback: 'customHeader.createNewOrderCallback',<br><br>requestID: deepLink<br><br>};<br><br>pepperi.app.transactions.add(bridgeObject);<br><br>}<br><br>this.createNewOrderCallback = function(res) {<br><br>if (res && res.success) {<br><br>if (Boolean(!this.typeName)) {<br><br>customHeader.setSessionStorage('LastOpenTransactionUUID', res.id);<br><br>}<br><br>let uuid = res.id;<br><br>if (res.requestID) {<br><br>var requestID = res.requestID.replace('{{UUID}}', uuid.replace(/-/g, ''));<br><br>customHeader.navigation(requestID);<br><br>}<br><br>} | One of the most important function. Provides the ability to create new order using Transaction Type Name, Catalog name and deeplink. Its callback function sets session storage with transaction uuid to prevent the creation of new transaction each time user switches between deeplinks. |

### Body file internal structure

#### Namespace

The namespace of the header must be "customHomepage".

#### Code description

**You may find custom body code example file in attachment.**

**Default body config has only 3 unique parts of code.**

|  |  |
| --- | --- |
| Code | Description |
| this.jsonFilePath =<br><br>'your config file url here'; | Config file URL |
| this.buildHTML = function () {} | Used together with config<br><br>file. Config file itself<br><br>contains transaction<br><br>names, deeplinks and<br><br>catalog names (see<br><br>config file example).<br><br>This function parses<br><br>config file, takes necessary<br><br>values and builds<br><br>appropriate html structure. |
| this.setUUIDandNav = function<br><br>(in\_catalog = null,<br><br>in\_transactionName = null, deepLink = null) | This function used in<br><br>previous one to perform<br><br>such actions as navigation<br><br>and new order creation.<br><br>Uses catalog name, transaction<br><br>name and deeplink from<br><br>config file as parameters. |
|  |  |

## Config.js structure

**You may find config.js example in attachment.**

Config.js is javascript file with bunch of constants you may change to achieve the view and functionality of custom homepage body (or header. Header needs separate config and config handling functions such as buildHtml() from body section to make more complex header functionality) you want.

|  |  |
| --- | --- |
| Code | Desctiption |
| const CATALOG\_NAME = "Default Catalog";<br><br>const TRANSACTION\_NAME = "Sales Order"; | Constants for catalog and<br><br>transaction name. It comes<br><br>in handy when you have<br><br>multiple transactions/catalogs<br><br>to operate. Feel free to use as<br><br>much definitions as you want. |
| const topImage = {}; | Top image here represents<br><br>the main image of the body.<br><br>Each image defined by config<br><br>file has its additional parameters<br><br>such as titles, subtitles, text<br><br>colors, etc. (see fig 5) |
| const newArrivals = \[\]; | Fig. 4. New arrivals part is<br><br>3 bottom images placed<br><br>under top image. |

**Notice. You can made the config file for you own purposes. Be aware that any changes of config file structure eg consts names, object names should be done also for buildHtml() function of body file because it uses cycle structure to parse the config file. The parse sequence based on constants names. See Fig 6.**

![](/static/5-2.png)

Fig 4. Top Image and new Arrivals presented

![](/static/6-2.png)

Fig 5. Titles

![](/static/7-1.png)

Fig 6. Config file parser convers constants data to appropriate html elements

11KB

[Example.rar](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-legacy-files/o/assets%2F-LfO_rsQzfnV957oTV_f%2F-MBt1qyXJPuIb-coUgUZ%2F-MBt22K0wwuiVsGfOy0K%2FExample.rar?alt=media&token=bb657cd3-96da-45df-84cf-59a03c7b7293)

[Open](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-legacy-files/o/assets%2F-LfO_rsQzfnV957oTV_f%2F-MBt1qyXJPuIb-coUgUZ%2F-MBt22K0wwuiVsGfOy0K%2FExample.rar?alt=media&token=bb657cd3-96da-45df-84cf-59a03c7b7293)
