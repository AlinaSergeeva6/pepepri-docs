---
title: "Multiple Accounts Per Buyer"
description: "Estimated time to implement – 4h+"
order: 283
---
# Multiple Accounts Per Buyer

*Estimated time to implement – 4h+*

1.  **What is Multi-Account Buyer**

The ability for the buyer to create orders for different accounts that are connected to this buyer (if there is more than 1 account connected) and to select the account manually before starting the order creation.

1.  **How does it work**

If the buyer is connected to several accounts, a dropdown appears in the header (or in the body) with the list of all connected accounts. When creating an order, the selected account will be used to create a new transaction before opening it. After that, the dropdown will be disabled in the order center and cart to prevent you from changing your account during the order. You can change your account only on the home page.

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-120.png)

pic1

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-121.png)

pic2

If you have only one account connected you can hide account name or show it without dropdown

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-122.png)

pic3

1.  **What we should prepare**

Connect a few accounts to the test buyer with a simple CSV file in the back office:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-123.png)

pic4

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-124.png)

pic5

You can also get the list of all connected Account-Buyers with get request (this list is not available in Pepperi Resources in the IPaaS):

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-125.png)

pic6

Technically a buyer is a contact where ‘isBuyer’ field is ‘true’. Buyer is a user too, that’s why we upload it with UserExternalID.

After that we need to create a new UDT:

\- Table Name: MultipleAccounts - Main Key (Sales Rep External ID): UserExternalID - Secondary Key (Any): ‘1’ - Value: AccountUUID - Memory Management – none

The reason why we save the chosen account to UDT is using Pages for the body of Home page, we can’t take values from the header in Pages (Scripts) to create new transaction with the correct account.

1.  **How to implement**

First of all you need to download the header template in back office

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-126.png)

pic7

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-127.png)

pic8

“Export template files” to download the template. You get a .zip file to extract all files from. After making changes you should archive it back to .zip, before upload press “Remove template files” button, after that you will be able to select a new file and press ‘Upload zip file’.

All templates are different, but the main logic and function are the same, so you should find all needed functions where to add new functions.

Functions are located in the ‘template’ folder in ‘dynamic-header-template.js’.

Add new variables that will be in use

```
this.userID;
this.userName;
this.newAccountUUID;
this.allAccounts;
this.userExternalID;
```

To get userID we add a function to parse idp token from the Session Storage to the CustomConfigHeader object:

```
customConfigHeader.parseIdpToken = function () {
    var token = sessionStorage.getItem('idp_token')
    var base64Url = token.split('.')[1];
    var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
    var decoded = decodeURIComponent(window.atob(base64).split('').map(function(c) {
      return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
    }).join(''));
    var result = JSON.parse(decoded);
    customConfigHeader.userID = result["pepperi.id"]
    return '';
  }
```

You should add

```
customConfigHeader.parseIdpToken();
```

to

```
this.startup()
```

like:

```
this.startup = async function (parentContext, storage) {
    await customConfigHeader.parseIdpToken();
    await customConfigHeader.appendConfigFiles(storage);
    await customConfigHeader.setHeaderSettings();
    await customConfigHeader.buildHtml();
    await customConfigHeader.onPluginLoad(parentContext);
  };
```

When we get userID we need to get all connected accounts:

```
customConfigHeader.getAllAccounts = function () {
    return new Promise((resolve, reject) => {
      pepperi.api.accounts.search({
        fields: ["Name", "UUID", "ExternalID"],
        filter: {
          Operation: "AND",
          RightNode: {
            ApiName: "ParentExternalID",
            Operation: "IsEqual",
            Values: [""],
          },
          LeftNode: {
            ApiName: "Hidden",
            Operation: "IsEqual",
            Values: ["false"],
          },
        },
        responseCallback: "allAccountApiResponse"
      });

      allAccountApiResponse = function (res) {
        resolve(res);
      }
    })
  };
```

We add this function to this.onPluginLoad() and change it a little:

