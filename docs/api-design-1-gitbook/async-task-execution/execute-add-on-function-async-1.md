---
description: Same as regular async job but works FIFO
---

# POST add-on function - async queue

{% hint style="warning" %}
max body size is 256KB

max result size is 128KB
{% endhint %}

## execute POST add-on exported JS function&#x20;

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/v1.0/addons/api/queue/{addonUUID}/{queue_name}/{js_file_name}/{function_name}`

**Behavior with Queue vs Regular Async**

When using a queue, the flow works similarly to regular async jobs, but with the following differences:

1. **Initial Placement**
   * Instead of being pushed directly to the SQS, the job is first placed into a queue.
   * Its status changes from **Started** to **InQueue**.
   * Once it reaches its turn, the job is pushed to the SQS and continues like a regular async job (changing status to **InProgress**, and so on).
2. **Queue Parameter**
   * A queued job includes an additional parameter: `Queue={Name}`.
   * This indicates the queue it belongs to.
3. **Execution Safety**
   * When executing a job from the SQS, if the job belongs to a queue but is **not** in status **InQueue**, it is returned to the queue and its status is reset to **InQueue**.
   * This ensures that queued jobs are never run by mistake, for example in cases of timeouts, crashes, retries, or other failures.
   * Put simply: if a queued job is picked up for execution without the **InQueue** status, it is pushed back to the queue.

{% hint style="success" %}
When using a queue, jobs have an additional status called _InQueue_, which indicates that the job is currently waiting in the queue.<br>

1. "Failure" (ID: 0) - Job failed to complete successfully
2. "Success" (ID: 1) - Job completed successfully
3. "InProgress" (ID: 2) - Job is currently running
4. "Skipped" (ID: 3) - Job was skipped
5. "InRetry" (ID: 4) - Job is being retried after failure
6. "Started" (ID: 5) - Job has been initiated
7. "InQueue" (ID:6) - Jos is waiting in queue
8. "Dequeued" (ID:7) - Job is in transition from InQueue to InProgress
{% endhint %}

#### Query Parameters

same query parameters as async&#x20;

#### Headers

| Name               | Type   | Description                    |
| ------------------ | ------ | ------------------------------ |
| X-Pepperi-ActionID | String | supply action id for execution |

{% tabs %}
{% tab title="200 Note that the returned object from the function will be placed in the ResultObject in the AuditLog entry " %}
```
{
    "ExecutionUUID": "3274fbbc-8e62-42c8-bdde-21f9ccfd2506",
    "URI": "/audit_logs/3274fbbc-8e62-42c8-bdde-21f9ccfd2506"
} 
```
{% endtab %}
{% endtabs %}

## Create(Upsert) Queue

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/v1.0/addons/api/queue`

```json5
// body
{
    "AddonUUID": "0000-000-66",
    "QueueName": "myQueue",
    "MaxParallel": 1 // default is 1 
    "StuckAlertThresholdMs": 900000 // defaualt is 15 minutes
}
```

It creates a queue which is scheme that belongs to the async addon and it will return the scheme of the queue.

MaxParallel - how many jobs are processed in parallel&#x20;

StuckAlertThresholdMs - when a job is poped out of the queue if it was stuck in the queue more than the threshold, alert will be fired&#x20;

## Return the Queue jobs

<mark style="color:green;">`GET`</mark> `https://api.pepperi.com/v1.0/addons/api/queue/{addonUUID}/{queue_name}`

Returns all job UUIDs currently in the queue.

* **Pagination**: The default `page_size` is **100**.
* **Ordering**: Results are sorted by creation datetime in descending order, meaning the first item in the list is the most recently added job.
* **Queue Behavior**:
  * Under normal operation (when jobs are processed quickly), the queue is often empty.
  * Once a job is taken from the queue and inserted into SQS, it is removed from the queue.
* **Audit Logging**:
  * To perform an audit on queued jobs, refer to the **Audit Data Log** using the queue table as resource and using the job UUID.

**Headers**

| Name          | Value              |
| ------------- | ------------------ |
| Content-Type  | `application/json` |
| Authorization | `Bearer <token>`   |

**Query Parameters**

| Name         | Type   | Description              |
| ------------ | ------ | ------------------------ |
| `pages_size` | number | number of jobs returned  |

**Response**

{% tabs %}
{% tab title="200" %}
```json
{
  "ActionUUID": "1e02f9a3-1245-451f-bde2-9c0d1b3b4d45",
  "CreationDateTime": "2023-10-06T14:28:23.123Z"
}
```
{% endtab %}

{% tab title="400" %}
```json
{
  "error": "Invalid request"
}
```
{% endtab %}
{% endtabs %}
