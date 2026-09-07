---
description: System health notifications for ADAL Index update failures.
---

# ADAL Index

## Index Update Failure <a href="#index-synchronization-alerts" id="index-synchronization-alerts"></a>

**Name:** `ADAL Index - {ownerUUID} - {tableName}`\
<br>

**Description:** Index update failed

**Broadcast Channel:** `System`

#### Description <a href="#pns-update-failure-e2-9d-8c" id="pns-update-failure-e2-9d-8c"></a>

This alert is triggered when PNS operation fails to update index after 3 retries. This can get triggered from any of these `rows_inserted`, `rows_removed`, `values_changed`, `references_changed`, `referenced_resource_changed` PNS operations.\
The alert name contains `ownerUUID`, which identifies the `addonUUID` of the addon that owns the table `{tableName}`.

#### Action <a href="#pns-update-failure-e2-9d-8c" id="pns-update-failure-e2-9d-8c"></a>

Perform clean rebuild via [clean-rebuild.md](../../indexed-adal/index-adal/clean-rebuild.md "mention")

