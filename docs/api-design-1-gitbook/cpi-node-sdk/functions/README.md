# Functions

## Journey Tracker

<details>

<summary><strong>pepperi.journey.log()</strong></summary>

Insert a record to the Journey file using the CPINode sdk.\
Refer [**Tracked Events Files**](https://apidesign.pepperi.com/journey-tracker/journey-tracker-files)**.**&#x20;

Params:

* eventName: string
* data: object

**Usage example:**

```javascript
pepperi.journey.log({
    eventName: 'eventName',
    data: {
        transactionKey: 'abcd1234',
        tabName: 'tabNameValue'
    }
})
```



</details>

***

## Environment Information

<details>

<summary>pepperi.environment.info()</summary>

Get the current environment information object

**Usage example:**

```typescript
pepperi.environment.info()
```

**Result**

<pre class="language-json"><code class="lang-json"><strong>{
</strong>    deviceID: string, // "5CA77DF6-02E2-5DEE-859D-738CC5964811" | "667531dfb4fb23b7"
    timeZoneDiff: string, // "10800"
    softwareVersion: string, // "17.10000480"
    platformType: string, // "iPad" | "iPhone" | "Android" | "WebApp"
    deviceModel: string, // "iPad (x86_64)" | "sdk_gphone64_arm64"
    deviceName: string, // "iPad" | "google"
    systemName: string, // "iPadOS" | "Android OS"
    systemVersion: string, // "16.1" | "12"
    locale: string, // "en" | "en-us"
    screenType: string // "Phablet" | "Tablet" | "Desktop". current app size
<strong>}
</strong></code></pre>

</details>

***

## Sync

<details>

<summary>pepperi.application.sync.stateInfo()</summary>

```javascript
// return sync state object
pepperi.application.sync.stateInfo()
{
    status: "Success", // "InProgress" / "Error"
    lastSyncStaus: "Success", // "Error"
    lastSyncTime: "2023-08-09T09:16:32.774Z"
}
```

</details>

***

## Fatal

<details>

<summary>pepperi.fatal()</summary>

Kill the app using the Node.js environment.

Log a message before terminating the app.

Params:

* fatalMessage: string

**Usage example:**

```
pepperi.fatal('This is sparta!!!')
```

</details>

***

## Configurations

<details>

<summary>pepperi.addons.configurations.get(key: string)</summary>

get the configuration objects by key.

Params:

* key: string

**Usage example:**

```typescript
const configurationObject = await pepperi.addons.configurations.get(key)
const configuration = configurationObjects.Data
```

</details>

***

## LocalStorage

LocalStorage allows you to save and require app data in the form of keys and objects and provides a simple method to read and write them.\
\
**Important Note:** LocalStorage is **local**, meaning the data is not synced. hence, all data will be lost after **Resync**.

<details>

<summary>pepperi.addons.localStorage.uuid("AddonUUID").table("TableName").upsert({Key: key})</summary>

set a LocalStorage key-object pair.\
**Params:**

&#x20;      \- AddonUUID: string\
&#x20;      \- TableName: string\
&#x20;      \- Key: string\
&#x20;      \- Hidden: boolean // Optional

**Usage Example:**

```typescript
pepperi.addons.localStorage.uuid({AddonUUID}).table({TableNAme}).upsert({
    Key: "key",
    MySpecialValue: "NotSoSpecialValue"
})
```

**Result:**

```typescript
The Upserted Object
```

</details>

<details>

<summary>pepperi.addons.localStorage.uuid("AddonUUID").table("TableName").key("myKey").get()</summary>

get a LocalStorage object by key.\
**Params:**

&#x20;      \- AddonUUID: string\
&#x20;      \- TableName: string\
&#x20;      \- key: string

**Usage Example:**

```typescript
pepperi.addons.localStorage.uuid({AddonUUID}).table({TableName}).key("myKey").get()
```

**Result**

<pre class="language-typescript"><code class="lang-typescript"><strong>// The stored object
</strong><strong>{
</strong><strong>            AddonUUID: string, 
</strong>            CreationDateTime : ISOString,
            ModificationDateTime: ISOString,
            Key: string, // concatenated key - AddonUUID + Table + DataKey
            DataKey: string, // the original key
            Table: string,
            [key: string]: any 
}
</code></pre>

</details>

<details>

<summary>pepperi.addons.localStorage.uuid("AddonUUID").table("TableName").search()</summary>

Note: Search params, where close etc. are not supported.

Get all localStorage records by AddonUUID and TableName\
**Params:**\
&#x20;      \- AddonUUID: string\
&#x20;      \- TableName: string

```typescript
pepperi.addons.localStorage.uuid({AddonUUID}).table({TableName}).search()
```

**Result**

<pre class="language-typescript"><code class="lang-typescript"><strong>{
</strong><strong>    Objects:
</strong><strong>        {
</strong><strong>            AddonUUID: string, 
</strong><strong>            CreationDateTime : ISOString,
</strong><strong>            ModificationDateTime: ISOString,
</strong><strong>            Key: string, // concatenated key - AddonUUID + Table + DataKey
</strong>            DataKey: string, // the original key
            Table: string,
            [key: string]: any
<strong>        }[]
</strong><strong>}
</strong></code></pre>

</details>

***

## AddonCPI Relation

LocalStorage allows you to save and require app data in the form of keys and objects and provides a simple method to read and write them.\
\
**Important Note:** LocalStorage is **local**, meaning the data is not synced. hence, all data will be lost after **Resync**.

<details>

<summary><strong>pepperi.addons.data.relations.upsert({{relation}})</strong></summary>

upsert an AddonCPI [relation](https://apidesign.pepperi.com/addon-relations/addons-link-table)&#x20;

**Params:**

&#x20;      Relation object

**Usage Example:**

```typescript
pepperi.addons.data.relations.upsert({{relation}})
```

**Result**

<pre class="language-typescript"><code class="lang-typescript"><strong>// The stored relation
</strong><strong>{
</strong>    AddonUUID: string;
    Name: string;
    RelationName: string;
    Type: RelationType;
    Description?: string;
    AddonRelativeURL?: string;
    Hidden?: boolean
    [key: string]: any;
}
</code></pre>

</details>

<details>

<summary>pepperi.addons.data.relations.search({{searchBody}});</summary>

get AddonCPI relations\
\
**Params:**

```
searchBody:  {
       Where: string
}
```

**Usage Example:**

```typescript
pepperi.addons.data.relations.search({{searchBody}});
```

**Result**

<pre class="language-typescript"><code class="lang-typescript"><strong>// The match relations
</strong>{
    AddonUUID: string;
    Name: string;
    RelationName: string;
    Type: RelationType;
    Description?: string;
    AddonRelativeURL?: string;
    Hidden?: boolean // only when Hidden: false the relation will be returned
    [key: string]: any;
}[]
</code></pre>

</details>

***

## KPI

The KPI SDK is designed to monitor and record the performance metrics of task executions within Pepperi's system.

<details>

<summary><strong>pepperi.kpi.log({{log_object}})</strong></summary>

**Params:**

```typescript
interface KPILogParams {
    ActionUUID: string; //(UUID)
    Name: string; // A well defined string
    Count?: number; // in case of an action that works on N objects - 1 by default for example such as for number of order center items/ returned list values
    DurationInMS?: number; // Duration in milliseconds
    SizeInBytes?: number; // Optional, Size of the data related to the event (in bytes)
    AdditionalData?: string; // Optional, string, limited to 4kb
    ObjectKeys?: Array<string>; // Optional, Array of string,
}
```

**Usage Example:**

```typescript
pepperi.kpi.log({
    "ActionUUID": "12345678-1234-1234-1234-123456789012",
    "Name": "Sync - Total Time",
    "Count": 1,
    "DurationInMS": 1520,
    "SizeInBytes": 0,
    "AdditionalData": "",
    "ObjectKeys": ["12345678-1234-1234-1234-123456789012"]
})
```

**Result**\
non&#x65;**.**

**Final CloudWatch log line**

```typescript
// ActionUUID on @message property is the Key
// Cloudwatch Message property string
'Message: { Type: "KPILog", "Name":"OnClientPageButtonClick_KPI_LOG","CreationDateTime":"2017-01-01T00:00:00Z","ActionUUID":"12345678-1234-1234-1234-123456789012","Count":1,"DurationInMS":1520,"SizeInBytes":15352,"AdditionalData":"","ObjectKeys":["12345678-1234-1234-1234-123456789012"],"PlatformType":"iPad","DeviceID":"DADD8DE1-B48C-57BD-A7EC-9D53B9276F44"}'
```

</details>

<details>

<summary><strong>pepperi.kpi.context({{context_params}})</strong></summary>

**overload context properties that will be added to the kpi.log data**&#x20;

**Params:**

```typescript
ObjectKeys?: Array<string> // optional. up to size of 3. pageKey | buttonKey | transactionKey
Count?: number // in case of an action that works on N objects - 1 by default

// developer-use attributes only. not part of the KPI data model.
AdditionalData?: Array<string|number|boolean> // optional. up to size of 5. each string is limited to 40 chars max
```



**Usage Example:**

```typescript
pepperi.kpi.context({
    "ObjectKeys": ["MyButton"],
    "Count": 7,
    "AdditionalData": ["error", 2] // e.g nucleus load error
})
```

**Result**\
non&#x65;**.**

</details>
