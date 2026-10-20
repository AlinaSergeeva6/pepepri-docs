The Journey Tracker Add-on logs user interactions and workflow execution paths across the Pepperi platform. By capturing key events - such as page button clicks, navigation flows, and custom transition alerts - into PFS log files, it provides the tracking data needed for audit trails, behavior analysis, and integration debugging.

## Install the Journey Tracker Add-on

1. Obtain a valid Pepperi JWT token from Session Storage.
2. Open the Postman application.
3. Use
   `POST https://papi.pepperi.com/v1.0/addons/installed_addons/41011fbf-debf-40d8-8990-767738b8af03/install`
   and
   `Authorization: Bearer <JWT_TOKEN>`
   to install the add-on.
4. After installation, verify that the add-on is available in Pepperi under
   **Settings** --> **Configurations**
   If the **Journey Tracker** configuration is visible, the add-on was installed successfully.

## Configure Tracked Events

After the add-on is installed, open the **Journey Tracker** configuration.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/Pasted%20image%2020261019131015.png)

1. Click **Add** to create a new tracked event.
2. Select the event source: **Activity**, **Transaction**, **Page**, or **Application Header**.

   ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/Pasted%20image%2020261019132115.png)

3. Fill in the event settings:
   - **Display Event Name** (required). Select an event from the predefined list.
   - **Description** (optional). Add a short description of the tracked event.
   - **Alias** (required). This value is used as the `Label` in Journey Tracker log records.
   - **Filter** (optional). Defines which specific event instance should be tracked. Filter settings depend on the selected event type

4. After you select a **Display Event Name**, it cannot be changed or selected again.  
   To use a different event, click **Cancel** and start creating a new tracked event.

Custom workflow events can also be created for **Transactions** and **Activities**.
See the **Create Custom Workflow Events** section.

## Get Journey Tracker Files

Journey Tracker logs are stored in Pepperi PFS as `text/plain` files.

1. Obtain a valid Pepperi JWT token from Session Storage.
2. Open the Postman application.
3. Use
   `POST https://papi.pepperi.com/V1.0/addons/api/41011fbf-debf-40d8-8990-767738b8af03/api/get_journey_tracker_files_from_pfs`
   and
   `Authorization: Bearer <JWT_TOKEN>`
   to retrieve Journey Tracker files.

4. Add the required search parameters to the request body.

| Field          | Type    | Description                                              |
| -------------- | ------- | -------------------------------------------------------- |
| `Where`        | String  | Defines which files to return.                           |
| `OrderBy`      | String  | Defines the result sorting order.                        |
| `PageSize`     | Integer | Defines the maximum number of files returned.            |
| `IncludeCount` | Boolean | Adds the total number of matching files to the response. |

A successful request returns `200 OK` and an `Objects` array. Each object represents one Journey Tracker log file.

### Response Example

```json
{
  "Objects": [
    {
      "Key": "journey.062e940a-61fa-43f2-b4ac-f393221dfcd2.txt",
      "Name": "journey.062e940a-61fa-43f2-b4ac-f393221dfcd2.txt",
      "MIME": "text/plain",
      "FileSize": 3502,
      "CreationDateTime": "2026-10-19T14:38:01.282Z",
      "ModificationDateTime": "2026-10-19T14:58:21.976Z",
      "URL": "https://pfs.pepperi.com/.../journey.062e940a-61fa-43f2-b4ac-f393221dfcd2.txt",
      "UploadedBy": "ed5dc472-2b75-44d3-8cfd-1bbd74af3c69",
      "MetaData": {
        "Email": "user@example.com",
        "UUID": "ed5dc472-2b75-44d3-8cfd-1bbd74af3c69",
        "platformType": "iPad",
        "IsWebApp": false,
        "deviceName": "iPad",
        "systemName": "iPadOS",
        "systemVersion": "26.4",
        "softwareVersion": "17.31200480"
      }
    }
  ]
}
```

