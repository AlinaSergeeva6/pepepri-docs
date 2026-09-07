# Convert Contact/s To User/s ("Buyers")

{% hint style="danger" %}
&#x20;Not developed yet
{% endhint %}

## Convert Contact/s To User/s ("Buyers")

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/v1.0/contacts/convert_to_users`

#### Request Body

| Name | Type   | Description       |
| ---- | ------ | ----------------- |
|      | object | see example below |

{% tabs %}
{% tab title="200 Return" %}
```javascript
{
   "Status" : {"Code" : "PartiallyDone" , "Name" : "Partially Done" },
   "AuditLog" : { "UUID" : "", "URI" : "/audit_log/{UUID}"},
   "LoginDeepLink" : "",
   "FirstLoginPassword" : "" //NOTE : ONLY UPON INTERNAL FLAG SET!!! DO NOT EXPOSE
}
```
{% endtab %}
{% endtabs %}

{% hint style="warning" %}
ContactsWhere and ConfirmationEmail and PasswordInResponse will not be exposed in the developer portal!
{% endhint %}

Request example:

```javascript
{
   "ContactsList" : [{"UUID":""}], // (optional) required OR: User Filter
   "ContactsWhere": "<Our Standard Where Clause>", //(optional) required OR: ContactsList,  //NOTE : INTERNAL FLAG!!! DO NOT EXPOSE 
   "User": //(optional, default is : ...)
   {
      "Profile" : { "ID": 12 },       //(optional),
      "SecurityGroup" : {"UUID" : ""} // (optional),
   } ,
   "ConfirmationEmail" :   //(optional - define only if you send emails),  //NOTE : INTERNAL FLAG!!! DO NOT EXPOSE 
   {
      "Subject": "",// (optional)
      "CC": "",    //(optional)
      "Body" : ""  //(optional - same parsing logic as now)
   },
   "PasswordInResponse" : false  //NOTE : INTERNAL FLAG!!! DO NOT EXPOSE 
}
```