```
this.onPluginLoad = async function (context) {
    this.context = context;
    this.allAccounts = await customConfigHeader.getAllAccounts();

    var data = JSON.parse(context.pluginData);
    console.log("context--------------", context);
    this.accountUUID = this.getSessionStorage("accountUUID") || "";
    this.userName = context.userName || "";
    console.log("userName--------------", this.userName);
    if (data.accountUUID) {
      this.accountUUID = data.accountUUID;
      customConfigHeader.setSessionStorage("accountUUID", data.accountUUID);
      console.log("setSessionStorage- accountUUID 1")
      await customConfigHeader.getBuyerData(true, this.accountUUID);
    } else if (this.accountUUID) {
      await customConfigHeader.getBuyerData(true, this.accountUUID);
    } else if (!data.accountUUID && !this.accountUUID) {
      customConfigHeader.accountUUID = await customConfigHeader.getBuyerData();
    }

    let dynamicCulture =
      customConfigHeader.getSessionStorage('homepageLang') || context.culture
    let availableCultures = ["en", "ru", "en-US"]
    if (availableCultures.indexOf(dynamicCulture) == -1) dynamicCulture='en'
    customConfigHeader.dynamicallyLoadScript(dynamicCulture);
  };
```

Also change

```
customConfigHeader.getBuyerData()
```

```
/* Get buyer profile data */
  customConfigHeader.getBuyerData = async function (
    onlyAccountName = false,
    accountUUID = ""
  ) {
    return new Promise((resolve, reject) => {
      let bridgeObject = {
        fields: ["Name", "UUID", "ExternalID"],
        responseCallback: "getAllAccountsHeader",
      };
      if (onlyAccountName) {
        bridgeObject.filter = {
          ApiName: "UUID",
          Operation: "IsEqual",
          Values: [accountUUID],
        };
      }
      pepperi.api.accounts.search(bridgeObject);
      getAllAccountsHeader = function (data) {
        console.log("Get accounts callback", data);
        if (data && data.success && data.objects.length) {
          if (onlyAccountName) {
            document.getElementById(
              "account-name"
            ).innerHTML = `${data.objects[0]?.Name}(${data.objects[0]?.ExternalID})`;
            resolve();
        } else {
          customConfigHeader.setSessionStorage(
              "accountUUID",
              data.objects[0]?.UUID
            );
            console.log("setSessionStorage- accountUUID 2")
            document.getElementById(
              "account-name"
            ).innerHTML = `${data.objects[0]?.Name}(${data.objects[0]?.ExternalID})`;
            resolve(data.objects[0]?.UUID);
          }
        } else {
          resolve(false);
        }
      }

    })
  }
```

In the header we need to add a paragraph where we set the account name and id, so this.buildHtml() should be changed to include

. We can leave it ‘display: none’ if we don’t want to show the account when it’s the only one connected to the buyer.

```
this.buildHtml = function () {
    var str =
      `
        <header id="header-section" class="main-header header-wrapper" style="margin: 0 auto;">
            <div class="wrp">
              <div class="header-start">
                <img class="logo" onclick="customConfigHeader.navigation(\'HomePage\')" id="logo" src="" />
                <p id="account-name" style="display:none;"></p>
                <div id="header_btn_bar" class="links hidden-on-mobile">
                </div>
              </div>
              <div style="display: flex;">
              <div class="header-end" id="right_additional_menu">
              </div>
              </div>
            </div>
        </header>
        `;
    document.getElementById('custom_header_id').innerHTML = str;
  };
```

After this we need to add an account selector to the editor\_header-config.json file from the same folder. Find Buyer profile and add this to the ‘LeftMenu’ (can contain other objects already):

```
"LeftMenu": [
            {
                "Title": "",
                "Action": "accountSelector",
                "DeepLink": "",
                "Transaction": "",
                "Catalog": "",
                "Icon": ""
            }
        ]
```

After that the account selector will be added to the header in customConfigHeader.HeaderLeftMenu() function. So change it from this:

