---
title: "Connect/Disconnect Buyer Job"
description: "Estimated time to implement for new environment - 1d"
order: 29
---
# Connect/Disconnect Buyer Job

*Estimated time to implement for new environment - 1d*

### Description

Connect/Disconnect Buyer Job is a feature that allows you to expose to customer possibility to activate/deactivate buyer in Pepperi. In order to do that without this feature customer needs to login as admin and go to activity list after contacts file was uploaded, then connect/disconnect already uploaded buyer. So this feature allows to do automation of this process

### Advantages and disadvantages

!!!success
Automation of connect/disconnect buyer process
!!!

!!!danger
Requires customer to perform custom HTTP requests to Pepperi IPaaS
!!!

### Demo - how does it work

Since this is a schedule job, which has no UI in order to see it works you need to send HTTP request from Postman for example

2KB

[Connect-Disconnect Buyer Job Postman.postman\_collection.json](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2FkhenDVaaqydSket4JKTd%2FConnect-Disconnect%20Buyer%20Job%20Postman.postman_collection.json?alt=media&token=d2119408-28fb-49a6-9449-507532e76925)

[Open](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2FkhenDVaaqydSket4JKTd%2FConnect-Disconnect%20Buyer%20Job%20Postman.postman_collection.json?alt=media&token=d2119408-28fb-49a6-9449-507532e76925)

After any of these requests will be triggered you can see that buyer with this email will be actually connected/disconnected

### How to copy to another environment

!!!info
This job will require your patience and being attention!
!!!

1.  Copy group of tasks **"Connect Buyers using API"** from **Services Demo Environment** plugin to your target plugin
2.  Create schedule job from each subfolder. There should be 6 jobs, **None** **of them scheduled.** Use Create Job From Task button do it it easily

    ![](/static/image-960.png)

     List of created jobs:

    1.  Catch Connect Webhook
    2.  Catch Disconnect Webhook
    3.  Connect Buyer
    4.  Disconnect Buyer
    5.  Is Already Buyer
    6.  Is Already Disconnect Buyer

3.  Rename each of the task inside subfolders to represent JOB ID:

    ![](/static/image-961.png)

     result:

    ![](/static/image-962.png)

4.  Edit this task:

    ![](/static/image-963.png)

     Change source to be the task with correct name:

    ![](/static/image-964.png)

     Change mapping to represent correct next job ID. Logic is pretty simple - if contact is a buyer we will fire job 'Is Already Buyer' otherwise we will trigger 'Connect Buyer' so in IIF we need to fill in this case jobs IDs of relevant jobs:

    ![](/static/image-965.png)

     result will look accordingly:

    ![](/static/image-966.png)

5.  Edit this task:

    ![](/static/image-967.png)

     Change source of the task:

    ![](/static/image-968.png)

     go to HTTP tab, change token, make sure you are using YOUR ENVIRONMENT token:

    ![](/static/image-969.png)

6.  Repeat steps 4-5 for folder Catch Disconnect Webhook. Logic for Check If Already Disconnect Buyer is the same - either your buyer is connected and you need to disconnect it or it is already disconnected and you need to run job which says it is already disconnected buyer

    ![](/static/image-970.png)

7.  Fix sources here in these tasks

    ![](/static/image-971.png)

     in task Connect Buyer edit HTTP tab you need to edit 2 values:

    ![](/static/image-972.png)

     The first one, profile ID is a contact person profile ID, usually Buyer, take it from pepperi resources in ipaas

    ![](/static/image-973.png)

     Second one is optional and can be taken from here in backoffice

    ![](/static/image-974.png)

    ![](/static/image-975.png)

     or can be removed at all

8.  Repeat steps 7-8 for disconnect buyer folder

    ![](/static/image-976.png)

9.  There are 2 almost the same folders

    ![](/static/image-977.png)

     Edit these tasks sources. You can edit email send properties here

    ![](/static/image-978.png)

10.  Prepare Postman Library for customer You can download example here with 3 major changes for each request 1. change auth token

     ![](/static/image-979.png)

      2. change job id to represent ID of catch connect or catch disconnect job accordingly

     ![](/static/image-980.png)

      3. change body so it will be clear to customer or maybe just explain what each parameter means

     ![](/static/image-981.png)

### Advanced configuration

If customer is not created yet in pepperi you might need to export them before checking buyer. In order to do that please add additional task to job:

![](/static/image-982.png)

![](/static/image-983.png)
