---
title: "Publitas"
description: "Effort Estimation:"
order: 94
---
# Publitas

*Effort Estimation:*

### Description:

Publitas is a cloud-based platform that empowers businesses to create and publish interactive digital catalogs, brochures, and magazines. It offers a user-friendly interface and a wide range of features, making it an ideal tool for businesses of all sizes to showcase their products and engage customers.

!!!warning
**Important!** The customer must provide developer credentials to log in to Publitas.
!!!

!!!info
Publitas documentation is [here](https://support.publitas.com/).
!!!

### Advantages and disadvantages

!!!success
Publitas offers a wide range of features that allow you to create interactive and attractive publications.
!!!

!!!success
Can help a client increase sales by showcasing products in an attractive and interactive format.
!!!

!!!danger
It works only online.
!!!

### Demo - how does it work:

#### iPaaS integration:

Integration requires 2 UI tasks: 1. Publitas Generic Entry Point: [here](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=84730) 2. Publitas Generic Item Hotspot: [here](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=84731) The first one opens the publication on Publitas in a new iframe, and the other one opens the product(s) data from Pepperi with which the user interacts in a new iframe. After that, the two UI tasks communicate with each other using messages. To call the second UI task, a script is added to Publicas that launches this task by passing the ID of the selected product(s).

#### Publitas publications

To connect to a Publitas publication, the client needs to create it or create your own test publication. To do this, log in to Publitas and select the Publications button, as shown in the screenshot. You can duplicate existing publication

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/publications.jpg)

publications

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/publications2.jpg)

!!!warning
Make sure that the publication you intend to use is not offline. You will not be able to connect to such a publication.
!!!

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/publications3.jpg)

#### Publitas Injection

To enable the launch of the second UI task, you need to paste the code into Custom code injection. The code you can find in the How to copy to another environment section.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/injection.jpg)

injection

#### Publitas HotSpot

A Publitas Hotspot is an interactive element that can be added to Publitas publications such as catalogs, brochures, and magazines. A hotspot can be of any shape and size, and it can be linked to various actions. In our case, we will use a Hotspot to open the second UI task and add items to Pepper's cart (Product Hotspot). To create a Product Hotspot go to the Publications and press edit on the publication. Draw a new Hotspot and add some product. How to add products to the Publitas we will consider in the next section (How to copy to another environment).

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Hotspot.jpg)

edit publication

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Hotspot2.jpg)

add hotspot

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Hotspot3.jpg)

draw hotspot

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Hotspot4.jpg)

add product

That's it for the main integration. Now, after running Publitas from the Pepperi, the publication will first open, and after clicking on the Hotspot, a window with product information will open. Then you can add a certain quantity of the product and click the Send to Cart button. After that, close the Publitas.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/indaba1.jpg)

open catalog

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/indaba2.jpg)

open hotspot

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/indaba3.jpg)

send to cart

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/indaba4.jpg)

close publitas

You can see how the required quantity of the product was added to the cart and all the calculations were done automatically in Pepperi.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/indaba5.jpg)

pepperi's cart

### How to copy to another environment:

#### iPaSS

Copy these two tasks to your environment:

1\. **Publitas Generic Entry Point**: 👉 [here](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=84730) 2. **Publitas Generic Item Hotspot**: 👉 [here](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=84731)

Open the ui\_page\_body setting first task and go to the "mountPublitas" function block. This function creates a script with attributes which open the publication.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Point1.jpg)

mount Publtas

The currentItem and currentCatalog variables are used for multiple Publitas publications and dynamic hotspots (to open a specific product in a publication automatically). We will consider this type of setup in the upcoming **"Advanced configuration**" section if you need it. Here let's look at a simple configuration with opening a single publication. In this way you need to comment this logic. In this case, you need to comment out the part of the code with these variables as shown in the screenshot.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Point2.jpg)

comment the code

Then you have to change the link to the publication in the **data-publication** attribute. Go to the Publitas -> Publications -> Share button and copy the link. Put the link to the attribute.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Point3.jpg)

publication link

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Point4.jpg)

set link

The example uses the additional TSANetSuiteID field for the logic of adding an item. If you have an ItemExternalID field or some other TSA field, you must change it in both UI tasks. You also need to change all the fields you will use to display product information. Go to the getItemPageData function in the Publitas Generic Entry Point task.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/configuration1.jpg)

