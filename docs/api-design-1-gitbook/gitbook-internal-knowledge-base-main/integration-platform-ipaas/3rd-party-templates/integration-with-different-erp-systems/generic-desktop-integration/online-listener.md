# Online Listener

## Multiple subcompanies (from single Database)

There are 2 ways to do multiple subcompanies with one listener

1. Providing different accounts for different subcompanies.  You can use one signalr\_client\_id for different accounts. In this case Listener will work with different accounts queries separately and all the necessary setting will be in each account in general settings.
2. Creating different tasks with different companies settings inside each task - it\`s the second way to do multiple subcompanies.
