---
description: System health notifications for ADAL Clean rebuild failure.
---

# ADAL Index - Clean Rebuild

## Clean Rebuild Failure <a href="#index-synchronization-alerts" id="index-synchronization-alerts"></a>

**Name:** `ADAL Index - {ownerUUID} - {tableName}`\
<br>

**Description:** Clean rebuild failed

**Broadcast Channel:** `System`

#### Description <a href="#pns-update-failure-e2-9d-8c" id="pns-update-failure-e2-9d-8c"></a>

This alert is triggered when Clean Rebuild fails (schema lock, DynamoDB/OpenSearch issues)\
Alert name contains `ownerUUID`  which represents the addonUUID of the owner of the table `{tableName}`&#x20;

#### Action <a href="#pns-update-failure-e2-9d-8c" id="pns-update-failure-e2-9d-8c"></a>

Retry [clean-rebuild.md](../../indexed-adal/index-adal/clean-rebuild.md "mention")