```
customConfigHeader.HeaderLeftMenu = async function (LeftMenu) {
  let htmlStr = "";
  for (const item of LeftMenu) {
      let classMenu = "link"
      let htmlTag = "a"
      if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
        classMenu = "link"
        htmlTag = "a"
      }
      if (window.innerWidth <= 960){
        classMenu = "active"
        htmlTag = "li"
      }
      htmlStr += `<${htmlTag}  class="${classMenu}" onclick="${customConfigHeader.handleAction(item)}">${item.Title}</${htmlTag}>`;
    }
    if (document.getElementById('menuDropdown')) {
      document.getElementById('menuDropdown').innerHTML += `<ul class="shown-on-mobile">${htmlStr}</ul><hr class="custom-hr shown-on-mobile">`;
    }
    if (document.getElementById('header_btn_bar')) {
      document.getElementById('header_btn_bar').innerHTML = htmlStr;
    }
    document.getElementById("userNameText").innerHTML = customConfigHeader.context.userName
}
```

To this:

```
customConfigHeader.HeaderLeftMenu = async function (LeftMenu) {
    let htmlStr = "";
    let htmlStrMobile = '';
    let accountSelectorBlock = '';
    let accountSelectorBlockMobile = '';
    let dropdownMenuMob = ''
    for (const item of LeftMenu) {
      if (item.Action == 'accountSelector') {
        let allAccountRes = customConfigHeader.allAccounts;
        customConfigHeader.allAccounts = allAccountRes;
        let arrowSvg = `<svg id="account-selector-dropdown-arrow" xmlns="http://www.w3.org/2000/svg" width="14" height="24" viewBox="0 0 24 24">
        <path fill-rule="evenodd"
            d="M5.80032148,9.28674354 L11.2542824,13.2027583 C11.6661309,13.585083 12.3338691,13.585083 12.7457176,13.2027583 L18.1996785,9.28674354 C18.611527,8.90441882 19.2792652,8.90441882 19.6911137,9.28674354 C20.1029621,9.66906826 20.1029621,10.2889391 19.6911137,10.6712638 L13.4914351,16.4265129 C12.6677383,17.1911624 11.3322617,17.1911624 10.5085649,16.4265129 L4.30888633,10.6712638 C3.89703789,10.2889391 3.89703789,9.66906826 4.30888633,9.28674354 C4.72073478,8.90441882 5.38847303,8.90441882 5.80032148,9.28674354 Z" />
        </svg>`;

        let mobileArrowSvg = `<svg id="account-selector-dropdown-arrow-mobile" xmlns="http://www.w3.org/2000/svg" width="14" height="24" viewBox="0 0 24 24">
        <path fill-rule="evenodd"
            d="M5.80032148,9.28674354 L11.2542824,13.2027583 C11.6661309,13.585083 12.3338691,13.585083 12.7457176,13.2027583 L18.1996785,9.28674354 C18.611527,8.90441882 19.2792652,8.90441882 19.6911137,9.28674354 C20.1029621,9.66906826 20.1029621,10.2889391 19.6911137,10.6712638 L13.4914351,16.4265129 C12.6677383,17.1911624 11.3322617,17.1911624 10.5085649,16.4265129 L4.30888633,10.6712638 C3.89703789,10.2889391 3.89703789,9.66906826 4.30888633,9.28674354 C4.72073478,8.90441882 5.38847303,8.90441882 5.80032148,9.28674354 Z" />
        </svg>`;

        if (allAccountRes.success) {
          allAccountRes.objects.forEach((element) => {
            if (customConfigHeader.getSessionStorage("accountUUID") && customConfigHeader.getSessionStorage("accountUUID") != '' && customConfigHeader.removeDelimer(element.UUID) == customConfigHeader.removeDelimer(customConfigHeader.getSessionStorage("accountUUID"))) {
              customConfigHeader.accountUUID = customConfigHeader.removeDelimer(element.UUID);
              customConfigHeader.setSessionStorage("accountUUID", customConfigHeader.removeDelimer(element.UUID));
              customConfigHeader.setMultipleAccount(customConfigHeader.userID,customConfigHeader.removeDelimer(element.UUID))
              customConfigHeader.selectedAccount = `<span>${element.Name.replace(/[\_'`()]/g, "")}</span>`;
            }
          });
          let hideSelectorOnOneAccount = allAccountRes.objects.length > 1 ? "" : 'style="display: none;"';
          accountSelectorBlock = `<div id="account-selector" class="header-account-selector-box" ${hideSelectorOnOneAccount}>
          <div id="account-selector-dropdown" class="header-account-selector-box-dropdown ${allAccountRes.objects.length > 1 ? '' : 'header-account-selector-box-dropdown-disabled'}" ${allAccountRes.objects.length > 1 ? 'onclick="customConfigHeader.openStoreSelect()"' : ''}>
            <p role="label" id="selected-account-header">${customConfigHeader.selectedAccount}</p>
            <ul class="header-account-selector-box-dropdown-fit" id="select-menu" role="select">`;

          accountSelectorBlockMobile = `<div id="account-selector" class="dropdown-mob mobile-account-selector" ${hideSelectorOnOneAccount}>\
          <div id="account-selector-mobile" class="dropdown-mob-info mobile-account-selector-dropdown ${allAccountRes.objects.length > 1 ? '' : 'header-account-selector-box-dropdown-disabled'}" ${allAccountRes.objects.length > 1 ? 'onclick="customConfigHeader.openStoreSelectMobile(this)"' : ''}>\
            <p role="label" id="selected-account-header">${customConfigHeader.selectedAccount}</p>${allAccountRes.objects.length > 1 ? mobileArrowSvg : ''}</div>\
            <ul class="mobile-account-selector-box-dropdown-fit" id="select-menu-mobile" role="select">`;

          allAccountRes.objects.forEach((element) => {
            accountSelectorBlock += `<li class="active" onclick="customConfigHeader.setActiveDropdown('${element.UUID}','<span>${element.Name.replace(/[\_'`()]/g, "")}</span>')" id="${element.UUID}"><span>${element.Name.replace(/[\_'`()]/g, "")} </span></li>`;
            accountSelectorBlockMobile += `<li class="active" onclick="customConfigHeader.setActiveDropdown('${element.UUID}','<span>${element.Name.replace(/[\_'`()]/g, "")}</span>')" id="${element.UUID}"><span>${element.Name.replace(/[\_'`()]/g, "")} </span></li>`;
          });

          accountSelectorBlockMobile += `</ul></div>`;
          accountSelectorBlock += `</ul>
                ${allAccountRes.objects.length > 1 ? arrowSvg : ''}
              </div>
            </div>`;
        } else {
          accountSelectorBlock = `<div id="account-selector" class="account-selector-box">
            <label class="title-1-xs" for="order-for">Order for:</label>
              <div class="account-selector-box-dropdown" onclick="customConfigHeader.openStoreSelect(this)">
                <p role="label" id="selected-account-header">Select a store</p>
                <ul class="account-selector-box-dropdown-fit" id="select-menu" role="select"></ul>
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                  <path fill-rule="evenodd"
                    d="M5.80032148,9.28674354 L11.2542824,13.2027583 C11.6661309,13.585083 12.3338691,13.585083 12.7457176,13.2027583 L18.1996785,9.28674354 C18.611527,8.90441882 19.2792652,8.90441882 19.6911137,9.28674354 C20.1029621,9.66906826 20.1029621,10.2889391 19.6911137,10.6712638 L13.4914351,16.4265129 C12.6677383,17.1911624 11.3322617,17.1911624 10.5085649,16.4265129 L4.30888633,10.6712638 C3.89703789,10.2889391 3.89703789,9.66906826 4.30888633,9.28674354 C4.72073478,8.90441882 5.38847303,8.90441882 5.80032148,9.28674354 Z" />
                </svg>
              </div>
          </div>`;
        }
        htmlStrMobile += htmlStr;
        htmlStrMobile += accountSelectorBlockMobile;
        htmlStr += accountSelectorBlock;
      } else {
        let classMenu = "button-weak hidden-on-web";
        let htmlTag = "button";
        if (
          /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(
            navigator.userAgent
          )
        ) {
          classMenu = "button-weak hidden-on-web";
          htmlTag = "button";
        }
        if (window.innerWidth <= 960) {
          classMenu = "active";
          htmlTag = "li";
        }
        htmlStr += `<${htmlTag}  class="${classMenu}" onclick="${customConfigHeader.handleAction(
          item
        )}">${item.Title}</${htmlTag}>`;
        dropdownMenuMob += `<li class="active" onclick="${this.handleAction(item)}"><p>${item.Title}</p></li>`
      }
    }
    if (document.getElementById("menuDropdown")) {
      document.getElementById("menuDropdown").innerHTML = `<ul class="shown-on-mobile">${htmlStrMobile}</ul><hr class="custom-hr shown-on-mobile">` + document.getElementById("menuDropdown").innerHTML;
    }
    if (document.getElementById("header_btn_bar")) {
      document.getElementById("header_btn_bar").innerHTML = htmlStr;
    }
    document.getElementById("userNameText").innerHTML = this.userName;
  };
