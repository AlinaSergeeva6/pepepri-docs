---
description: This is a generic api to log the custom kpi data.
---

# Log KPI Object

#### Log KPI

<mark style="color:green;">`POST`</mark> `https://papi.pepperi.com/V1.0/kpi/log`

Endpoint to log KPI's.

#### Request Body

| Name                                           | Type   | Description                                 |
| ---------------------------------------------- | ------ | ------------------------------------------- |
| Objects<mark style="color:red;">\*</mark>      | Array  | Array of KPI log objects to add             |
| PlatformType<mark style="color:red;">\*</mark> | String | "iPad" \| "iPhone" \| "Android" \| "WebApp" |

#### Response <a href="#example" id="example"></a>

{% tabs %}
{% tab title="200: OK Operation Successfully Done " %}
```json
```
{% endtab %}

{% tab title="400: Bad Request Error" %}
```
```
{% endtab %}
{% endtabs %}

{% hint style="info" %}
validate that **at least one** of the three fields (Count, DurationInMS, SizeInBytes) is provided (i.e., they are optional, but at least one must be present)
{% endhint %}

#### Input

```typescript
{
    "Objects": [
        {
            ActionUUID: "9d8823f4-8089-4b46-874e-bf020da62e8a",
            Name: "MY_KPI_TEST",
            Count: 1,
            DurationInMS: 100,
            SizeInBytes: 15352,
            AdditionalData: "",
            ObjectKeys: ["bba18443-e05b-4b49-ab78-69cb64412157"]
        }
    ],
    "PlatformType": "WebApp"
}
```
