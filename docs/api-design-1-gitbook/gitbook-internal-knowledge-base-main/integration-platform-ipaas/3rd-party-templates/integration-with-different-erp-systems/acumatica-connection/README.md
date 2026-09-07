# Acumatica connection

1. Login to Acumatica ERP and search 'Connected Applications':\
   ![](<../../../../.gitbook/assets/image (67).png>)
2. Fill all the necessary info as shown below and press **Save** icon\
   ![](<../../../../.gitbook/assets/image (119).png>)
3. Once that done, Client ID will be generated. Go to 'Redirect URL' and fill in such url:\
   [https://integration.pepperi.com/utils/oauth/AuthorizeOAuth2](https://integration.pepperi.com/utils/oauth/AuthorizeOAuth2)![](<../../../../.gitbook/assets/image (304).png>)
4. Go to iPaaS, create any dataflow task (Generic HTTP Connector), select auth type "OAuth2.0" and press "Get Token" :\
   ![](<../../../../.gitbook/assets/image (431).png>)
5. Fill in details:\
   **Application Unique Name** - any\
   **Start Authorization URL** - https://\<Acumatica URL>/identity/connect/authorize?response\_type=token\
   **Get Access Token URL** - https://\<Acumatica URL>/identity/connect/token\
   **Renew Access Token URL** - https://\<Acumatica URL>/identity/connect/token\
   **Consumer Key - Client ID from step 3**\
   **Consumer Secret - Secret key from step 2**\
   **OAuth2 Scope** - api offline\_access\
   \
   And press 'Generate Token'\
   ![](<../../../../.gitbook/assets/image (228).png>)<br>
6. Grant access in pop-up window\
   ![](<../../../../.gitbook/assets/image (399).png>)
7. Go back to dataflows and generate link:\
   https://\<Acumatica URL>/entity/\<web service name>/\<web service version>/\<web service endpoint>\
   To find all the necessary info go to Acumatica and search 'Endpoint'\
   ![](<../../../../.gitbook/assets/image (46).png>)\
   you will find a list of web services and versions \
   select the correct one:\
   ![](<../../../../.gitbook/assets/image (410).png>)\
   And find relevant api endpoint\
   ![](<../../../../.gitbook/assets/image (50).png>)
8. To generate a link and get additional information, you need to set the parameter \
   &#xNAN;_**?$expand=extension name**_

![](<../../../../.gitbook/assets/1Capture (1).PNG>)

Once url in dataflow is ready, add header to the http request\
Accept: application/json, text/json