configutation

In the Publitas Generic Item Hotspot task go to the createHtml function and change the field names that you need. You can also configure html below, depending on what you need to display to the user.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/configuration2.jpg)

html

Also, the current logic supports the use of multiple products in one a Hotspot. A user selects a Hotspot and when it opens, several products can be seen.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/configuration3.jpg)

multiple products

#### Backoffice

Create a Program with a Custom form which will open the **Publitas Generic Entry Point** UI task. Add the Program to the cart menu or another place where you want to launch Publitas.

#### Publitas

First, you need to upload products to Publitas if the client hasn't done it. Copy the [Publitas Export Products](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=84732) dataflow task to your environment. In this example, we get items from Pepperi with 2 columns TSANetSuiteID and Name. You may need to change TSANetSuiteID to ExternalID or another TSA field that your client uses. If yes, change it in the Mappings tab as well.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Feed1.jpg)

products

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Feed2.jpg)

expressions

Run the task and after it is finished go to the logs and copy the file link.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Feed3.jpg)

link

Go to Publitas -> Product Feed put the link to the Product data and press the **Import Product Feed** button. When Product feed is finished, you can add Hotspot to the publication. When Product feed is finished, you can add Hotspot to the publication.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Feed4.jpg)

feed products

Next is to add the injection. Open the second **Publitas Generic Item Hotspot** UI task and copy a RunAddOn URL from the Details tab. **Change the const ipaasUiTaskUrl variable to your link**.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot_1.jpg)

task link

**👈 Injection code**

```
<html>
  <head>
    <script>
      const ipaasUiTaskUrl = "https://integration.pepperi.com/ui_tasks/PageTask/RunAddOn?page_url=https%3a%2f%2fintegration.pepperi.com%2fui_tasks%2fPageTask%2fRun%3fClientToken%..........%26TaskName%3dPublitas%2bGeneric%2bItem%2bHotspot&tabTitle=Run+Add-on+Test";

      window.viewerReady = function (api, platform) {
        var publication = api.publication;

        /*
         * Assuming your publication url is:
         * https://view.publitas.com/my-group/my-publication/
         */
        publication.slug; // 'my-publication'
        publication.groupSlug; // 'my-group'

        api.setProductAction(function (products) {
          //console.log("setProductAction", products);
          if (products.length < 1) return;

          const productsData = products.map((el) => el.webshopIdentifier).join(",");
          console.log("setProducts", productsData);

          api.showExternalContent(ipaasUiTaskUrl + `&itemId=${productsData}`);
        });
      };

      //to close the item info window
      window.addEventListener("message", function (message) {
        //console.log("ON MESSAGE FROM INJECTION: " + message);
        if (message.data == "pepperiAddedToCart") {
          document.querySelector("#popup_close").click();
        }
      });
    </script>
  </head>

  <body></body>
</html>
```

Go to the Publitas settings -> Publication Reader -> Advanced settings. Put the code and save it.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/injection2.jpg)

injection

Now you can run Publitas from a Pepperi order and see your publication.

!!!warning
If the custom code injection doesn't work, you can reach out to Publitas support at **support@publitas.com**
!!!

#### Matrix Items

#### If your client uses matrix items in Pepperi, you'll need to adjust the UI tasks logic accordingly to support this functionality.

Task examples that support matrix items as well:

1\. **Publitas Generic Entry Point (Matrix Items)**: 👉 [here](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=89267) 2. **Publitas Generic Item Hotspot (Matrix Items)**: 👉 [here](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=89268)

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Matrix_1.jpg)

matrix items in Publitas

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Matrix_2.jpg)

matrix items in the cart

### Advanced configuration:

In this section, we'll look at a few options for expanding the usage of Publitas inside Pepperi. Using multiple publications and a direct link to a Hotspot, launching Publitas from Pages and using Launch Page.

#### Multiple publications & Hotspot

The Publitas Generic Entry Point UI task includes logic to use different publications and a Hotspot id. In a transaction, you can create fields like TSACatalogToNavigate and TSAItemToNavigate.

!!!warning
Change the default publication name and the part of the URL to your own. The default publication will be used if no publication name has been passed.
!!!

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/multiple1.jpg)

