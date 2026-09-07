---
description: Pepperi Queue mechanism is stuck
---

# Queue Stuck

## Queue Stuck Alert <a href="#index-synchronization-alerts" id="index-synchronization-alerts"></a>

**Name:** `Queue Stuck: {queueName}`\
For example iPaaS\_Webhooks\_Queue&#x20;

**Description:** Jobs waiting in queue for over {the configured threshold duration (default: 15 minutes)}

**Broadcast Channel:** System, External and Tenant<br>

#### Description <a href="#pns-update-failure-e2-9d-8c" id="pns-update-failure-e2-9d-8c"></a>

This alert is triggered when jobs in a queue are waiting longer than the configured `StuckAlertThresholdMs` threshold (default: 15 minutes) before being processed. The alert indicates potential queue performance issues, bottlenecks, or system problems preventing jobs from executing.

#### Origin and Cause

The alert originates from the AsyncAddon's queue dequeue mechanism. During each dequeue operation, the system checks the age of jobs in the queue's head window by comparing their `CreationDateTime` against the configured threshold.

**Common causes:**

* **MaxParallel limit reached:** All available execution slots are occupied by long-running jobs
* **System overload:** Lambda execution capacity exhausted
* **Job failures:** Jobs repeatedly failing and consuming retry attempts
* **External dependencies:** Downstream services slow or unavailable
* **Configuration issues:** MaxParallel set too low for queue volume

#### Rate Limiting

To prevent alert spam, the system implements a 1-hour rate limit (`STUCK_ALERT_RATE_LIMIT_MS`). If a queue remains stuck, new ERROR alerts will only be sent once per hour. The system automatically clears old alerts when the queue recovers to allow fresh notifications if problems recur.

#### Alert Details Provided

* **DistributorID:** The tenant owning the queue
* **AddonUUID:** The addon owning the queue
* **QueueName:** The affected queue
* **OldestJobKey:** The UUID of the oldest waiting job
* **OldestJobAge:** How long the oldest job has been waiting (in minutes)
* **Threshold:** The configured stuck threshold (in minutes)

#### Action <a href="#pns-update-failure-e2-9d-8c" id="pns-update-failure-e2-9d-8c"></a>

When this alert is received, perform the following diagnostic steps:

1. **Check Queue Status:**
   * Use the queue UI per tenant or VAR job list to view current queue depth and job statuses
   * Identify how many jobs are waiting vs. in-progress
2. **Investigate Running Jobs:**
   * Check if jobs are stuck in execution (exceeding expected runtime)
   * Review job logs for errors or performance issues
   * Verify external dependencies are responding normally
3. **Review Queue Configuration:**
   * Check if `MaxParallel` is appropriately sized for queue volume
   * Consider increasing MaxParallel if queue consistently backs up during peak loads
   * Verify `StuckAlertThresholdMs` threshold is appropriate for job complexity
4. **Monitor System Resources:**
   * Check lambda execution metrics for throttling or timeouts
   * Verify sufficient AWS Lambda capacity is available
   * Review CloudWatch logs for system-level errors
5. **Clear Backlog (if needed):**
   * If jobs are permanently stuck, consider using the stop option in VAR job list to cancel failed jobs
   * Use the restart API to retry jobs that failed due to transient issues
   * For persistent issues, investigate and fix root cause before reprocessing

