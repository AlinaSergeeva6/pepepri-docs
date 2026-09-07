# Export Data from D1 to Pepperi

D1 exports are based on the Dynamic Query API.

The same export dataflow can be reused for different D1 tables by changing only the query body.

The current template includes examples for:

* Customers
* Items
* Prices
* Warehouses

### Generic Export Dataflow

#### Method

```
POST
```

#### URL

```
!%generic_param_2%!distone/rest/service/data/read
```

#### Headers

```
Authorization:$#access_token#
Content-Type:application/x-www-form-urlencoded; charset=UTF-8
```

### Generic Query Structure

```
query=FOR EACH <table_name> NO-LOCK WHERE <company_field>='!%generic_param_1%!'
```

### Pagination

For large tables, use pagination:

```
&take=1000&skip={#page_num#}
```

Full example:

```
query=FOR EACH customer NO-LOCK WHERE company_cu='!%generic_param_1%!'&take=1000&skip={#page_num#}
```

### Selecting Specific Columns

You can reduce the response size by limiting returned fields with `columns`.

Example:

```
query=FOR EACH item NO-LOCK WHERE company_it='!%generic_param_1%!'&columns=descr,it_group,item&take=1000&skip={#page_num#}
```

### Recommended Settings

| Setting           | Value             |
| ----------------- | ----------------- |
| page\_num\_start  | 0                 |
| loop\_over\_table | D1 - Get Token 🔒 |
| page\_interval    | 1000              |
| is\_new\_api      | true              |
| is\_url\_encoded  | false             |

### Example Tables

| Data       | Table     | Company Field |
| ---------- | --------- | ------------- |
| Customers  | customer  | company\_cu   |
| Items      | item      | company\_it   |
| Prices     | price     | company\_it   |
| Warehouses | warehouse | company\_it   |

### Example Queries

#### Customers

```
query=FOR EACH customer NO-LOCK WHERE company_cu='!%generic_param_1%!'&take=1000&skip={#page_num#}
```

#### Items

```
query=FOR EACH item NO-LOCK WHERE company_it='!%generic_param_1%!'&columns=descr,it_group,item&take=1000&skip={#page_num#}
```

#### Prices

```
query=FOR EACH price NO-LOCK WHERE company_it='!%generic_param_1%!'&take=1000&skip={#page_num#}
```

#### Warehouses

```
query=FOR EACH warehouse NO-LOCK WHERE company_it='!%generic_param_1%!'&take=1000&skip={#page_num#}
```

### Notes

The Dynamic Query API supports:

* read
* create
* update
* delete

The current template uses the `read` endpoint only.

The D1 query syntax is based on ABL queries.

Example:

```
FOR EACH customer WHERE customer.active = YES
```

For better performance:

* limit returned columns when possible
* always use pagination for large tables
* avoid exporting unnecessary fields
