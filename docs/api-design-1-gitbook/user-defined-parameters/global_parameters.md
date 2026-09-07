# User Defined Parameters

A standard pepperi resource which represents a configuration for a list of parameters.

## **Communication API** <a href="#communication-api" id="communication-api"></a>

**Introduction**

User Defined Parameters is the addon that configures global parameters to be used both on the mobile devices and on the webapp.

This addon can pass global parameters between pages | application header or any other addon that want to get the global parameters change by listening to the "receive-parameters-change-event" custom event in his client side.

This addon can save the user last changes on some parameter value (state change).

If there is a state change in Addon for ex. Pages (in CPI side), Pages will call to "**set\_user\_parameters**" function with this body and all the parameters that persistency is true will save for the current user by the source AddonUUID and the source key &#x20;

```typescript
{
   SourceAddonUUID: string, // The addon UUID that trigger the call 
   SourceKey: string,       // The source key (for example the page key) 
   Parameters: [{           // List of all the parameters that changed
      Key: string,          // Parameter Key
      Value?: any,          // The value
      Persistency: boolean  // If save this in the DB
   }]
}
```

For other events that can cause a parameter value change, The Addon for ex. Pages will call to "**user\_parameters\_change"** with this body (the same as above) and this function will call to the userDefinedParametersChange client action only for the global parameters (by the parameter key).\
&#x20;The container app (Webapp or NativeApp) will catch this client event and throw (**receive-parameters-change-event**) custom event to all addons that are listening (and go back to the CPI without wait).&#x20;

The Addon for ex. Pages call to "**get\_user\_parameters"** in the on load to get the initial user parameters values from the last save (or the default values).

{% hint style="warning" %}
Does not support where clause and fields
{% endhint %}

## Get User Defined Parameters

<mark style="color:blue;">`GET`</mark> `https://papi.pepperi.com/v1.0/user_defined_parameters`

#### Path Parameters

| Name | Type   | Description |
| ---- | ------ | ----------- |
|      | string |             |

{% tabs %}
{% tab title="200 " %}
```json
[
    {
        Key: string;           // The parameter key
        Description?: string;  // Description
        Type: SchemeFieldType; // The parameter type
        DefaultValue?: any;    // Default value of the parameter
        Persistency?: boolean; // If should save in the DB
    }
]
```
{% endtab %}
{% endtabs %}

## CPI Side Endpoints <a href="#cpi-side-endpoints" id="cpi-side-endpoints"></a>

### get\_user\_parameters <a href="#blockloadendpoint" id="blockloadendpoint"></a>

This endpoint gets the initial user parameters values from the last save (or the default values).

The endpoint should be **GET**

**Request query**

```
{
    sourceAddonUUID, // The addon UUID that trigger the call 
    sourceKey        // The source key (for example the page key)
}
```

**Response body -** list of parameters

```
[{
      Key: string,          // Parameter Key
      Value?: any           // The value
}]
```

### set\_user\_parameters <a href="#blockbuttonclickendpoint" id="blockbuttonclickendpoint"></a>

This endpoint is set the user parameters values for the specific user.

The endpoint should be **POST**

**Request Body**

```
{
   SourceAddonUUID: string, // The addon UUID that trigger the call 
   SourceKey: string,       // The source key (for example the page key) 
   Parameters: [{           // List of all the parameters that changed
      Key: string,          // Parameter Key
      Value?: any,          // The value
      Persistency: boolean  // If save this in the DB
   }]
}
```

### user\_parameters\_change <a href="#blockbuttonclickendpoint" id="blockbuttonclickendpoint"></a>

This endpoint is call to the userDefinedParametersChange client action only for the global parameters (by the parameter key).

The endpoint should be **POST**

**Request Body**

```
{
   SourceAddonUUID: string, // The addon UUID that trigger the call 
   SourceKey: string,       // The source key (for example the page key) 
   Parameters: [{           // List of all the parameters that changed
      Key: string,          // Parameter Key
      Value?: any,          // The value
      Persistency: boolean  // If save this in the DB
   }]
}
```
