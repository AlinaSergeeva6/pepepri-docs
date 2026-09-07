---
description: 'Effort Estimation: 1 day'
---

# Bulk Processing Activity

There are several jobs on Demalogica's iPaaS that process some activities in bulk that are triggered manually. Going to settings and searching the needed job is time-consuming, so a better solution was created.

Activity "Bulk Processing Activity" have a single UDT dropdown with bulk processing jobs:

<figure><img src="../.gitbook/assets/Screenshot 2026-01-06 at 19.17.52.png" alt=""><figcaption></figcaption></figure>

Once the option is selected, we get job ID from UDT. Then, on-submit webhook triggers the job:

<figure><img src="../.gitbook/assets/Screenshot 2026-01-06 at 19.18.43.png" alt=""><figcaption></figcaption></figure>
