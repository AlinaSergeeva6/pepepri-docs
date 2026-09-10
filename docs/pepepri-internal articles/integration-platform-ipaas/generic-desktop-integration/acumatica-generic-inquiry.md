---
title: "Acumatica Generic Inquiry"
description: "You can find a link to Acumatica login information here https://<customerDomain>.acumatica.com/"
order: 126
---
# Acumatica Generic Inquiry

*You can find a link to Acumatica login information here             https://<customerDomain>.acumatica.com/*

**Generic Inquiry** in Acumatica is a pre-defined query to receive data. It can be found in left menu in 'Data Views' submenu:

![](/static/1-44.PNG)

***In order to create a new Inquiry*** follow these steps:

In the menu on the left side, select the button More Items → Customization → Generic Inquiry. Enter the name of the new Endpoint in the **Inquiry Title** field, set the "*Make Visible on the UI*" and "*Expose via OData*" **checkboxes** enabled. Also in the **Category** field, select the desired category as shown in the screenshot below.

![](/static/11-4.PNG)

*Arrange Parameters in* -always equal to 3; *Select Top* - you can use this field to limit the amount of data. For example, we can enter 5 and in the view we will see only 5 goods. (default is 0 - any restrictions are removed); *Records per Page* - number of records per Page;

As soon as a new inquiry is created, a Screen ID is created. Then when we access this Screen ID API, the API will return it.

### How to set up Inquiries?

**1.TABLES** We must specify a **list of all tables** that are needed in order to create a data sample. To see the list of available items (in our case) click on the view button.

![](/static/11-5.PNG)

![](/static/11-6.PNG)

**2.** **RELATIONS** The next step is to build the right relationship. For example, for customers, we can join ShipTo or BillTo Address. You can see an example below.

![](/static/кCapture.PNG)

**3.PARAMETERS** Parameters are required in order to then create conditions and use them in filters. It's like a variable, only for the API

![](/static/1111-1.PNG)

**4.CONDITIONS** Conditions are needed in order to create certain conditions - data filter. For example, I want to take all clients except the client with this name. You can also filter the data using the variables that were created in the Parameters tab. Thus, to limit the amount of data required, we can use the API. See example below.

![](/static/111.PNG)

For example, if we need to return data for the last 40 days, we can use the condition: ***DocDate is Equals @today-40.*** All available mathematical conditions and formulas can be written by clicking on the pencil ✎.

![](/static/Capture-25.PNG)

**5.GROUPING** makes it possible to group data

**6.SORT ORDER** allows you to specify by which parameter the data will be sorted.

**7.RESULTS GRID** tab allows you to specify which columns will be in the final table.

![](/static/1-45.PNG)

### IMPORTANT!

In order not to configure Inquiry every time, you can download existing ones via Import, which you can find below in the archive.

![](/static/12-3.PNG)

19KB

[PPI - Pepperi Examples.zip](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2FX5lqy4sROulYopYVV5TD%2FPPI%20-%20Pepperi%20Examples.zip?alt=media&token=b7a4553f-73ec-4c90-8929-7e5b40d3a708)

archive

[Open](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2FX5lqy4sROulYopYVV5TD%2FPPI%20-%20Pepperi%20Examples.zip?alt=media&token=b7a4553f-73ec-4c90-8929-7e5b40d3a708)

20KB

[project.zip](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2FhSdPIOfiVIrS4fZvWD6v%2Fproject.zip?alt=media&token=0df4f746-989d-4530-bb9a-f1d7b85198c1)

archive

[Open](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2FhSdPIOfiVIrS4fZvWD6v%2Fproject.zip?alt=media&token=0df4f746-989d-4530-bb9a-f1d7b85198c1)

66KB

[GI.zip](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2FLcOPY9cmlQw8iQFMHIKX%2FGI.zip?alt=media&token=cb83ca58-469d-499c-a734-b5f6a9e9081f)

archive

[Open](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2FLcOPY9cmlQw8iQFMHIKX%2FGI.zip?alt=media&token=cb83ca58-469d-499c-a734-b5f6a9e9081f)
