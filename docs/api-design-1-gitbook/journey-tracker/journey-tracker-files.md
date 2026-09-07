# Journey Tracker Files

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/v1.0/journey/files/search`



Supports 'where' clause ONLY as body parameter



#### Request Body

| Name  | Type   | Description  |
| ----- | ------ | ------------ |
| Where | String | Where clause |

{% tabs %}
{% tab title="200: OK Journey files fetched successfully" %}
Success

```json
 { 
     Files: [
     {
        "ModificationDateTime": "2023-08-27T09:12:17.465Z",
        "FileVersion": "GOel.UVioYoIWGId4lMV92W3HCHu4PpT",
        "Folder": "/",
        "MIME": "text/plain",
        "CreationDateTime": "2023-08-27T09:12:17.465Z",
        "Sync": "None",
        "Description": "",
        "MetaData": {
            "Email": "guy.k@pepperi.com",
            "IsWebApp": false,
            "platformType": "iPad",
            "UserLastName": "Klinger",
            "UserFirstName": "Guy",
            "locale": "en",
            "deviceID": "DADD8DE1-B48C-57BD-A7EC-9D53B9276F44",
            "timeZoneDiff": "10800",
            "deviceName": "iPad",
            "systemVersion": "16.5",
            "systemName": "iPadOS",
            "screenType": "Desktop",
            "deviceModel": "iPad (x86_64)",
            "UUID": "907a3413-4e68-4d82-8849-d029c640d472",
            "softwareVersion": "17.20000480"
        },
        "URL": "https://pfs.pepperi.com/a617180c-0b90-4d19-9ec4-4f73c7b05d2f/41011fbf-debf-40d8-8990-767738b8af03/event_tracker_events_pfs_scheme/journey.9785d43a-3cfd-480e-a034-83ca6b24bfd4.txt",
        "Hidden": false,
        "Cache": true,
        "FileSize": 230,
        "UploadedBy": "907a3413-4e68-4d82-8849-d029c640d472",
        "Name": "journey.9785d43a-3cfd-480e-a034-83ca6b24bfd4.txt",
        "Key": "journey.9785d43a-3cfd-480e-a034-83ca6b24bfd4.txt"
    }]
}
```
{% endtab %}

{% tab title="500: Internal Server Error An Error instance" %}

{% endtab %}
{% endtabs %}

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/v1.0/journey/files/search`

#### Request Body + Response

Same as Pepperi [search options](https://apidesign.pepperi.com/adal-doc-db/search)

## Journey File Structure

File format - text/plain. Each record is a stringified JSON object containing:

* CreationDateTime
* Key
* Label
* Data

Journey file example:

```
'{"CreationDateTime":"2023-04-20T13:14:30.108Z","Key":"b1f25b44-dce9-4b8e-9786-e02dbaa0af74","Label":"label","Data":{"name":"John","age":30,"address":{"street":"123 Main St","city":"Anytown","state":"CA","zip":"12345"},"hobbies":[{"name":"reading","type":"indoor"},{"name":"hiking","type":"outdoor"}]}}'
'{"CreationDateTime":"2023-04-20T13:14:30.108Z","Key":"b1f25b44-dce9-4b8e-9786-e02dbaa0af74","Label":"label","Data":{"name":"John","age":30,"address":{"street":"123 Main St","city":"Anytown","state":"CA","zip":"12345"},"hobbies":[{"name":"reading","type":"indoor"},{"name":"hiking","type":"outdoor"}]}}'
```

Parsed **record** example:

```json
{
  CreationDateTime: '2023-04-20T13:14:30.108Z', // ISO
  Key: 'b1f25b44-dce9-4b8e-9786-e02dbaa0af74', // UUID
  Label: 'label',
  Data: {
    "name": "John",
    "age": 30,
    "address": {
      "street": "123 Main St",
      "city": "Anytown",
      "state": "CA",
      "zip": "12345"
    },
    "hobbies": [
      {
        "name": "reading",
        "type": "indoor"
      },
      {
        "name": "hiking",
        "type": "outdoor"
      }
    ]
  }
}
```
