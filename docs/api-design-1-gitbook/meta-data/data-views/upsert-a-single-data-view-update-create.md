# Upsert a Single Data View (Update/Create)

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/meta_data/data_views" method="post" summary="Upsert Single Data View - Create Or Update by InternalID" %}
{% swagger-description %}
A data view can be uniquely identified by either it's Internal ID, or it's context object (the Name, Profile, Object & Screen size).
{% endswagger-description %}

{% swagger-parameter in="body" name="" type="object" %}
see example in response
{% endswagger-parameter %}

{% swagger-response status="200" description="Retut" %}
```javascript
{
    "InternalID": 3574402,
    "Type": "Configuration",
    "Title": "Sales Rep Form",
    "Hidden": false,
    "CreationDateTime": "2020-08-09T15:05:31Z",
    "ModificationDateTime": "2020-08-12T09:34:09Z",
    "Context": {
      "Object": {
        "Resource": "activities",
        "InternalID": 259494,
        "Name": "Links"
      },
      "Name": "ActivityCreationRule",
      "ScreenSize": "Tablet",
      "Profile": {
        "InternalID": 61079,
        "Name": "Rep"
      }
    },
    "Fields": []
  }
```
{% endswagger-response %}
{% endswagger %}

* `Context.Name` can only contain letters, numbers or an underscore
* `Context.Profile` can include Name or InternalID
* `Context.Object` can include Name or InternalID (UUID only for lists)
* `Context.ScreenSize` can be one of Tablet, Phablet, Landscape
* `Type` can be one of Grid, Form, Card, Large, Line, Map, Menu, Configuration, CardsGrid, Details

Mandatory fields:

* Type
* InternalID or Context

When Posting a Configuration DataView within the fields, only the FieldID is mandatory.\
On all other types, all the exported fields are mandatory.

