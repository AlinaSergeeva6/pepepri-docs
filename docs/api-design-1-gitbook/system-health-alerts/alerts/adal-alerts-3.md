---
description: The alert name identifies jobs that have been abandoned in the queue.
---

# Orphaned Job

## Orphaned Job Alert

**Name:** `Orphaned Job Detected`

**Description:** Job {jobKey} orphaned - no activity for over 15 minutes in a non-terminal state

**Broadcast Channel:** External, System, Tenant

#### Description

This alert is triggered when a job remains in a non-terminal status (InProgress, InRetry, Started, Dequeued) for longer than the orphaned threshold (default: 15 minutes) without any status updates. The job is automatically removed from the queue when detected.

**Common causes:**

* Lambda crashed during job execution
* Network issues preventing status updates
* Unexpected exception in job processing code
* System shutdown during job execution

**Alert Details:** DistributorID, JobKey, AddonUUID, QueueName, Status, CreationDateTime, OrphanedDuration

#### Action

1. **Investigate Job Failure:**
   * Check CloudWatch logs for the job's execution history
   * Look for exceptions, timeouts, or infrastructure failures
2. **Determine Recovery:**
   * Use the restart from VAR job list to retry the job if the issue was transient
   * Review and fix code issues if job consistently becomes orphaned

