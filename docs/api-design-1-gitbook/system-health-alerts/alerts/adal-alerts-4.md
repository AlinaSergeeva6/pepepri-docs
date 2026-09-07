---
description: The alert identifies jobs that failed to process after being stuck in queue.
---

# Stuck Job

## Stuck Job Processing Failed Alert

**Name:** `Stuck Job Processing Failed: {jobKey}`

**Description:** Job stuck in queue for extended period and failed to process

**Broadcast Channel:** External, System, Tenant

#### Description

This alert is triggered when the dequeue mechanism attempts to process a job that has been waiting in the queue for longer than the configured `RemoveFailedJobThresholdMs` (default: 15 minutes) AND encounters an error reading or processing the job from ADAL. The job is automatically removed from the queue.

**Common causes:**

* Job deleted from ADAL but still in queue
* ADAL connectivity issues
* Data corruption in job record
* Permission issues accessing job data

**Alert Details:** DistributorID, JobKey, AddonUUID, QueueName, CreationDateTime, Age (minutes), Error message

#### Action

1. **Check Job Status:**
   * Verify if job still exists in ADAL using the jobs list
   * Check job data integrity if accessible
2. **Review Error:**
   * Examine the error message for root cause
   * Check ADAL service health if error indicates connectivity issues
3. **Restart Job (if needed):**
   * Use the restart command to recreate the job if it was incorrectly removed
   * Fix underlying data issues before resubmitting

