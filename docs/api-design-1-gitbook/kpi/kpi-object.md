---
description: Its a general interface that combine all of the KPIs into one standard.
---

# KPI Object

To create a common interface for **KPI** (Key Performance Indicator) to monitor **event** and **synchronization metadata**, we need to design a standardized structure that can capture relevant performance data for both events and synchronization processes in a consistent and effective manner.

\
This common interface will streamline the tracking of key performance indicators for various processes, such as actions, feature usage, and server computing time, while enabling effective performance monitoring across events and synchronization activities.

{% hint style="info" %}
validate that **at least one** of the three fields (`Count`, DurationInMS, SizeInBytes) is provided (i.e., they are optional, but at least one must be present)
{% endhint %}

**KPI Interface (Minimum Fields)**

```json
{
    "ActionUUID": "12345678-1234-1234-1234-123456789012", 
    "Name": "OnClientPageButtonClick ", // string, This is a well defined string
    "Count": 1,  // optional, number, In case of an action that works on N objects - 1 by default for example such as for number of order center items/returned list values
    "DurationInMS": 1520, // optional, number
    "SizeInBytes": 15352, // optional, number, the size of the data sent in the process
    "AdditionalData": "", // optional, string, limited to 4kb
    "ObjectKeys": ["12345678-1234-1234-1234-123456789012"], // optional, Array of string
}
```

**KPI Object (Written in the Log)**

This is the **detailed object** that would be logged. It contains all relevant data to provide a comprehensive understanding of the event when viewed in the log.

```json
Every Thing from the KPI Interface Plus 
{
    "Type": "KPILog",
    "PlatformType": "iPad" | "iPhone" | "Android" | "WebApp"
}
```

**The data in the log line**

```json
Message: 
// Will contain the strigify KPI Object coming from the cpi side
```
