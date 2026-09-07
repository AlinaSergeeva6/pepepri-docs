---
description: standard pepperi resource, using to edit and publish configuration objects
---

# Drafts

Draft object used for editing and creating configuration objects.\
draft hold the data for the configurations objects of the profiles.\
when publishing a draft configuration objects are created for each profile, and also a version object is created and hold the current state of the draft.

drafts are per addon per configuration schema, that means that every draft belong to some configuration schema of a specific addon. the draft hold data that compatible to the fields of the configuration schema.\
\
drafts can only be restored from a specific version, in case we want to go back to some previous publish.



{% hint style="warning" %}
**policy name for upserting drafts is "configurations".**&#x20;

**by default only admin is allowed to call the API for upserting drafts.**
{% endhint %}

{% hint style="warning" %}
**policy name for publish/restore drafts is "version\_managment".**&#x20;

**by default only admin is allowed to call the API for publish/restore a draft.**
{% endhint %}

{% swagger method="post" path="addons/configurations/:addonUUID/:name/drafts" baseUrl="https://api.pepperi.com/" summary="creating a draft" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="body" name="Description" required="true" %}
description of draft
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Key" type="String" required="false" %}
draft key.\
must be in uuid format.\
if missing key will be auto generated


{% endswagger-parameter %}

{% swagger-parameter in="body" name="Data" type="DraftData" required="true" %}
the shared data among all profiles.

profiles could override this data within the Profiles property.
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Profiles" type="Profile[]" required="true" %}
data per profile.\
in case of match between specific profile field and data field, the profile field will override the value of the data field.
{% endswagger-parameter %}

{% swagger-parameter in="header" name="x-pepperi-secretkey" required="true" %}

{% endswagger-parameter %}

{% swagger-response status="200: OK" description="" %}
<pre class="language-typescript"><code class="lang-typescript">{
<strong>    Key: "b419e488-088b-11ee-be56-0242ac120002",
</strong>    AddonUUID: "8412e500-088b-11ee-be56-0242ac120002",
    Name: "scheme instance",
    ConfigurationSchemaName: "ConifgurationExample",
    Description: "This is my configuration", 
    Dirty: true,
    PublishedVersion: "63cb9d08-1986-11ee-be56-0242ac120002", //ref to version
    Data: {
        Field1: "a",
        Field2: 2
    },
    Profiles: [
        {
            Key: "63cb9d08-1986-11ee-be56-0242ac120002", //reference to the profile
            Data: { //data can override the shared data
                Field3: 1
            }
        }
    ]
}
</code></pre>
{% endswagger-response %}
{% endswagger %}

{% swagger method="post" path="addons/configurations/:addonUUID/:name/drafts/key/:key/publish" baseUrl="https://api.pepperi.com/" summary="publish a draft" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="header" name="x-pepperi-secretkey" required="true" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="Description" %}
will be the description of the version that created at publish
{% endswagger-parameter %}

{% swagger-response status="200: OK" description="" %}
```typescript
{
    VersionKey: "778862f4-0923-11ee-be56-0242ac120002" //the reference to the new version that has been created
}
```
{% endswagger-response %}
{% endswagger %}

{% swagger method="post" path="addons/configurations/:addonUUID/:name/drafts/key/:key/restore" baseUrl="https://api.pepperi.com/" summary="restore a draft" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="body" name="VersionKey" required="true" %}
reference to the version that hold the state you want to restore.
{% endswagger-parameter %}

{% swagger-parameter in="header" name="x-pepperi-secretkey" required="true" %}

{% endswagger-parameter %}

{% swagger-response status="200: OK" description="" %}
```typescript
{
    VersionKey: "778862f4-0923-11ee-be56-0242ac120002"
}
```
{% endswagger-response %}
{% endswagger %}

## DraftData &#x20;

```typescript
interface DraftData {
    [FieldID]: any
}
```

## Profiles&#x20;

```typescript
interface Profile{
    Key: string //ref to profile
    Data: ConfigurationFields
}
```



### Import/Export drafts

exporting a draft will also export the published version of the draft(if the draft is published).

when importing a draft, the draft published version **attribute** will be deleted, and also the dirty bit will convert to true.

the version object itself will be imported.

{% hint style="warning" %}
_**currently there is no support on profiles in import export (the profiles will not be mapped when importing to a different environment).**_
{% endhint %}
