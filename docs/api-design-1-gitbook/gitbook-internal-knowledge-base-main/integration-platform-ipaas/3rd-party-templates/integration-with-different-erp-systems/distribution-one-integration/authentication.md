# Authentication

D1 authentication is token-based.

The authentication task sends the D1 client ID, company code, username, and password to D1 and receives an access token.

The access token is then used in the `Authorization` header of other D1 API requests.

### Task Name

```
D1 - Get Token 🔒
```

### HTTP Configuration

#### Method

```
POST
```

#### URL

```
!%generic_param_2%!distone/rest/service/authorize/grant
```

#### Headers

```
Content-Type: application/x-www-form-urlencoded
```

#### Body

```
client=!%generic_param_3%!&company=!%generic_param_1%!&username=!%connection_param_1%!&password=!%connection_param_2%!
```

### Recommended Settings

| Field Name           | Value         | Description                     |
| -------------------- | ------------- | ------------------------------- |
| generic\_param\_1    | Company Code  | D1 company code                 |
| generic\_param\_2    | Base URL      | D1 API base URL                 |
| generic\_param\_3    | Client App ID | D1 client application ID        |
| connection\_param\_1 | Username      | D1 username                     |
| connection\_param\_2 | Password      | D1 password                     |
| is\_url\_encoded     | false         | Request body is not URL encoded |

### Expected Response

The response should include:

* `grant_token`
* `access_token`
* `access_term`

Example response:

```
{  "grant_token": "example_grant_token",  "access_token": "example_access_token",  "access_term": 60}
```

### Notes

The current template uses the returned `access_token` for all additional D1 API requests.

The access token should be passed in the `Authorization` header:

```
Authorization:$#access_token#$
```

If token expiration becomes an issue, an additional token refresh flow can be implemented using the D1 access endpoint.

### D1 Authorization Endpoint

```
/distone/rest/service/authorize/access
```

This endpoint accepts:

* client
* grant\_token
* optional company

and returns a new access token.
