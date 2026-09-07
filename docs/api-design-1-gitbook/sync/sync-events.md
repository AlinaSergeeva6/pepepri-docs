---
description: Events
---

# Sync Events

**OnClientSyncRequest** - Fired on client sync request. **Event Data:**

```
// Sync is constructed of PUT request followed by a GET request supplied with
// a desired DateTime (delta)

{
    SaveDataOnly: boolean // default - false. whether to only save data on the server (PUT request) or not, with out the GET request in order to enable a local DB reset before making a later GET request. true when hard resync is applied
}
```

**OnClientSyncObjectRequest** - Fired on client sync object request. **Event Data:**

<pre><code><strong>// sync focuses on synchronizing general data,
</strong><strong>// while syncObject not only synchronizes general data but also retrieves specific account-related data.
</strong><strong>// The distinction is important for the Webapp client,
</strong><strong>// ensuring that the necessary account-related data is updated and available for Admin/Rep roles,
</strong><strong>// beyond the scope of regular sync operations.
</strong><strong>
</strong><strong>//// in previous meeting there were suggestions to convert
</strong><strong>//// ObjectUUID -> key, ObjectType -> resource
</strong><strong>//// converting ObjectType -> resource requires change in many sensitive areas in the CPI code 
</strong><strong>//// do we still want the conversion?
</strong><strong>
</strong><strong>{
</strong>    ObjectUUID: string, // object unique id 
    ObjectType: string, // db object type. Enum - CPIOrder, CPIStore
    SaveDataOnly: boolean // default - false.
}
</code></pre>

**OnClientResyncRequest** - Fired on client resync request. **Event Data:**

```
// Resync is constructed of PUT request followed by a GET request

{
    DbPath: string // local db path
}
```

**OnClientFullSyncRequest -** Fired on client full sync request. **Event Data:**

```
// emitted during the very first login of a user.
// FullSync constructed of a GET request only.

{
    DbPath: string // local db path
}
```

**OnClientAbortSyncRequest** - Fired on client abort request. **Event Data:**

```
{}
```

