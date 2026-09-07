---
description: >-
  Deep links are links that take users directly to a specific location within an
  app, rather than simply opening the app to the homepage or launching screen.
---

# Deep Links

This allows app managers to provide a more seamless experience for users by taking them directly to the content or action they're looking for within an app, rather than making them navigate to it from the app's main screen.

### Supported Deep Links

<details>

<summary>Home Page </summary>

```
https://pepperi_domain.com/homepage  ✔️
```

</details>

<details>

<summary>Account Dashboard </summary>

```
https://pepperi_domain.com/accounts/home_page/:id
https://pepperi_domain.com/accounts/dashboard/:id ✔️ - deprecated

path params:
id - the account UUID
```

</details>

<details>

<summary>Generic Lists </summary>

```
https://pepperi_domain.com/list/all_activities
https://pepperi_domain.com/list/all_activities?listID=GL_92211104-a78d-4265-80ad-8359b354d958
https://pepperi_domain.com/list/accounts
https://pepperi_domain.com/list/users
https://pepperi_domain.com/list/contacts
https://pepperi_domain.com/list/items?listID=GL_4de2522e-7f90-4304-82f2-3a0e5dcdccc6
```

</details>

<details>

<summary>Order Center</summary>

```javascript
'https://pepperi_domain.com/transactions/scope_items/:id', ✔️ // order center - already implemented
'https://pepperi_domain.com/transactions/item_details/:id/:parentId', 
'https://pepperi_domain.com/transactions/matrix/:id/:parentId', // todo: need to define this

```

</details>

<details>

<summary>Cart</summary>

```javascript
'https://pepperi_domain.com/transactions/cart/:id', ✔️ // implemented
```

</details>

<details>

<summary>Forms</summary>

```javascript
'https://pepperi_domain.com/transactions/details/:id', 
'https://pepperi_domain.com/accounts/details/:id',  // account info
'https://pepperi_domain.com/activities/details/:id', ✔️// general activity - implemented
```

</details>