```

After add next functions somewhere to the bottom of the functions list:

```
/* Removing '-' in the string */
    customConfigHeader.removeDelimer = function (str) {
        return str.replace(/-/g, "");
    };
customConfigHeader.setMultipleAccount = function (userID, accountUUID) {
        customConfigHeader.newAccountUUID = accountUUID;
        customConfigHeader.getUserExternalID(userID);
    };
    customConfigHeader.getUserExternalID = function (id) {
        pepperi.api.users.search({
            fields: ["UUID", "ExternalID", "InternalID"],
            filter: {
                ApiName: "InternalID",
                Operation: "IsEqual",
                Values: ["" + id],
            },
            pageSize: 1000,
            page: 1,
            responseCallback: "customConfigHeader.getUserExternalIDCallback",
        });
    };
    customConfigHeader.getUserExternalIDCallback = function (res) {
        customConfigHeader.userExternalID = res.objects[0].ExternalID;
        pepperi.api.userDefinedTables.upsert({
            table: "MultipleAccounts",
            mainKey: "" + customConfigHeader.userExternalID,
            secondaryKey: "1",
            value: customConfigHeader.newAccountUUID,
            responseCallback: "customConfigHeader.upsertUDTCallback",
        });
    };
    customConfigHeader.upsertUDTCallback = function (res) {
      if (res && res.success) {
        console.log("UDT updated with selected Account successfully", res);
      } else {
        console.error("UDT was not updated with selected account", res);
      }
    };
