---
title: "Export Data from NetSuite to Pepperi"
description: "using Saved searches and DataFlow tasks"
order: 164
---
# Export Data from NetSuite to Pepperi

*using Saved searches and DataFlow tasks*

Integrating with NetSuite using saved searches export is quite simple. When understanding the basics of NetSuite Saved searches and Pepperi Integration platform Data-Flow tasks you can easily create updates of information from NetSuite to Pepperi.

!!!info
In order to use this functionality, make sure the first steps were completed - both the script should be installed (as mentioned here - [First steps in Pepperi-NetSuite Integration](https://app.gitbook.com/@pepperi/s/internal-knowledge-base/~/edit/drafts/-LjQ6tuEf1ZTly3a1baQ/netsuite-integration/first-steps-in-pepperi-netsuite-integration) ) and the Authentication should be set up, as mentioned here - [NetSuite Authentication](https://app.gitbook.com/@pepperi/s/internal-knowledge-base/~/edit/drafts/-LjQ6tuEf1ZTly3a1baQ/netsuite-integration/netsuite-authentication) )
!!!

Once done, the DataFlow task created will export the saved search required from NetSuite and will upload it to Pepperi.

**NetSuite Saved Searches - What are Saved Searches?**

Saved searches are reusable search definitions that can have many advanced filters and display options for the results. Keep in mind that each time a saved search is run, the search will query the database and return current information. If data is being changed that might affect your search results, you will notice that if you refresh the search results, updated information will be displayed.

![](/static/NetSuite_Saved_Customer_Search_2.png)

NetSuite\_Saved\_Customer\_Search\_2

#### How can I use Saved Searches more effectively?

There are several ways you can use saved searches more effectively by optimizing the way you create them. Understanding the capabilities of saved searches and leveraging their powerful functionality.

Optimize Your Saved Searches

-   **Use Largest Filters First** – In order to optimize the performance of your saved search and prevent timeouts, you should list filters that narrow down your search results the most at the top of your filters or criteria. For example, if you’re performing a transaction search for invoices created in 2017 by John Doe, you’ll probably want to list the ***Created By = John Doe*** filter first unless John Doe is responsible for creating all invoices, at which point you’ll want to list ***Transaction Type = Invoice*** as your first criteria. This will narrow down your search results the most right off the bat so the remaining filters don’t have as many records to parse through.
-   **Avoid Using “Contains” Condition** – This is one of the most resource-expensive search mechanisms. Instead, use **Starts With**or **Has Keywords** to further refine the data the search is parsing through.
-   **Remove Extra Columns of Data** – The less information you are displaying in your results, the less time it will take NetSuite to load the results. If you don’t need the text-heavy memo field to be displayed in your results, remove that field from the results.

**Saved Searches options -**

**Summarize Results** – Within the Results tab on a saved search, you can specify a summary type for each column of data which allows you to define how to roll up, or group, data. When you run a summarized saved search, you have the ability to drill down into each group of results. The following summary types are available: Group, Count, Sum, Minimum, Maximum and Average

![](/static/Saved_Search_Functionality-Summarize_Results.png)

Saved\_Search\_Functionality-Summarize\_Results

**Formulas in Searches** – SQL functions and mathematical operators can be used to translate data formats (turn dates into weekdays for easy viewing or numbers for calculations), compare values in different fields across related records, or perform on-the-fly calculations at the time the search is performed

![](/static/Saved_Search_Functionality-Formulas_in_Searches.png)

Saved\_Search\_Functionality-Formulas\_in\_Searches

!!!info
To match the date exported in a saved search to Pepperi in a data upload, use a Formula (Text) and add the date field you want. This will use a system date format - same as required by Pepperi's API.
!!!

After having the saved search you want to work with, copy it's ID. Usually the ID can be found in the settings page in "Edit" mode -

![](/static/image-413.png)

If can't be found there, the ID can be found in the saved searches list, under Lists > Search > Saved Searches

![](/static/image-414.png)

Once you have the saved search ID, go to Pepperi's Integration Platform, open a new data flow task under the NetSuite application with the relevant target object. Source Object of NetSuite can always be "NetSuite Export Special Price List"

![](/static/image-415.png)

In the task settings, add the settings of -

|  |  |
| --- | --- |
| saved\_search\_id | &lt;Saved Search ID copied form NetSuite> |

That's it! you can run the data flow task and it will export the saved search form NetSuite and will upload it to Pepperi.
