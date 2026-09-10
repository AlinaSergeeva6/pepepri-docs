---
title: "Loop Over Table"
description: "All examples of tasks are on the Integration Examples (6685) integration account"
order: 235
---
# Loop Over Table

*All examples of tasks are on the Integration Examples (6685) integration account*

“Loop over table” iterates over the rows of (transactions) CSV file. For each row it will file http request replacing request place holders with values of the current row.

Let’s say that we want to get CSV file with all the lines of all the transactions (and some details about the transaction).

**Steps:**

· Task 1: to get all the transactions from the erp; · Task 2: to get the transaction lines of a specific transaction; · Task 2: url will contain a place holder for the transaction id; · Task 2: will loop over table task1 CSV.

**Task 1**

**Step 1.** Create a data flow task:

Name: Loop Over Table Application: Generic http connector Source object: Generic Http Exporter Target object: Store for later use

**Step 2.** Set http request:

*Method*: Get *Url*: !%new\_api\_base\_uri%!transactions *Header*: Authorization: {#client\_basic\_auth#} *X-Pepperi-ConsumerKey:* {#consumer\_key#}

**Step 3.** Run the task:

Logs – Final generated file (flat CSV)

Note: you can use mapping to choose which columns you want and their names.

**Task 2**

**Step 1.** Create a data flow task:

Name: Loop Over Table - 1 Application: Generic http connector Source object: Generic Http Exporter Target object: Store for later use

**Step 2.** Set task setting:

loop\_over\_table Loop Over Table

**Step 3.** Set http request:

Method: Get Url: !%new\_api\_base\_uri%!transaction\_lines?where=Transaction.InternalID=$#InternalID#$ Header: Authorization: {#client\_basic\_auth#} X-Pepperi-ConsumerKey: {#consumer\_key#}

Note: the value of InternalID place holder will be taken from the loop\_over\_table csv. So in our case, it is the InternalID of transaction.

**Step 4.** Run the task:

Logs:

-   logs that it created http request per transaction
-   the output file that we get the lines of all the transactions
-   each row in the output file contains the "transaction" fields and the "transaction line" fields