default catalog

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/multiple4.jpg)

url

You can play with this logic as you need. For example, change the publication depending on the type of transaction. In our case, before Publitas launches, the user has the option to select the required publication. This is implemented through an additional custom form and a UDT with publication names.

UDT: Parameters

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/multiple3.jpg)

catalogs

**👈 Custom form (choose a publication) code**

```
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Reason</title>
  </head>
  <style>
    @font-face {
        font-family: "Indaba-Optima";
        src: url("https://storage.pepperi.com/General/Fonts/Optima.ttc") format("truetype");
      }

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
    }

    .k-loading-image {
      display: none;
    }

    .k-loading-color {
      opacity: 1;
    }

    #loader {
      opacity: 1;
    }

    #loadingText {
      padding: 8px;
      font-size: 16px;
      border: 1px solid rgba(0, 0, 0, 0.6);
    }

    #loaderAnimation,
    #loader {
      text-align: center;
      position: absolute;
      top: 25%;
      left: 50%;
      transform: translate(-50%, -50%);
    }

    .swing-xy {
      display: -webkit-box;
      display: -ms-flexbox;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      align-items: center;
    }

    .swing-xy span {
      position: absolute;
      width: 40px;
      height: 40px;
      background: rgb(82, 79, 77);
      border-radius: 100%;
    }

    .swing-xy span:nth-child(1) {
      -webkit-animation: cross-x 1.5s infinite ease-in-out;
      animation: cross-x 1.5s infinite ease-in-out;
    }

    .swing-xy span:nth-child(2) {
      animation: cross-x 1.5s infinite ease-in-out reverse;
    }

    .swing-xy span:nth-child(3) {
      -webkit-animation: cross-y 1.5s infinite ease-in-out;
      animation: cross-y 1.5s infinite ease-in-out;
    }

    .swing-xy span:nth-child(4) {
      animation: cross-y 1.5s infinite ease-in-out reverse;
    }

    @-webkit-keyframes cross-x {
      0% {
        -webkit-transform: translateX(-48px);
        transform: translateX(-48px);
        opacity: 1;
      }

      50% {
        opacity: 0.5;
      }

      100% {
        -webkit-transform: translateX(48px);
        transform: translateX(48px);
        opacity: 1;
      }
    }

    @keyframes cross-x {
      0% {
        -webkit-transform: translateX(-48px);
        transform: translateX(-48px);
        opacity: 1;
      }

      50% {
        opacity: 0.5;
      }

      100% {
        -webkit-transform: translateX(48px);
        transform: translateX(48px);
        opacity: 1;
      }
    }

    @-webkit-keyframes cross-y {
      0% {
        -webkit-transform: translateY(-48px);
        transform: translateY(-48px);
        opacity: 1;
      }

      50% {
        opacity: 0.5;
      }

      100% {
        -webkit-transform: translateY(48px);
        transform: translateY(48px);
        opacity: 1;
      }
    }

    @keyframes cross-y {
      0% {
        -webkit-transform: translateY(-48px);
        transform: translateY(-48px);
        opacity: 1;
      }

      50% {
        opacity: 0.5;
      }

      100% {
        -webkit-transform: translateY(48px);
        transform: translateY(48px);
        opacity: 1;
      }
    }
    .wrapper {
      font-family: "Indaba-Optima";
      display: none;
      flex-direction: column;
      align-items: center;
    }

    .title {
      margin-bottom: 15px;
    }
    .catalogDropdown {
      margin-bottom: 20px;
      padding: 5px;
      font-size: 16px;
    }

    .option {
    }

    .saveButton {
      padding: 15px;
      font-size: 20px;
      font-weight: 600;
      color: white;
      background-color: hsl(38, 40.6%, 53.1%);
      border-radius: 4px;
      border: transparent;
      cursor: pointer;
    }
  </style>
  <body>
    <div class="loading2Content" id="loader">
      <div id="loaderAnimation" class="swing-xy">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
      </div>
      <br /><br /><br /><br /><br /><br /><br />
      <p id="loadingText" class="loading2Text">Loading your data. This could take a few seconds...</p>
    </div>
    <div class="wrapper">
      <h3 class="title">Choose a catalog name, please</h3>
      <select id="catalogDropdown" class="catalogDropdown"></select>
      <button class="saveButton" onclick="saveSelectedValue()">Save</button>
    </div>

    <script>
      /** This code:
       * shows and save the discount reason
       *
       */

      let globalData = {
        context: null,
        transactionUUID: null,
        udtName: "Parameters",
        udtMainKey: "PublitasCatalog",
        catalogNames: []
      };

      //run the logic
      const catalogContainer = document.querySelector(".wrapper");
      const catalogDropdown = document.getElementById("catalogDropdown");
      const spinner = document.getElementById("loader");
      on_load();

      async function on_load() {
        globalData.context = await getContext();
        globalData.transactionUUID = globalData.context.transaction.uuid;

        //console.log("context", globalData.context);

        const udtCatalogsData = await getCatalogsList(globalData.udtName, globalData.udtMainKey);
        if (udtCatalogsData.success && udtCatalogsData.objects) {
          globalData.catalogNames = udtCatalogsData.objects.map((el) => el.secondaryKey);
        }

        // console.log("globalData.catalogNames", globalData.catalogNames);

        const htmlCatalogOptions = populateDropdown(globalData.catalogNames);
        catalogDropdown.innerHTML = htmlCatalogOptions;

        // console.log("catalogDropdown", catalogDropdown);
        // console.log("catalogContainer", catalogContainer);

        spinner.style.display = "none";
        catalogContainer.style.display = "flex";
      }

      /**
       * * get context info about the transaction
       * @return object;
       */
      function getContext() {
        return new Promise((resolve, reject) => {
          pepperi.app.getContext({ responseCallback: "getContextCallback" });

          getContextCallback = function (res) {
            if (res.success) {
              resolve(res);
            } else {
              reject(res);
            }
          };
        });
      }

      /**
       * *get reason list form UDT
       * @return array/object;
       */
      function getCatalogsList(tableName, mainKey) {
        return new Promise((resolve, reject) => {
          pepperi.api.userDefinedTables.getList({
            table: tableName,
            mainKey: mainKey,
            pageSize: 1000,
            page: 1,
            responseCallback: "getCatalogsListCallback"
          });

          getCatalogsListCallback = function (res) {
            if (res.success) {
              resolve(res);
            } else {
              reject(res);
            }
          };
        });
      }

      function populateDropdown(data) {
        //console.log("catalogData", data);
        let optionsHtml = "";
        data.forEach((reason) => {
          optionsHtml += `<option class="option" value="${reason}">${reason}</option>`;
        });

        // console.log("optionsHtml", optionsHtml);

        return optionsHtml;
      }

      /**
       * *to update transaction fields
       * @param param - array.
       * @return object;
       */
      function updateFields(value) {
        return new Promise((resolve, reject) => {
          pepperi.api.transactions.update({
            objects: value,
            responseCallback: "updateFieldCallback"
          });

          updateFieldCallback = function (res) {
            if (res.success) {
              resolve(res);
            } else {
              reject(res);
            }
          };
        });
      }

      /**
       * *save the reason value and close the form
       */
      async function saveSelectedValue() {
        const selectedValue = catalogDropdown.value;
        // console.log("Selected value:", selectedValue);

        const updateData = await updateFields([
          {
            UUID: globalData.transactionUUID,
            TSACatalogToNavigate: selectedValue
          }
        ]);

        //console.log("updateData", updateData);

        onClose();
      }
    </script>
  </body>
</html>
```

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/multiple5.jpg)

