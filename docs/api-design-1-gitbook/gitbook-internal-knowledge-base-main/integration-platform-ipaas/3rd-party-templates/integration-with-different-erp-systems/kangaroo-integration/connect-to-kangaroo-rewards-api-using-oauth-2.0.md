# Connect to Kangaroo Rewards API using OAuth 2.0

{% tabs %}
{% tab title="Main Links:" %}
* KANGAROO REWARDS API (It’s main page where you can login for create OAuth2 client ID)&#x20;

[https://api.kangaroorewards.com/developers](https://api.kangaroorewards.com/developers)

* KANGAROO REWARDS API Docs (Documentation for working with API)&#x20;

https://api.kangaroorewards.com/docs/business.html
{% endtab %}
{% endtabs %}

### APP CAPABILITIES&#x20;

• Access your account information&#x20;

• Access Business information including branches, offers, rewards etc.&#x20;

• List all Customers and new Customers&#x20;

• Reward your customers&#x20;

• List Custom Rewards and Catalog Items&#x20;

• Redeem based on amount, points or Catalog Item



### REGISTER AN APP WITH KANGAROO REWARDS

To work with KANGAROO via OAuth 2.0, the user needs to register a New Applications. It can be done by the client, but the user still has to make sure that the  application is created correctly on Pepperi. To do this the user needs to go to the Developer Portal and log in using a service account(created by user or provided by the client).

After entering you will see My Application page:

![](<../../../../.gitbook/assets/image (199).png>)

If the connection data is missing or not suitable for connection to Pepperi Integration you need to press Register a new application.

**Authorization callback UR**L: “https://integration.pepperi.com/utils/oauth/AuthorizeOAuth2” and choose Authorization Code in Grant Type dropdown as in the example below

{% hint style="info" %}
(More information in [Documentation](https://api.kangaroorewards.com/docs/business.html)).
{% endhint %}

![](<../../../../.gitbook/assets/image (171).png>)

Only after the status of the field "Approved?" will change to "Yes"(Ask the PM or client to confirm it) you can start connecting the KANGAROO API in Dataflow task.

![](<../../../../.gitbook/assets/image (192).png>)

### Get Token and settings

To work with the Kangaroo API via dataflow tasks automatically, you first need to set up an Oauth2 connection to further automatically use the token in all tasks without the need to receive token manually.

To add a token to General Settings the first time you need use Get Token button and fill in the fields as in the example.

![](<../../../../.gitbook/assets/image (166).png>)

![](<../../../../.gitbook/assets/image (157).png>)

**PAY ATTENTION** – URL fields of this form must be filled in the same way for each customers.

(if possible, implement as \<hr>)

**Application Unique Name**: default (Can be changed in Settings. Field Name - generic\_app\_id)&#x20;

**Start Authorization URL**: https://api.kangaroorewards.com/oauth/authorize&#x20;

**Get Access Token URL**: https://api.kangaroorewards.com/oauth/token&#x20;

**Renew Access Token URL**: https://api.kangaroorewards.com/oauth/token&#x20;

**Consumer Key**: 3A5D89EE1A2543C8BEBEF6688DCBCDA8 (Taken from https://api.kangaroorewards.com/developers/applications Client Id)&#x20;

**Consumer Secret:** k0goY5gRIDN32kv38Xn2dPG\_jQ0keMX7DGL8n7nggGrCHV6Q (Taken from https://api.kangaroorewards.com/developers/applications Client Id)&#x20;

**OAuth2 Scope:** admin (Can be changed)

After having all fields completed, push the button **Generate Token** at the end of the form **As a result** “successfully connected” notification will be shown.

![](<../../../../.gitbook/assets/image (185).png>)

The following options can be seen in General Settings:

![](<../../../../.gitbook/assets/image (125).png>)

Settings for Kangaroo API:

![](<../../../../.gitbook/assets/image (151).png>)

**http\_row\_element** - allows to specify row element in json response and to create rows according to the objects in array 'row'.&#x20;

**generic\_app\_id** – connect to General Settings fields for getting token for OAuth 2.0 connection to Kangaroo API.

**HTTP in Dataflow Task** example to get the balance using kangaroo ID to search:

![](<../../../../.gitbook/assets/image (499).png>)

X-Application-Key must be provided by the customer PAY ATTENTION -- In dataflow task you need to use Application: Generic HTTP Connector Source Object: Generic Http Exporter

**Webhook HTTP** example for sending transaction data to Kangaro API:

![](<../../../../.gitbook/assets/image (496).png>)

Be careful with the value you pass. If you pass 0, you will get an error:

![](<../../../../.gitbook/assets/image (161).png>)
