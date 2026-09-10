---
title: "Campaign updating"
order: 314
---
# Campaign updating

## 1. Introducing: when it`s necessary and for which purposes

Lets tell that we have Sales Orders with Campaigns, which means that we can choose Departments before going to items:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-47.png)

When we choose items in 1 department and then go to it again, system will create 2 department transaction lines with same Department:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-48.png)

And in cart it will be shown like this (2 same departments with 2 same items):

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-49.png)

We want the system to create only 1 for each department where we brought something, because in this case it’s much easier to interact and process with them.

To do that we need make 2 steps:

1) When we go to department, we will search transaction lines with same department code and update our items in transaction scope;
2) At the end, when we go to department menu, we will delete transaction lines with same department.

## 2. Required fields in Campaign and in Sales Order

We need few calculated fields to have access to parent transaction UUID and department item code:

1) **TSAParentUUID** – field in Transaction Fields, which give us UUID of parent transaction. Code:

```
var ret=GetValueByApiName('PSARefToLeadingOrder');
return ret;
```

2) **TSAParentItemExternalID** – field in Transaction Fields, which give us access to External ID of parent item (department identifier). Code:

```
return TSACampaignItemReference.ExternalID;
```

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/clip_image008.jpg)

You need to add CampaignItemReference Item code from CampaignItemReference Fields to Available Fields.

## 3. First custom form for updating Campaign Order Center

We need to search transaction lines with same department code and update our items in transaction scope. We will do it with custom form at the beginning (between NEW and IN CREATION in our workflow):

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-50.png)

First of all, we should add our calculated fields and UUID to available fields **in Custom Form**

Code:

2KB

[code1.html](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-legacy-files/o/assets%2F-LfO_rsQzfnV957oTV_f%2F-Ls2SCt8ar6cDzO_ZD-8%2F-Ls2VSe4vcoKrsgx3d5y%2Fcode1.html?alt=media&token=1be09668-36f4-4212-a881-b9361b7aefc5)

[Open](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-legacy-files/o/assets%2F-LfO_rsQzfnV957oTV_f%2F-Ls2SCt8ar6cDzO_ZD-8%2F-Ls2VSe4vcoKrsgx3d5y%2Fcode1.html?alt=media&token=1be09668-36f4-4212-a881-b9361b7aefc5)

Code 1

**4\. Second custom form for removing old transaction lines**

We need to delete transaction lines with same department. We will do it with custom form at the end (between IN CREATION and IN CREATION in our workflow), red arrow:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-51.png)

Also we will need to do merging (black arrow), but more on that later.

First of all, we should add our calculated fields (TSAParentUUID and TSAParentItemExternalID) as in the first custom form

Code:

2KB

[code2.html](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-legacy-files/o/assets%2F-LfO_rsQzfnV957oTV_f%2F-Ls2SCt8ar6cDzO_ZD-8%2F-Ls2WRqaYuIQf_1wu9-W%2Fcode2.html?alt=media&token=ddedf418-7557-4d2b-890b-56f1fb55a26a)

[Open](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-legacy-files/o/assets%2F-LfO_rsQzfnV957oTV_f%2F-Ls2SCt8ar6cDzO_ZD-8%2F-Ls2WRqaYuIQf_1wu9-W%2Fcode2.html?alt=media&token=ddedf418-7557-4d2b-890b-56f1fb55a26a)

Code 2

#### Merging Transaction Lines:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-52.png)

We have 2 reasons to do that after our second custom form:

· Updating DepartmentID field so we can find that transaction lines later;

· Updating only after deleting, so we can save current transaction lines.