```

Now connected accounts should appear in the header but dropdown has no styles.

Before css part add a function that will check the location in the url to be ‘/HomePage’, if not we disable the dropdown. Add this functions to the end of the list:

```
customConfigHeader.setActiveDropdown = function (uuid, name) {
        customConfigHeader.accountUUID = uuid;
        customConfigHeader.setSessionStorage("accountUUID", uuid);
        customConfigHeader.selectedAccount = name;
        document.getElementById("selected-account-header").innerHTML = name;
        customConfigHeader.setMultipleAccount(customConfigHeader.userID, uuid);
        location.reload();
    };
    customConfigHeader.enableAccountSelector = function () {
        if (document.getElementById("account-selector-dropdown")) {
            if (customConfigHeader.allAccounts.objects.length > 1) {
                let arrowElem = document.getElementById(
                    "account-selector-dropdown-arrow"
                );
                if (arrowElem) arrowElem.style.display = "inline-block";
                document
                    .getElementById("account-selector-dropdown")
                    .setAttribute(
                        "onclick",
                        "customConfigHeader.openStoreSelect()"
                    );
                document
                    .getElementById("account-selector-dropdown")
                    .classList.remove(
                        "header-account-selector-box-dropdown-disabled"
                    );
            }
        }

        if (document.getElementById("account-selector-mobile")) {
            if (customConfigHeader.allAccounts.objects.length > 1) {
                let arrowElem = document.getElementById(
                    "account-selector-dropdown-arrow-mobile"
                );
                if (arrowElem) arrowElem.style.display = "inline-block";
                document
                    .getElementById("account-selector-mobile")
                    .setAttribute(
                        "onclick",
                        "customConfigHeader.openStoreSelectMobile(this)"
                    );
                document
                    .getElementById("account-selector-mobile")
                    .classList.remove(
                        "header-account-selector-box-dropdown-disabled"
                    );
            }
        }
    };

    customConfigHeader.disableAccountSelector = function () {
        if (document.getElementById("account-selector-dropdown")) {
            let arrowElem = document.getElementById(
                "account-selector-dropdown-arrow"
            );
            if (arrowElem) arrowElem.style.display = "none";
            document
                .getElementById("account-selector-dropdown")
                .removeAttribute("onclick");
            document
                .getElementById("account-selector-dropdown")
                .classList.add("header-account-selector-box-dropdown-disabled");
        }
        if (document.getElementById("account-selector-mobile")) {
            let arrowElem = document.getElementById(
                "account-selector-dropdown-arrow-mobile"
            );
            if (arrowElem) arrowElem.style.display = "none";
            document
                .getElementById("account-selector-mobile")
                .removeAttribute("onclick");
            document
                .getElementById("account-selector-mobile")
                .classList.add("header-account-selector-box-dropdown-disabled");
        }
    };
    customConfigHeader.displayAccountSelector = function () {
        if (document.location.href.includes("/HomePage")) {
            customConfigHeader.enableAccountSelector();
        } else {
            customConfigHeader.disableAccountSelector();
        }
    };
    customConfigHeader.openStoreSelect = function () {
        var dropdown = document.getElementById("select-menu");
        $("#select-menu").toggleClass("show").focus();
    };

    customConfigHeader.openStoreSelectMobile = function (data) {
        var dropdown = document.getElementById("select-menu-mobile");
        $("#select-menu-mobile").toggle("show");
        $("#select-menu-mobile").toggleClass("show");
    };
