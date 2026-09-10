---
title: "D1 Data Viewer UI Task"
order: 98
---
# D1 Data Viewer UI Task

The D1 Data Viewer is a generic UI task used for testing D1 API requests directly from iPaaS.

The task works similarly to Postman and can be used for:

-   testing D1 queries
-   debugging API responses
-   checking authentication
-   exploring D1 tables
-   validating request bodies before building final dataflows

The task automatically loads the D1 access token and executes requests through internal iPaaS tasks.

### Task Name

```
D1 Data Viewer
```

### Required Related Tasks

The UI task depends on the following tasks:

```
D1 - Get Token 🔒
```

and:

```
D1 get data
```

Optionally:

```
D1 post data
```

### Required General Settings

| Setting | Description |
| --- | --- |
| generic\_param\_1 | D1 company code |
| generic\_param\_2 | D1 API base URL |
| generic\_param\_3 | D1 client application ID |

### Required Connection Parameters

| Parameter | Description |
| --- | --- |
| connection\_param\_1 | D1 username |
| connection\_param\_2 | D1 password |

### Default URL

```
!%generic_param_2%!distone/rest/service/data/read
```

### Default Body

```
query=FOR EACH customer NO-LOCK WHERE company_cu='!%generic_param_1%!'&take=1
```

### How the UI Task Works

#### Step 1 — Load Token

The UI task executes:

```
D1 - Get Token 🔒
```

The access token is extracted from the response.

#### Step 2 — Build Request

The user enters:

-   request type
-   URL
-   request body

#### Step 3 — Execute Request

Depending on the selected request type, the UI task executes either:

```
D1 get data
```

or:

```
D1 post data
```

#### Step 4 — Display Response

The response is formatted as JSON and displayed directly in the UI.

### Supported Usage Examples

#### Read Data

```
query=FOR EACH customer NO-LOCK WHERE company_cu='!%generic_param_1%!'&take=1
```

#### Read Items

```
query=FOR EACH item NO-LOCK WHERE company_it='!%generic_param_1%!'&take=10
```

#### Read Warehouses

```
query=FOR EACH warehouse NO-LOCK WHERE company_it='!%generic_param_1%!'
```

#### Limit Returned Columns

```
query=FOR EACH item NO-LOCK WHERE company_it='!%generic_param_1%!'&columns=item,descr,it_group&take=10
```

### Notes

This UI task is recommended for all D1 implementations because it simplifies:

-   API testing
-   troubleshooting
-   query development
-   validating D1 permissions
-   checking table structures

The task can be copied together with the related D1 tasks into another environment.