dropdown selector

You can also use a dynamic parameter to open a publication with a specific Hotspot. The example uses the additional TSAItemToNavigate field in the transaction. Save the required identifier in this field before starting the publication.

!!!info
To find the Hotspot ID, copy the publication URL and open it in the new browser tab. Find the Hotspot that you need and select it. You can get the ID in the URL parameters.
!!!

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/multiple6.jpg)

hotspot id

!!!warning
If you don't need any of these fields, delete it from the transactionData function.
!!!

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/multiple7.jpg)

additional fields

#### Pages & Launch Page

Using Pages allows you to transfer a user directly to a new transaction and automatically open a publication in Publitas. This is possible with the help of Flow and Scripts. Flow creates (opens) a transaction with the automatic launch of Publitas. At the same time, the user does not need to make application manipulations with the launch of the program and the selection of the publication name, which improves the ergonomics of using Publitas.

But even more ergonomic and convenient for users is the use of Launch Page in Pepperi. This allows the client to generate links for users that will automatically redirect them to the transaction with the opening of the required publication. https://app.pepperi.com/launch\_page - it is the basis of the link. Then you can transfer all the necessary data. For example, the type of transaction, the Pepperi's catalog, the name of the publication, and the Hotspot ID (https://app.pepperi.com/launch\_page?type=B2B&catalog=Default&publitasCatalog=test\_publication&hotspot=555555 example).

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/launch1.jpg)

