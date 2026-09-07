# Users, Employees, Buyers

There is a special relations between these three resources that one needs to understand before start working with them.\
Another important point is that data source of each resource. These resources use both 'papi' and 'data' and we will explain the usage later on.<br>

### Employees

Using 'papi' as its data source, it means that it is managed by Pepperi legacy api. In other words it is just a proxy to papi. \
It will contain all the distributer's employees, both employee type 'rep' and employee type 'admin'.

### Buyers

Using 'data' as its data source, It means that this resource is managed only by ADAL. So if you create a buyer there will be no reflection of it in Pepperi legacy api.\
Buyer can be activated and as a result a user of type 'buyer' will be created. And the buyer will point to this user.\
In other words when a buyer is activated it will have a reference to the users resource which is actually a duplication of the buyer.

### Users

Using 'data' as its data source, It means that this resource is managed only by ADAL, but there is no POST only GET. The way to add users is by adding employees or activate a buyer.\
Users will contain all of the emplyees and all of the activated buyers.
