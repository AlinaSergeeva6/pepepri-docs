---
title: "Intacct Integration(Sage Intacct)"
description: "This article explains how to integrate the system using XML format for requests. JSON format is also supported, but it is not described here."
order: 183
---
# Intacct Integration(Sage Intacct)

*This article explains how to integrate the system using XML format for requests. JSON format is also supported, but it is not described here.*

## Setting up the Dataflow task:

× Description: &lt;name>

× Application: Generic HTTP Connector

× Source Object: Generic Http Exporter

× Target Object: &lt;Depends on a usage>

![](/static/1111.png)

!!!success
**Important:** In order to get the correct response from the server, add setting **http\_row\_element** and put your &lt;object> name
!!!

**Example:**

![](/static/12312312313.png)

## HTTP Header request

!!!success
Content-Type: **text/xml**

Method: **POST** (always)
!!!

![](/static/1222.png)

## XML request body

Full body for request:

```
<?xml version="1.0" encoding="UTF-8"?>
<request>
    <control> <!-- important tag -->
        <senderid>!%generic_param_1%!</senderid>
        <password>!%connection_param_1%!</password>
        <controlid>{#timestamp#}</controlid>
        <uniqueid>false</uniqueid>
        <dtdversion>3.0</dtdversion>
        <includewhitespace>false</includewhitespace>
    </control>
    <operation>
        <authentication> <!-- important tag with connection -->
            <login>
                <userid>!%generic_param_3%!</userid>
                <companyid>!%generic_param_2%!</companyid>
                <password>!%connection_param_3%!</password>
            </login>
        </authentication>
        <content>
            <function controlid="{#new_guid#}"> <!--function also important tag-->
                <query> <!--can be: <query>,<create>,<delete>,<lookup>,<read>,<readByName>-->
                    <object>CUSTOMER</object> <!--name of table where u wanna get/update data-->
                    <select>
                        <field>CUSTOMERID</field>
                        <!-- and other fields what u need -->
                    </select>
                    <filter> <!--example of condition-->
                        <equalto>
                            <field>STATUS</field>  <!--example of condition-->
                            <value>active</value>
                        </equalto>
                    </filter>
                    <pagesize>1000</pagesize> <!-- Paging for get all -->
                    <offset>$#({#page_num#} - 1) * 1000#$</offset><!-- Paging for get all -->
                </query>
            </function>
        </content>
    </operation>
</request>
```

!!!info
**&lt;authentication>** and **&lt;control>** tags are static, except for access keys. They are provided by the customer.

**&lt;function controlid="{#new\_guid#}"> &lt;/function>** is where we configure the request.
!!!

## Requests to retrieve data

### Get any field

to retrieve any field, use **&lt;lookup>** tag:

```
<function controlid="{#new_guid#}">
       <lookup>
              <object> CUSTOMER </object> <!--  what u wanna check-->
       </lookup>
</function>
```

!!!danger
If **http\_row\_element is not set** or it contains incorrect value, you may receive an error. Nevertheless, the response from the server will be fine. Download txt Document and open it in VS Code.
!!!

## Get fields by Customer ID

If you need to get all/needed columns for some Customer(s) by RECORDNO(id) use **&lt;read>** tag :

```
<function controlid="{#new_guid#}">
       <read>
              <object> CUSTOMER </object> <!--  what u wanna check-->
              <keys> RECORDNO </keys> <!-- u can use “,” for more RECORDNO -->
              <fields> * </fields> <!-- u can use “,” for fields what u need -->
       </read>
</function>
```

### Get fields for Customer with filter

If you need to get the list with some conditions use **&lt;query>** tag:

```
<function controlid="{#new_guid#}">
       <query>
              <object> CUSTOMER </object> <!--  what u wanna check-->
              <filter>
       <greaterthan> <!--  expression -->
       <field>TOTALDUE</field>
       <value>100</value>
</greaterthan>
</filter>
              <select>  <!--  fields what u wanna take -->
       <field>RECORDNO</field>
       <field>TOTALDUE</field>
</select>
       </query>
</function>
```

All expressions:

-   &lt;greaterthan>,
-   &lt;notequalto>,
-   &lt;lessthan>,
-   &lt;lessthanorequalto>,
-   &lt;greaterthanorequalto>,
-   &lt;isnull>,
-   &lt;isnotnull>

All logical expressions:

-   &lt; between>,
-   &lt;in>,
-   &lt;notin>,
-   &lt;like>,
-   &lt;notlike>

!!!info
More information about filters: [here](https://developer.intacct.com/web-services/queries/#filter)
!!!

### Requests to send Data

### Create Customer

use **&lt;create>** Tag:

```
<function controlid="{#new_guid#}">
       <create>
<CUSTOMER> <!--  where u wanna create -->
       <CUSTOMERID></CUSTOMERID> <!-- that intacct generate -->
       <NAME>Test</NAME>
       ...
</CUSTOMER>
       </create>
</function>
```

!!!info
for **CUSTOMERID** we need use response and set that to PepperiID, see example:

https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=72312
!!!

!!!success
See all the fields that can be mapped [here](https://developer.intacct.com/web-services/queries/#filterhttps://developer.intacct.com/api/accounts-receivable/customers/#create-customer).
!!!

### Update Customer

use **&lt;update>** tag:

```
<function controlid="{#new_guid#}">
	<update>
<CUSTOMER> <!--  where u wanna create -->
	<CUSTOMERID>$#ExternalID#$</CUSTOMERID> <!-- what account to update -->
	<NAME>Test</NAME>
	...
</CUSTOMER>
	</update>
</function>
```

!!!success
\*for CUSTOMERID see example: [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=72325](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=72325)
!!!
