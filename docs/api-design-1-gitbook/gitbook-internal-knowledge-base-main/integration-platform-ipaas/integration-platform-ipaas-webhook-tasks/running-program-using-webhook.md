# Running program using Webhook

\
For example, we need to create a program that will send invoices to the client every day that were generated for the whole day.

First you need to create a program in the transaction you need.

![](<../../.gitbook/assets/image (389).png>)

Next, you need to select an action - in our case, this is **Send Email:**

![](<../../.gitbook/assets/image (240).png>)

Now you see this form:

![](<../../.gitbook/assets/image (346).png>)

To - specify the email on which you will test

At the period of testing, both checkboxes should be disabled (otherwise all clients will receive your tests)

Subject – this is XSLT file for displaying the title of the letter

Message – this is XSLT file too. This file will display body of your letter

Attach File – here you need to add file which will be attached to letter.(In our case we want have invoices in the letter)

Next we create Dataflow task, which takes all invoices from previously day.

Mapping : InternalID, ExternalID

HTTP:

&#x20;Method - GET,

Authentication Type – Basic&#x20;

Header : Authorization: {#client\_basic\_auth#}

X-Pepperi-ConsumerKey: {#consumer\_key#}

Url : https://api.pepperi.com/v1.0/transactions?page\_size=1\&where=CreationDateTime>'{#getdate(-1, "yyyy-MM-ddThh:mm:ssZ", day)#}' AND Type='Invoices'\&fields=InternalID,ExternalID

Then we created the Webhook task and in tab HTTP we have in Header

Authorization: {#client\_basic\_auth#}

X-Pepperi-ConsumerKey: {#consumer\_key#}

Content-Length: 0

And in URL:  [https://api.pepperi.com/v1.0/transactions/264979/{#pepperi\_object\_id#}/programs/SendEmail/run](https://api.pepperi.com/v1.0/transactions/206935/%7B#pepperi_object_id#}/programs/SendEmail/run)

Where  **264979**– transaction ActivityTypeDefinitionID, You can find this information by this way :

Go to Dataflow task, open Settings àCreate Pepperi User Defined Field à Chose dataType (now it is Transaction and find your Transaction) :

![](<../../.gitbook/assets/image (479).png>)

And SendEmail it’s name of your program in back Office.

Webhook task creation:

![](<../../.gitbook/assets/image (388).png>)

Then we created the second Dataflow task which will take the loop over table of first Dataflow task .

Mapping : InternalID

Settings:

loop\_over table (in Value set name of fists Dataflow task)

loop\_over\_table\_distinct (Set the value that loop over all rows) – in our case it’s InternalID

remove – 1 (Removes all of the fields, which were not specified in the Mapping Tab)

HTTP:

Method is POST

Header: Content-Type: application/json

Body :

Check json and :

```
{
 "Data": {
  "ID": $#InternalID#$
 }
}
```

URL: take from Webhook task by this way :

Your Webhook à Details à copy Commit Task URL ant put it to HTTP

![](<../../.gitbook/assets/image (447).png>)

Last step is create a Scheduled job:

![](<../../.gitbook/assets/image (391).png>)

Then go to Details and Run Job.

After it you can get a test letter on you E-mail
