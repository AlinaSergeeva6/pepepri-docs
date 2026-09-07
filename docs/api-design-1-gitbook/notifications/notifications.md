---
description: The notifications resource. Standard ADAL Resource.
---

# Notifications

The system can generate notifications for various events.

The admin can send a notification to a single user or a group of users.

For each newly created notification, a push notification is sent to the mobile devices that have confirmed receiving alerts.&#x20;

hide/unhide won't send push notification.

{% hint style="info" %}
## notifications
{% endhint %}



## Get a list of notifications

<mark style="color:blue;">`GET`</mark> `https://papi.pepperi.com/v1.0/push_notifications`

UserEmail | UserUUID | ExternalID are mutually exclusive and one of them is required.

Email is not persistant and will be replaced by UserUUID.



```typescript
interface Notification {
    Key: string; // Read-only, auto-generated
    Read: boolean; // False by default
    CreatorUUID: string; // Read-only, auto-generated
    Body: string;
    Title: string;
    NavigationPath: string;
    ButtonTitle: string;
    FlowData: {
        FlowKey: string;
        FlowParams: Record<string, {
            Source: "Static" | "Dynamic";
            Value: string; // This should match the expected parameter type dynamically
        }>;
    };
    
    // Mutually exclusive fields. One of them is mandatory.
    UserUUID?: string;
    UserEmail?: string;
    ExternalID?: string;
}



// response example
const notifications: Array<Notifications> = [
    {
        // Standard Resource fields
        // CreationDateTime, ModificationDateTime, Hidden
        "Key": ""              // read-only, auto-generate
        "Read": false,        // false by default
        "CreatorUUID": "",    // read-only, auto-generate
        "Body": "",
        "Title": "",
        "UserUUID": "",
        "NavigationPath": "", // The destination path when clicking the notification
        "ButtonTitle": "", // The title to be displayed on the notification button
        "FlowData": { //contains the script's data 
            "FlowKey": "",
            "FlowParams": {
                "param1": {
                    "Source": "Static", // "Static" | "Dynamic"
                    "Value": "hi" // The value type should match the parameter type.
                },
                "param2": {
                    "Source": "Dynamic",
                    "Value": "myFlowVariable"
                }
            }
        }
    }
]
```

{% tabs %}
{% tab title="200: OK " %}
```javascript
```
{% endtab %}
{% endtabs %}
