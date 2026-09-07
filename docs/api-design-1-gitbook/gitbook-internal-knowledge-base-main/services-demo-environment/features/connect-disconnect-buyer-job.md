---
description: Estimated time to implement for new environment - 1d
---

# Connect/Disconnect Buyer Job

### Description

Connect/Disconnect Buyer Job is a feature that allows you to expose to customer possibility to activate/deactivate buyer in Pepperi. In order to do that without this feature customer needs to login as admin and go to activity list after contacts file was uploaded, then connect/disconnect already uploaded buyer. So this feature allows to do automation of this process

### Advantages and disadvantages

{% hint style="success" %}
Automation of connect/disconnect buyer process
{% endhint %}

{% hint style="danger" %}
Requires customer to perform custom HTTP requests to Pepperi IPaaS
{% endhint %}

### Demo - how does it work

Since this is a schedule job, which has no UI in order to see it works you need to send HTTP request from Postman for example



{% file src="../../.gitbook/assets/Connect-Disconnect Buyer Job Postman.postman_collection.json" %}

After any of these requests will be triggered you can see that buyer with this email will be actually connected/disconnected&#x20;

### **How to copy to another environment**

{% hint style="info" %}
This job will require your patience and being attention!&#x20;
{% endhint %}

1. Copy group of tasks **"Connect Buyers using API"** from **Services Demo Environment** plugin to your target plugin
2. Create schedule job from each subfolder. There should be 6 jobs, **None** **of them scheduled.** Use Create Job From Task button do it it easily\
   ![](<../../.gitbook/assets/image (278).png>)\
   List of created jobs:
   1. Catch Connect Webhook
   2. Catch Disconnect Webhook
   3. Connect Buyer
   4. Disconnect Buyer
   5. Is Already Buyer
   6. Is Already Disconnect Buyer
3. Rename each of the task inside subfolders to represent JOB ID:\
   ![](<../../.gitbook/assets/image (252).png>)\
   result:\
   ![](<../../.gitbook/assets/image (248).png>)
4. Edit this task:\
   ![](<../../.gitbook/assets/image (266).png>)\
   Change source to be the task with correct name:\
   ![](<../../.gitbook/assets/image (274).png>)\
   Change mapping to represent correct next job ID. Logic is pretty simple - if contact is a buyer we will fire job 'Is Already Buyer' otherwise we will trigger 'Connect Buyer' so in IIF we need to fill in this case jobs IDs of relevant jobs:\
   ![](<../../.gitbook/assets/image (258).png>)\
   result will look accordingly:\
   ![](<../../.gitbook/assets/image (253).png>)
5. Edit this task:\
   ![](<../../.gitbook/assets/image (215).png>)\
   Change source of the task:\
   ![](<../../.gitbook/assets/image (254).png>)\
   go to HTTP tab, change token, make sure you are using YOUR ENVIRONMENT token:\
   ![](<../../.gitbook/assets/image (279).png>)
6. Repeat steps 4-5 for folder Catch Disconnect Webhook. Logic for Check If Already Disconnect Buyer is the same - either your buyer is connected and you need to disconnect it or it is already disconnected and you need to run job which says it is already disconnected buyer\
   ![](<../../.gitbook/assets/image (251).png>)
7. Fix sources here in these tasks\
   ![](<../../.gitbook/assets/image (264).png>)\
   in task Connect Buyer edit HTTP tab you need to edit 2 values:\
   ![](<../../.gitbook/assets/image (246).png>)\
   The first one, profile ID is a contact person profile ID, usually Buyer, take it from pepperi resources in ipaas\
   ![](<../../.gitbook/assets/image (249).png>)\
   Second one is optional and can be taken from here in backoffice![](<../../.gitbook/assets/image (268).png>)\
   ![](<../../.gitbook/assets/image (87).png>)\
   or can be removed at all
8. Repeat steps 7-8 for disconnect buyer folder\
   ![](<../../.gitbook/assets/image (275).png>)
9. There are 2 almost the same folders\
   ![](<../../.gitbook/assets/image (255).png>)\
   Edit these tasks sources. You can edit email send properties here\
   ![](<../../.gitbook/assets/image (247).png>)
10. Prepare Postman Library for customer\
    You can download example here with 3 major changes for each request\
    1\. change auth token\
    ![](<../../.gitbook/assets/image (216).png>)\
    2\. change job id to represent ID of catch connect or catch disconnect job accordingly\
    ![](<../../.gitbook/assets/image (76).png>)\
    3\. change body so it will be clear to customer or maybe just explain what each parameter means\
    ![](<../../.gitbook/assets/image (270).png>)

### Advanced configuration

If customer is not created yet in pepperi you might need to export them before checking buyer. In order to do that please add additional task to job:\
&#x20;![](<../../.gitbook/assets/image (243).png>)![](<../../.gitbook/assets/image (267).png>)
