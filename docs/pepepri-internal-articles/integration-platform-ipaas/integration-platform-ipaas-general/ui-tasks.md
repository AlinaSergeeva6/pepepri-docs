---
title: "UI Tasks"
description: "You can find existing solution in “Integration Examples” (6685) Pepperi integration platform account, UI task: \"Training Example”"
order: 250
---
# UI Tasks

*You can find existing solution in “Integration Examples” (6685) Pepperi integration platform account, UI task: "Training Example”*

By UI task you can implement logic, visualize data. It is used for various types of reports, logic programs. Here is used HTML, CSS, JavaScript, jQuery, Kendo. UI tasks always work only online. The advantage is the use of external libraries, also you can extract data from the Dataflow task, or vice versa, send the necessary data to Dataflow. For example, data for an email attachment that is sent by Dataflow etc.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/2-6.png)

Specify such parameters (all of them are mandatory):

#### Task Name

Just a name of Task

#### Application

Here you should write an application that task will use. Use table below to select correct application

|  |  |
| --- | --- |
| Name | Desription |
| Pepperi | not to use |
| Generic Cloud Internal Connector | Allows to work with Pepperi Integration Platform tasks. |
| Generic HTTP Connector | Allows to work with any HTTP application and send GET/POST/PUT, etc requests to any page. Use this application if you would like to use HTTP protocol to get or send the data |
| Generic Desktop Connector | Allows to work with any Desktop application and send requests to desktop application. Use this application if you would like to use listener on the remote server |
| NetSuite Plugin, Xero Plugin,QuickBooks Plugin,MYOB Plugin,SQL On Public IP Plugin,Oracle Sales Cloud Plugin,QuickBooks Desktop Plugin,SAP Desktop Plugin | Вepends on the application |

#### Source Object

This option could be different for each application

#### Target Object - Store Data Table For Later Use

**Main Settings:**

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/2021-02-24_12h50_58.png)

Also you can find ready-made structures. Just click on the setting you want and ctrl+V

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/2021-02-24_13h03_01.png)
