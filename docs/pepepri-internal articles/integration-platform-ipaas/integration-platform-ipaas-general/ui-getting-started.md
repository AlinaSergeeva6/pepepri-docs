---
title: "UI - Getting started"
description: "You can find existing solution in “Integration Examples” (6685) Pepperi integration platform account, UI task: \"Training Example” and \"Report By Email\" Dataflow task"
order: 249
---
# UI - Getting started

*You can find existing solution in “Integration Examples” (6685) Pepperi integration platform account, UI task: "Training Example” and "Report By Email" Dataflow task*

This article describes an example that can give you a general understanding of the structure and functionality of the UI task and also some important nuances of using api functions, receiving data and sending data are considered.

**The task consists of:**

1\. Use an api function that takes the fields of the lines of the current transaction;

2\. Recalculate prices and update them using the api function;

3\. Send updated data to the dataflow task that sends pdf to email with a notification about the updated data

#### First, let's look at how we can induce UI task

After you have created a UI task, click the "run" button, after this the following window will be available:

![](https://alinasergeeva6.github.io/pepepri-docs/static/1-12.png)

Copy the left part (to which the arrow points) ---> create a custom form in the back office ---> paste the copied text into a custom form. Then you can call this task wherever you need it: in workflow, or, for example, in a program. In this example, the UI task will be called in the program that is in the cart.

**ui\_page\_head** \- It is used to create javascript code. You can use also jQuery, Kendo;

**ui\_page\_body** \- html+css

f**unction on\_load() {}** - in this function, you need to add a function that should be called when the UI task is called. In our case, we use an api function that will take lines from the current transaction:

```
<script>
    function on_load() {
        call_client_api({
            method_name: 'pepperi.api.transactionLines.search',
            request_object: {
                fields: ["UUID", "ItemExternalID", "UnitPrice"],
                filter: {
                    Operation: "AND",
                    LeftNode: {
                        ApiName: "Transaction.UUID",
                        Operation: "IsEqual",
                        Values: [wfobject.UUID]
                    },
                    RightNode: {
                        ApiName: "Hidden",
                        Operation: "IsEqual",
                        Values: ["false"]
                    }
                },

                pageSize: 100000,
                page: 1,
                responseCallback: "transactionLinesCallback",
            }
        });
    }

    function transactionLinesCallback(data) {
        console.log(data);
    }
</script>
```

Note that the syntax for api functions is slightly different from their usual form. And if you need use workflowObject , in UI task call it like **wfobject.**

![](https://alinasergeeva6.github.io/pepepri-docs/static/2-7.png)

Using **get\_data(){}** you can call dataflow task. **task\_name** \- name of Dataflow task

**post\_array** \- data that you want to send

After finishing writing the code, create a dataflow task with the following settings:

![](https://alinasergeeva6.github.io/pepepri-docs/static/2021-01-04_15h50_57.png)

**\*~Email~\* -** this is way to call variable from post\_array

**pdf\_html\_code -** put here you data &lt;div>\*~data~\*&lt;/div>

After the completion of the UI task, you will receive the following email with the attachment:

![](https://alinasergeeva6.github.io/pepepri-docs/static/2021-01-04_15h56_43.png)

![](https://alinasergeeva6.github.io/pepepri-docs/static/2021-01-04_15h57_10.png)

You can add &lt;style>&lt;/style> tags into **pdf\_html\_code and** style the table

3KB

[UI\_training\_example\_header.html](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-legacy-files/o/assets%2F-LfO_rsQzfnV957oTV_f%2F-MQCgK1kLFE_eXr_gvxr%2F-MQChD3LiyLVhAsrDXA-%2FUI_training_example_header.html?alt=media&token=a40dd035-0758-4dc0-bd37-c2059deb4780)

[Open](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-legacy-files/o/assets%2F-LfO_rsQzfnV957oTV_f%2F-MQCgK1kLFE_eXr_gvxr%2F-MQChD3LiyLVhAsrDXA-%2FUI_training_example_header.html?alt=media&token=a40dd035-0758-4dc0-bd37-c2059deb4780)

592B

[UI\_training\_example\_body.html](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-legacy-files/o/assets%2F-LfO_rsQzfnV957oTV_f%2F-MQCgK1kLFE_eXr_gvxr%2F-MQChGb0Y3EAPAuUfIkF%2FUI_training_example_body.html?alt=media&token=504b6241-8aff-4a57-881e-ff2489c51a6d)

[Open](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-legacy-files/o/assets%2F-LfO_rsQzfnV957oTV_f%2F-MQCgK1kLFE_eXr_gvxr%2F-MQChGb0Y3EAPAuUfIkF%2FUI_training_example_body.html?alt=media&token=504b6241-8aff-4a57-881e-ff2489c51a6d)