```

And we need to call it, add to the end of this.startup() function an interval function to check location:

```
setInterval(customConfigHeader.displayAccountSelector, 700);
```

Also to the end of customConfigHeader.navigation() function:

```
customConfigHeader.displayAccountSelector();
```

After that copy this styles to the ‘food-header.css’ file in the ‘header’ folder:

```
/* Account selector */

#account-name {
  margin: 0;
  padding-left: 1em;
  font-weight: bold;
  font-size: 16px;
  width: 27rem;
}

.header-account-selector-box {
  height: 2.5rem;
  max-width: 100%;
  border-radius: 4px;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -ms-flex-direction: column;
  flex-direction: column;
  -webkit-box-pack: justify;
  -ms-flex-pack: justify;
  justify-content: space-between;
  gap: 0.875rem;
}

.header-account-selector-box-dropdown {
  background-color: rgba(255, 255, 255, 0.75);
  border-radius: 4px;
  -webkit-transition: background ease-in-out 0.25s;
  transition: background ease-in-out 0.25s;
  font-size: 0.875rem;
  border-radius: 4px;
  height: 100%;
  max-width: 100%;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  -webkit-box-pack: justify;
      -ms-flex-pack: justify;
          justify-content: space-between;
  padding: 0 1em;
  position: relative;
  cursor: pointer;
  color: black;
}
.header-account-selector-box-dropdown:hover {
  color: #ffffffe6;
  background-color: rgb(255 255 255 / 40%);
  -webkit-box-shadow: 0 2px 4px rgba(0, 0, 0, 0.02), 0 4px 8px rgba(0, 0, 0, 0.04);
          box-shadow: 0 2px 4px rgba(0, 0, 0, 0.02), 0 4px 8px rgba(0, 0, 0, 0.04);
}
.header-account-selector-box-dropdown:active, .header-account-selector-box-dropdown:focus {
  -webkit-box-shadow: rgb(0 15 36 / 32%) 0px 4px 8px 0px;
  box-shadow: rgb(0 15 36 / 32%) 0px 4px 8px 0px;
  outline: none;
}

.mobile-account-selector {
  border-radius: 4px;
}

