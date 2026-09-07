# Required Credentials and General Settings

Before configuring the D1 integration tasks, define the required values in iPaaS.

### General Settings

| Setting           | Description              | Example                |
| ----------------- | ------------------------ | ---------------------- |
| generic\_param\_1 | D1 company code          | `01`                   |
| generic\_param\_2 | D1 API base URL          | `https://example.com/` |
| generic\_param\_3 | D1 client application ID | `ipaas`                |

### Connection Parameters

| Parameter            | Description |
| -------------------- | ----------- |
| connection\_param\_1 | D1 username |
| connection\_param\_2 | D1 password |

### Notes

`generic_param_3` is used for the D1 client application ID.

Keeping the client application ID dynamic is recommended because it makes the template easier to copy between environments, for example sandbox and production.

### Example Usage in Tasks

```
Company code:
!%generic_param_1%!

Base URL:
!%generic_param_2%!

Client application ID:
!%generic_param_3%!

Username:
!%connection_param_1%!

Password:
!%connection_param_2%!
```
