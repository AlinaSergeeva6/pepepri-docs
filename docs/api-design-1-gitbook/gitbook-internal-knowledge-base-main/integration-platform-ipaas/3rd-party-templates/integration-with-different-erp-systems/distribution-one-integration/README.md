# Distribution One Integration

**Distribution One (ERP-ONE)** is a comprehensive ERP software solution specifically designed to automate business processes for wholesale distributors and suppliers. The platform is currently owned and managed by [Advantive](https://www.advantive.com/products/distribution-one/).

This section describes how to configure a basic Pepperi Integration Platform integration with Distribution One, also known as D1 or ERP-ONE.

The integration is based on the D1 REST API and includes examples for:

* Authentication
* Exporting data from D1 to Pepperi
* Using a generic D1 Data Viewer UI Task
* Optional API areas such as pricing, inventory, images, forms, and calendar

The current template was created in the **iPaaS Services Demo Environment** and can be copied to other environments.



## iPaaS IP Whitelisting

{% hint style="info" %}
Before the integration can connect to the customer’s D1 environment, the customer must whitelist the Pepperi iPaaS IP addresses on their side.
{% endhint %}

Without IP whitelisting:

* authentication requests may fail
* API requests may be blocked
* D1 endpoints may not be accessible from iPaaS

Make sure the customer confirms that the required Pepperi iPaaS IP addresses are allowed before starting the integration setup.

## Current Templates

The current D1 template includes the following tasks:

| Task                    | Description                                                       |
| ----------------------- | ----------------------------------------------------------------- |
| D1 - Get Token 🔒       | Authenticates with D1 and returns an access token                 |
| D1 - Get Customers      | Example export from the D1 customer table                         |
| D1 - Get Contacts       | Example export from the D1 contacts table                         |
| D1 - Get Items          | Example export from the D1 item table                             |
| D1 - Get Warehouses     | Example export from the D1 warehouse table                        |
| D1 Data Viewer          | UI task for testing D1 API requests                               |
| D1 get data             | Internal task used by the Data Viewer for GET-style/read requests |
| D1 - Import Sales Order | Example of webhook to send Pepperi sales order to D1 ERP          |

## Before You Start

Make sure you have the following D1 credentials and connection details:

* D1 API base URL
* Company code
* Client application ID
* Username
* Password

These values should be configured in iPaaS General Settings and Connection Parameters.