.mobile-account-selector-dropdown {
  border-radius: 4px;
  -webkit-transition: background ease-in-out 0.25s;
  transition: background ease-in-out 0.25s;
  border-radius: 4px;
  padding: 0 1em;
  cursor: pointer;
  color: black;
}
.mobile-account-selector-dropdown:hover {
  background-color: rgba(10, 10, 10, 0.08);
  -webkit-box-shadow: 0 2px 4px rgba(0, 0, 0, 0.04), 0 4px 8px rgba(0, 0, 0, 0.08);
          box-shadow: 0 2px 4px rgba(0, 0, 0, 0.04), 0 4px 8px rgba(0, 0, 0, 0.08);
}
.mobile-account-selector-dropdown:active, .mobile-account-selector-dropdown:focus {
  -webkit-box-shadow: rgb(0 15 36 / 32%) 0px 4px 8px 0px;
  box-shadow: rgb(0 15 36 / 32%) 0px 4px 8px 0px;
  outline: none;
}

.mobile-account-selector-box-dropdown-fit {
  max-width: 100%;
}

.mobile-account-selector-box-dropdown-fit:active, .mobile-account-selector-box-dropdown-fit:focus {
  border: 1px solid #0a0a0a;
  -webkit-box-shadow: rgb(0 15 36 / 32%) 0px 4px 8px 0px;
  box-shadow: rgb(0 15 36 / 32%) 0px 4px 8px 0px;
  outline: none;
} */

.mobile-account-selector-box-dropdown-fit li {
  color: black;
  border-radius: 4px;
  cursor: pointer;
}

.mobile-account-selector-box-dropdown-fit li:last-child {
  margin-bottom: 0;
}

.mobile-account-selector-box-dropdown-fit li:hover {
  background-color: rgba(10, 10, 10, 0.08);
  color: #0a0a0a;
}

.mobile-account-selector-box-dropdown-fit svg {
  -webkit-margin-end: var(--dd-space-3);
          margin-inline-end: var(--dd-space-3);
  fill-opacity: 0.8;
  -webkit-transition: fill-opacity ease-in-out 0.25s;
  transition: fill-opacity ease-in-out 0.25s;
}

.mobile-account-selector-box-dropdown-fit svg:hover {
  fill-opacity: 1;
}

.header-account-selector-box-dropdown p {
  font-size: 0.87rem;
  position: relative;
  overflow: hidden;
  padding: .5rem;
  line-height: normal;
}

.header-account-selector-box-dropdown svg {
  fill: black;
  opacity: 0.4;
  min-width: 1.5rem;
  min-height: 1.5rem;
  max-width: 2rem;
  max-height: 3rem;
  padding: .2rem;
  transition: all ease-in-out 0.25s;
}

#account-selector-mobile:hover svg {
  fill: black;
  opacity: 1;
  fill-opacity: 1;
}

.dropdown-mob:hover .dropdown-mob-info svg {
  fill: black;
  opacity: 1;
  fill-opacity: 1;
}

.header-account-selector-box-dropdown:hover svg {
  opacity: 1;
}
.header-account-selector-box-dropdown select {
  padding: 0.5rem;
  margin-top: 0;
  z-index: 1;
  width: 100%;
  font-size: inherit;
  border: 0;
  background: none;
  outline: none;
  height: 40px;
  line-height: 40px;
}
.header-account-selector-box-dropdown-fit {
  background: white;
  border-radius: 4px;
  -webkit-box-shadow: 0 2px 4px rgba(0, 0, 0, 0.02), 0 4px 8px rgba(0, 0, 0, 0.04);
          box-shadow: 0 2px 4px rgba(0, 0, 0, 0.02), 0 4px 8px rgba(0, 0, 0, 0.04);
  -webkit-transition: all ease-in-out 0.15s;
  transition: all ease-in-out 0.15s;
  display: none;
  font-size: 0.875rem;
  padding: var(--dd-space-2);
  position: absolute;
  min-width: -webkit-max-content;
  min-width: -moz-max-content;
  min-width: max-content;
  max-height: 90vh;
  top: 100%;
  left: 0;
  overflow-y: auto;
  overflow-x: hidden;
  z-index: 999;
}
.header-account-selector-box-dropdown-fit:hover {
  -webkit-box-shadow: 0 2px 4px rgba(0, 0, 0, 0.04), 0 4px 8px rgba(0, 0, 0, 0.08);
          box-shadow: 0 2px 4px rgba(0, 0, 0, 0.04), 0 4px 8px rgba(0, 0, 0, 0.08);
}

