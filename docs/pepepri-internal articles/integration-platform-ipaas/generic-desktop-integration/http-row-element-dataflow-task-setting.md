---
title: "HTTP_ROW_ELEMENT dataflow task setting"
order: 128
---
# HTTP_ROW_ELEMENT dataflow task setting

HTTP\_ROW\_ELEMENT allows to specify row element in json response and to create rows according to the objects in array 'row'.

Mostly, working on data integration we can face with receiving client’s data using http get requests which sometimes could be very heavy and overfilled with data we do not actually need in current data integration task. It especially relevant when we want to receive “expanded” data from the request.

When you query an OData entity or collection, the default response does not include related entities. For example, here is the default response for the *Categories* entity set:

```
GET http://localhost/odata/Categories
{
  "odata.metadata":"http://localhost/odata/$metadata#Categories",
  "value":[
    {"ExtID":1,"Name":"Apparel"},
    {"ExtID":2,"Name":"Toys"}
  ]
}
```

In this case, to integrate the data and process it in Integration platform we will use parameter ‘value’ in 'http\_row\_element' setting.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/1-43.png)

If our response would look like that: GET [http://localhost/odata/**Categories?$expand=Products**](http://localhost/odata/Categories?$expand=Products)

The server will include the products for each category, inline with the categories. Here is the response payload:

```
{
  "odata.metadata":"http://localhost/odata/$metadata#Categories",
  "value":[
    {
      "Products":[
        {"ID":1,"Name":"Hat","Price":"15.00","CategoryId":1,"SupplierId":"CTSO"},
        {"ID":2,"Name":"Scarf","Price":"12.00","CategoryId":1,"SupplierId":"CTSO"},
        {"ID":3,"Name":"Socks","Price":"5.00","CategoryId":1,"SupplierId":"FBRK"}
      ],
      "ExtID":1,
      "Name":"Apparel"
    },
    {
      "Products":[
        {"ID":4,"Name":"Yo-yo","Price":"4.95","CategoryId":2,"SupplierId":"WING"},
        {"ID":5,"Name":"Puzzle","Price":"8.00","CategoryId":2,"SupplierId":"WING"}
      ],
      "ExtID":2,
      "Name":"Toys"
    }
  ]
}
```

**Notice that each entry in the "value" array contains a Products list.**

Here, if we use parameter ‘*value*’ in *http\_row\_element* setting to integrate the data and process it in **I**ntegration platform we will receive resulting csv file which will look like this:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/2-32.png)

As you can see here each attribute of collection entity of “Products” has its own column and enumerated ascending. The number of columns will depend on the number of attributes in collections and the overall number of collections. Such data requires a lot of tricky manipulations to receive more adequate format which can be processed easily by Integration platform. Lest say we need to receive something like this:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/3-24.png)

At that moment **http\_row\_element** setting comes in handy. By replacing default value “value” of this setting with the name of our expand category “Products”.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/4-19.png)

Our resulting csv will contain only values of the expand category:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/5-17.png)

Other words saying, our csv will contain only highlighted yellow rows of response.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/6-15.png)

We also need to include main ID “ExtID” and Category Name “Name”

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/7-10.png)

This values could be easily obtained using *http\_export\_add\_parents*.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/8-6.png)

The output CSV will be:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/9-6.png)

You can read about the syntax of this setting here:

[![Logo](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/favicon-2.ico) XPath ExamplesMicrosoftLearn](https://docs.microsoft.com/en-us/previous-versions/dotnet/netframework-4.0/ms256086%28v%3dvs.100%29)

Reference Info link:

[https://docs.microsoft.com/en-us/aspnet/web-api/overview/odata-support-in-aspnet-web-api/using-select-expand-and-value](https://docs.microsoft.com/en-us/aspnet/web-api/overview/odata-support-in-aspnet-web-api/using-select-expand-and-value)