The response may contain multiple objects, with one object for each Journey Tracker log file.

Use the `URL` field from a returned object to download the log file from Pepperi PFS. The `MetaData` field contains the user, device, operating system, and app-version information related to that file.
[IPaaS Example](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=111061)

## Track a Page Block Button Click

Use the **Page Block Button Click** event to track a specific button on a specific Pepperi page.
To configure the event filter, you need the button **Action Key**.

1. In Pepperi, go to
   **Settings** --> **Pages** --> **Page Builder**.
2. Open the page that contains the button you want to track.
3. Start to edit this button.
4. In the left panel, select the required **Button Block**.
5. Open the **Content** tab and select the required button.
6. Scroll to the **On click flow** section.
7. Copy the **Action Key** value.

 ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/Pasted%20image%2020261019144815.png)


Use this value in the Journey Tracker event filter to track clicks on this specific button.

## Create a Custom Workflow Event

Custom workflow events are triggered when a workflow transition is executed. Use them to track a specific workflow step or branch.

1. Open the required **Transaction** or **Activity** settings.
2. Open the workflow and select the transition you want to track.
3. Click the edit icon for the transition.

   Example: **In Creation** --> **Submitted**

   ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/Pasted%20image%2020261019165426.png)


4. Add an **Alert on condition** workflow action.

   ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/Pasted%20image%2020261019165630.png)


5. Click **<a>Add...</a>** and create a new field.

   ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/Pasted%20image%2020261019165833.png)



6. Enter a field name that starts with - 'EmitEvent'. Save the alert without adding a message.

> [!Important]  
> The field name must start with `EmitEvent`. Otherwise, the Journey Tracker add-on will not recognize the custom workflow event.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/Pasted%20image%2020261019165921.png)

7. If the transition contains multiple actions, set the required execution order for the **Alert on condition** action. Save the workflow.

   ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/Pasted%20image%2020261019170645.png)

8. Go to
   **Settings** --> **Configurations** --> **Journey Tracker**.

9. Open the menu next to **<span style="color: green">Add +</span>** and select **Add workflow event**.
   ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/Pasted%20image%2020261019171117.png)

10. Enter the details that match the workflow event you created, then save the configuration.

  ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/Pasted%20image%2020261019171254.png)

11. Add the new custom workflow event to the **Tracked Events** list.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/Screenshot%202026-10-19%20at%2017.16.01.png)

> [!NOTE]
> You can create custom workflow events for **Transactions** and **Activities**. These events can also be added to **Programs** workflows.

## Debug Journey Tracker Events

### Use the Script Debug Tool

> [!INFO]
> The Pepperi Script Debug Tool is available only on macOS.

1. Start the debugger in VS Code.
2. Perform the action that should trigger the Journey Tracker event.
3. Open the **Debug Console** in VS Code.
4. Search for `Journey record written` to verify that the event was created.

Example:

```log
Journey record written: {
  "Label": "Page block button click",
  "Data": {
    "PageKey": "ef6e1a10-1002-4bb6-9221-7a83c8114f46",
    "BlockKey": "dc4c685b-6301-bfb3-e779-e3d1671777f4",
    "ButtonKey": "button_1792163423724_0"
  },
  "CreationDateTime": "2026-10-19T11:30:41.774Z",
  "Key": "e5dad95a-b1ae-42d4-9549-33507e0b0c6d"
}
```

More About Pepperi Script Debug Tool

### Use AWS CloudWatch Logs

If you have access to AWS CloudWatch Logs, use the [AWS Journey Query](https://us-west-2.console.aws.amazon.com/cloudwatch/home?region=us-west-2) to search Journey Tracker logs for a specific user.

1. Open the query in AWS CloudWatch Logs.
2. Update the `UserID` filter with the required user ID.
3. Run the query.
4. Review records containing `Journey` in the message to verify that the event was processed.
