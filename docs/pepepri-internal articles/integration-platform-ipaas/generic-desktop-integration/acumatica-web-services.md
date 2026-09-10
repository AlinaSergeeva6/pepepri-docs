---
title: "Acumatica Web Services"
description: "You can find a link to Acumatica login information here https://<customerDomain>.acumatica.com/"
order: 125
---
# Acumatica Web Services

*You can find a link to Acumatica login information here             https://<customerDomain>.acumatica.com/*

Web Service in Acumatica is a powerful tool that allows to establish REST API connection with ERP. **In order to** ***create a new Web Service in Aсumatiсa*****,** you need to enter **Web Service Endpoints** in the search and go to any existing Endpoint, for example *eCommerce* or *Default*. Then we press ***EXTEND ENDPOINT*** and a new module is created based on the current. In this case you will have access to current endpoints of basic webservice plus add additional enpoints for Generic Inquiries

![](/static/2-33.PNG)

Fill Endpoint Name and Endpoint Version fields and thus a new module is created.

![](/static/3-25.PNG)

We also have the option to create **additional APIs** by clicking on **INSERT** and filling in the required fields.

![](/static/2-34.PNG)

!!!info
After filling in the Object Name field and selecting the Screen Name (relevant Generic Inquiry), we generate a **Screen ID** which we can insert into the address bar and get a link with prepared data.

![](/static/11-7.PNG)

![](/static/12-4.PNG)
!!!

After we have created a new Web Service, &lt;ApiName>Details is automatically created where the fields that we have selected in &lt;ApiName> → Fields → Populate are displayed. See an example of adding fields to a view below.

![](/static/Capture-26.PNG)

![](/static/Capture-27.PNG)

In order to add columns, you need to select the Result object

![](/static/Capture-28.PNG)

#### How to generate http string to get data in dataflow task?

https://&lt;customerDomain>.acumatica.com/&lt;module name>/&lt;module version>/&lt;Web Service name>?&expand=&lt;Web Service extension>

![](/static/http.PNG)

This creates an array of testendpointDetails with the fields we have selected.

***IMPORTANT!*** You also need to add the setting **http\_row\_element = &lt;Web Service extension>** to the settings.
