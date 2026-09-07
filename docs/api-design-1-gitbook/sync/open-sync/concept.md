---
description: A general introduction of the open sync interfaces
---

# Concept

### Objective

Define a solution for syncing ADAL data & files to clients, the solution needs to be "open" in the sense that each of the components in the solution is replacable allowing for custom sync logic, whilst not degrading the sync performance.

### Design Diagram

<figure><img src="../../.gitbook/assets/image (8).png" alt=""><figcaption><p>Diagram explain the flow of data</p></figcaption></figure>

### Meet the Players

#### Sync Addon

The **sync addon** is reponsible for the orchestration of the sync proccess. It allows **sync sources** to send ADAL objects and Files to the client, and manages the delta by storing the **LastSyncDateTime** of each source.

The **LastSyncDateTime** is a timestamp indicating that the client is updated up to a certain point in time, allowing the **sync** to return quickly and not even query the **sync source** when there has been no changes.

#### Sync Source Manager

The **sync source manager** handles the storing of **sync source manager** and their **LastSyncDateTime**.&#x20;

Sources add themselves to the **sync source manager**, and can update the **sync source manager** every time there are changes.&#x20;

The **sync addon** calls the **sync source manager** on every sync, sending its stored **LastSyncDateTime** per **sync source**, and the **sync source manager** will return any **sync sources** that have changes after that time.&#x20;

If the **sync source manager** has no **LastSyncDateTime** stored for a **sync source**, the **sync source** will be returned as well.

#### Sync Sources

These are the set of addons that implement the **sync source** interfaces, and register to the **source manager** allowing them to be part of the sync process.

The **sync sources** store changes in objects using **sync caches** that update the **source manager** every time there is a change in a **sync source.**

When changes are detected by the **sync addon**, it will call the changed **sync source**, which in turn will call its sync cache retrieving the changes. The **sync source** can then peform custom logic on these changes like filtering, transforming and appending files to be synced. The **sync source** response is returned to the **sync addon** which gets the data from the ADAL and the files from the PFS and sync to the client.&#x20;

Additionally, the **sync source** can define custom behaviour for the sync addon on how to handle the object retrieved from ADAL, like only syncing part of the fields, creating files based on these objects and setting the key and index of these objects.&#x20;

#### Sync Caches

**Sync caches** are a set of addons that implement the **sync cache** interface.&#x20;

The idea of a **sync cache** is to hold a copy of the keys of object index by their modification. This allows them to quickly return the set of object that have change in a certain delta. This is usually done on in-memory databases, though the interface does not require that.

Sync sources using a sync cache that can track changes to ADAL tables using PNS, or the sync source can update the cache manually.

Whever a **sync cache** detects a change in a **sync sources** data, it will update the **source manager** with **LastSyncDateTime** of the **sync source**

