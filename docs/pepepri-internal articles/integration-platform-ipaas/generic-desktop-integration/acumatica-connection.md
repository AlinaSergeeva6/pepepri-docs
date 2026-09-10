---
title: "Acumatica connection"
order: 127
---
# Acumatica connection

1.  Login to Acumatica ERP and search 'Connected Applications':

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-493.png)

2.  Fill all the necessary info as shown below and press **Save** icon

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-494.png)

3.  Once that done, Client ID will be generated. Go to 'Redirect URL' and fill in such url: [https://integration.pepperi.com/utils/oauth/AuthorizeOAuth2](https://integration.pepperi.com/utils/oauth/AuthorizeOAuth2)

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-495.png)

4.  Go to iPaaS, create any dataflow task (Generic HTTP Connector), select auth type "OAuth2.0" and press "Get Token" :

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-496.png)

5.  Fill in details: **Application Unique Name** - any **Start Authorization URL** - https://&lt;Acumatica URL>/identity/connect/authorize?response\_type=token **Get Access Token URL** - https://&lt;Acumatica URL>/identity/connect/token **Renew Access Token URL** - https://&lt;Acumatica URL>/identity/connect/token **Consumer Key - Client ID from step 3 Consumer Secret - Secret key from step 2 OAuth2 Scope** - api offline\_access And press 'Generate Token'

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-497.png)

6.  Grant access in pop-up window

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-498.png)

7.  Go back to dataflows and generate link: https://&lt;Acumatica URL>/entity/&lt;web service name>/&lt;web service version>/&lt;web service endpoint> To find all the necessary info go to Acumatica and search 'Endpoint'

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-499.png)

     you will find a list of web services and versions select the correct one:

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-500.png)

     And find relevant api endpoint

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-501.png)

8.  To generate a link and get additional information, you need to set the parameter ***?$expand=extension name***

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/1Capture-2.PNG)

Once url in dataflow is ready, add header to the http request Accept: application/json, text/json
