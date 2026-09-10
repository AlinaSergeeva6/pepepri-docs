---
title: "Updating UDT with JSON Values"
description: "This guide details the Dataflow task Updating UDT with JSON Values focusing on how to update a User-Defined Table (UDT) with JSON-format"
order: 27
---
# Updating UDT with JSON Values

*This guide details the Dataflow task Updating UDT with JSON Values focusing on how to update a User-Defined Table (UDT) with JSON-format*

### Overview

This article explains how to configure and use the Dataflow task *Updating UDT with JSON Values* to update a UDT in Pepperi. The task processes input data, maps it to a UDT, and converts specified values into JSON format, including additional fields beyond the main and secondary keys.

---

### Main Settings

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/2021-02-15_13h27_33.png)

Main settings

Configure the following settings to set up the Dataflow task:

-   **key\_val\_main\_key\_col:** The name of the column containing the MainKey values for the UDT. This identifies the primary key for each record.
-   **key\_val\_secondary\_key\_col:** The name of the column containing the SecondaryKey values for the UDT. This identifies the secondary key for each record, providing an additional layer of uniqueness.
-   **key\_val\_table\_id:** The identifier of the target UDT table to be updated.
-   **write\_key\_val\_file:** A boolean setting that, when enabled, logs the resulting JSON file for review and debugging purposes.
-   **key\_val\_is\_json\_object:** A boolean setting that, when enabled, converts the specified values into a JSON object format before updating the UDT.

#### Additional Field Handling

-   Fields in the input data that are not specified as MainKey or SecondaryKey (i.e., not mapped to key\_val\_main\_key\_col or key\_val\_secondary\_key\_col) will be automatically included in the JSON file as values. These fields are serialized into the JSON structure alongside the main and secondary keys, ensuring all relevant data is captured in the UDT update.

---

### Result

Upon successful execution, the Dataflow task:

-   Updates the specified UDT table (key\_val\_table\_id) with the provided MainKey and SecondaryKey values.
-   Converts the values into a JSON object (if key\_val\_is\_json\_object is enabled).
-   Includes all additional fields (beyond MainKey and SecondaryKey) as part of the JSON values in the UDT.
-   Logs the resulting JSON file (if write\_key\_val\_file is enabled) for verification.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/11-8.png)