.header-account-selector-box-dropdown-fit:active, .header-account-selector-box-dropdown-fit:focus {
  border: 1px solid #0a0a0a;
  -webkit-box-shadow: rgb(0 15 36 / 32%) 0px 4px 8px 0px;
  box-shadow: rgb(0 15 36 / 32%) 0px 4px 8px 0px;
  outline: none;
}

.header-account-selector-box-dropdown-fit hr {
  margin: var(--dd-space-2) auto;
}

.header-account-selector-box-dropdown-fit ul {
  list-style: none;
  margin: 0;
}

.header-account-selector-box-dropdown-fit p {
  padding: var(--dd-space-2);
}

.header-account-selector-box-dropdown-fit li {
  line-height: 1.5rem;
  color: black;
  border-radius: 4px;
  padding: var(--dd-space-2) var(--dd-space-3);
  cursor: pointer;
  -webkit-transition: background-color ease-in-out 0.25s;
  transition: background-color ease-in-out 0.25s;
  margin-bottom: var(--dd-space-1);
  padding: 0.5rem;
}

.header-account-selector-box-dropdown-fit li:last-child {
  margin-bottom: 0;
}

.header-account-selector-box-dropdown-fit li:hover {
  background-color: rgba(10, 10, 10, 0.08);
  color: #0a0a0a;
}

.header-account-selector-box-dropdown-fit li span {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
}

.header-account-selector-box-dropdown-fit svg {
  -webkit-margin-end: var(--dd-space-3);
          margin-inline-end: var(--dd-space-3);
  fill-opacity: 0.8;
  -webkit-transition: fill-opacity ease-in-out 0.25s;
  transition: fill-opacity ease-in-out 0.25s;
}

.header-account-selector-box-dropdown-fit svg:hover {
  fill-opacity: 1;
}

.header-account-selector-box-dropdown-fit .active-dropdown-item {
  background-color: #0a0a0a;
  color: white;
}
/* Account selector disabled */
.header-account-selector-box-dropdown-disabled {
  color: white;
  background-color: rgba(255, 255, 255, 0.25);
  cursor: default;
}
.header-account-selector-box-dropdown-disabled:hover {
  -webkit-box-shadow: 0 2px 4px rgba(0, 0, 0, 0.02), 0 4px 8px rgba(0, 0, 0, 0.04);
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.02), 0 4px 8px rgba(0, 0, 0, 0.04);
}
.header-account-selector-box-dropdown-disabled:active, .header-account-selector-box-dropdown-disabled:focus {
  -webkit-box-shadow: rgb(0 15 36 / 32%) 0px 4px 8px 0px;
  box-shadow: rgb(0 15 36 / 32%) 0px 4px 8px 0px;
  outline: none;
}
.header-account-selector-box-dropdown-disabled:hover svg {
  fill-opacity: 0.5;
}
/* Account selector end */
```

And you should see dropdown like this:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-128.png)

pic9

1.  **How to test**

To be sure that everything works correctly you need to check if MultipleAccounts UDT updates after changes in dropdown:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-129.png)

pic10

In the body we should have connected Pages, and small changes should be added to Scripts that are in use in the body and start and create new transactions or activities.

At the start of scripts there is a variable:

```
let accountUUID: string;
```

We need to add a function to take account UUID from UDT and reset this variable:

```
let accountUUIDFromUDT = await pepperi.api.userDefinedTables.getList({
        table: "MultipleAccounts",
    });
accountUUID = accountUUIDFromUDT.objects[0].value;
```

We don’t use the Main Key and Secondary Key in the params of API call to get data because of Main Key type. It’s ‘Sales Rep External ID’ type and the UDT can return only one row for the Buyer where Buyer ExternalID (UserExternalID) is equal to Main Key.

After these changes all created transactions should have the correct account in transaction data.
