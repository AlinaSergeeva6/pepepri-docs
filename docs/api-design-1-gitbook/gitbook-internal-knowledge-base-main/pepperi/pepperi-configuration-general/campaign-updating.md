# Campaign updating

**1.** **Introducing: when it\`s necessary and for which purposes**
-------------------------------------------------------------------



Lets tell that we have Sales Orders with Campaigns, which means that we can choose Departments before going to items:

![](<../../.gitbook/assets/image (386).png>)

When we choose items in 1 department and then go to it again, system will create 2 department transaction lines with same Department:

![](<../../.gitbook/assets/image (472).png>)

And in cart it will be shown like this (2 same departments with 2 same items):

![](<../../.gitbook/assets/image (466).png>)

We want the system to create only 1 for each department where we brought something, because in this case it’s much easier to interact and process with them.

&#x20;           To do that we need make 2 steps:

1\)     When we go to department, we will search transaction lines with same department code and update our items in transaction scope;

2\)     At the end, when we go to department menu, we will delete transaction lines with same department.

## **2. Required fields in Campaign and in Sales Order**



&#x20;           We need few calculated fields to have access to parent transaction UUID and department item code:

1\)     **TSAParentUUID** – field in Transaction Fields, which give us UUID of parent transaction. Code:

```
var ret=GetValueByApiName('PSARefToLeadingOrder');
return ret;
```

2\)     **TSAParentItemExternalID** – field in Transaction Fields, which give us access to External ID of parent item (department identifier). Code:

```
return TSACampaignItemReference.ExternalID;
```

![](file:///C:/Users/User/AppData/Local/Temp/msohtmlclip1/01/clip_image008.jpg)You need to add CampaignItemReference Item code from CampaignItemReference Fields to Available Fields.



## **3. First custom form for updating Campaign Order Center**

We need to search transaction lines with same department code and update our items in transaction scope. We will do it with custom form at the beginning (between NEW and IN CREATION in our workflow):

![](<../../.gitbook/assets/image (238).png>)

First of all, we should add our calculated fields and UUID to available fields **in Custom Form**

Code:

{% file src="../../.gitbook/assets/code1.txt" %}
Code 1
{% endfile %}

**4. Second custom form for removing old transaction lines**

&#x20;           We need to delete transaction lines with same department. We will do it with custom form at the end (between IN CREATION and IN CREATION in our workflow), red arrow:

![](<../../.gitbook/assets/image (376).png>)

&#x20;           Also we will need to do merging (black arrow), but more on that later.

First of all, we should add our calculated fields (TSAParentUUID and TSAParentItemExternalID) as in the first custom form

&#x20; Code:

{% file src="../../.gitbook/assets/code2.txt" %}
Code 2
{% endfile %}

#### Merging Transaction Lines:

![](<../../.gitbook/assets/image (381).png>)

We have 2 reasons to do that after our second custom form:

·       Updating DepartmentID field so we can find that transaction lines later;

·       Updating only after deleting, so we can save current transaction lines.
