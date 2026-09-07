---
description: The alert identifies jobs that exhausted all retry attempts.
---

# Max Retries Exceeded

## Max Retries Exceeded Alert

**Name:** `Max Retries Exceeded: {jobKey}`

**Description:** Job exceeded maximum retries and was removed from queue

**Broadcast Channel:** External, System, Tenant

#### Description

This alert is triggered when a job in the queue has exhausted all configured retry attempts (`NumberOfTry >= NumberOfTries`). The job is automatically removed from the queue to prevent infinite retry loops. This is detected during the dequeue operation when processing Dequeued jobs.

**Common causes:**

* Persistent code errors in addon logic
* External dependencies consistently unavailable
* Invalid input data causing repeated failures
* Insufficient retry attempts for job complexity

**Alert Details:** DistributorID, JobKey, AddonUUID, QueueName, CreationDateTime, NumberOfTries

#### Action

1. **Review Job Logs:**
   * Check execution logs to identify the failure pattern
   * Determine if failures are code errors or external issues
2. **Fix Root Cause:**
   * Correct code bugs if error is in addon logic
   * Verify external dependencies are available
   * Validate input data if data-related failure
3. **Adjust Retry Configuration:**
   * Increase `retry` parameter if legitimate transient failures require more attempts
   * Consider exponential backoff if not already implemented
4. **Restart Job (if appropriate):**
   * Use restart command injob list after fixing the underlying issue
   * Ensure root cause is resolved before restarting to avoid repeated failures