launch page

To automatically launch the Publitas when using Pages or Launch Page, you should fill in a custom checkbox field when creating/opening a transaction in the script. Add a branch condition on this field in the transaction's workflow in the New-InCreation stage. On the branch, if it is launched from Pedges, add a custom form that opens Publicitas.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Pages_1.jpg)

update checkbox

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Pages_2.jpg)

workflow branch

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Pages_3.jpg)

custom form

This custom form code example opens a UI task with Publitas. Also, an additional button has been added here when opening Publitas from Pages. This button helps avoid the problem when Publitas is launched from Pages and returns the user to the order instead of the main page after closing.

**👈 Custom form (Publitas) code**

```
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <body>
      <div id="closeButtonContainer" style="display: none; justify-content: end; margin-top: 1rem">
        <button class="closeButton" id="closeButton" onclick="onClose();">Go to the Order</button>
      </div>
    </body>
    <style>
      @font-face {
        font-family: "Indaba-Optima";
        src: url("https://storage.pepperi.com/General/Fonts/Optima.ttc") format("truetype");
      }

      #closeButtonContainer {
        margin-bottom: 1rem;
      }
      .closeButton {
        font-family: "Indaba-Optima";
        padding: 1rem;
        font-size: 1rem;
        font-weight: bold;
        border: none;
        border-radius: 0.25rem;
        color: #ffffff;
        background-color: hsl(38, 40.6%, 53.1%);
        cursor: pointer;
      }
    </style>
    <script src="https://integration.pepperi.com/ui_tasks//kendo/js/jquery.min.js"></script>
    <script>
      /** This code:
       * check if the Publitas runs with B2B transaction - to add close button
       * update fields: void
       */

      let globalData = {
        context: null
      };

      //run the logic
      on_load();

      async function on_load() {
        globalData.context = await getContext();
        globalData.transactionUUID = globalData.context.transaction.uuid;
        const transactionData = await getTransactionFields();

        if (transactionData.success && transactionData.object && transactionData.object.TSAIsOpenPublitas) {
          const closeButtonContainer = document.getElementById("closeButtonContainer");
          closeButtonContainer.style.display = "flex";
        }

      }

      /**
       * * get context info about the current account
       * @return object;
       */
      function getContext() {
        return new Promise((resolve, reject) => {
          pepperi.app.getContext({ responseCallback: "getContextCallback" });

          getContextCallback = function (res) {
            if (res.success) {
              resolve(res);
            } else {
              reject(res);
            }
          };
        });
      }

      /**
       * * get transaction header fields info
       * @return object;
       */
      function getTransactionFields() {
        return new Promise((resolve, reject) => {
          pepperi.api.transactions.get({
            key: { UUID: globalData.transactionUUID },
            fields: ["TSAIsOpenPublitas"],
            responseCallback: "getTransactionFieldsCallback"
          });

          getTransactionFieldsCallback = function (res) {
            if (res.success) {
              resolve(res);
            } else {
              reject(res);
            }
          };
        });
      }
    </script>
    <script>
      document.write("<script type='text/javascript' src='https://integration.pepperi.com/ui_tasks//kendo/App/PageTask/CustomForm.js?v=" + Date.now() + "'><\/script>");
    </script>
    <script>
      page_url = "https://integration.pepperi.com/ui_tasks//PageTask/Run?ClientToken=caa19a6a-cef7-406d-9529-bede5e19ea45&TaskName=Publitas+Generic+Entry+Point";
      url_params = [];
    </script>
  </head>
</html>
```

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Pages_4.jpg)

form button

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Pages_1-1.jpg)

script (open publitas)

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Pages_2-1.jpg)

workflow

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Pages_3-1.jpg)

launch publitas
