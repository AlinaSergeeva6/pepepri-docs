---
title: "Send Data from Pepperi to D1"
order: 95
---
# Send Data from Pepperi to D1

In the **Services Demo Environment**, there is a configured webhook:

`D1 - Import Sales Order`

This webhook is used as an example of sending Sales Order data from Pepperi to D1.

### Purpose

The webhook sends a Sales Order to D1 using a **POST** request.

Endpoint:

```
D1_URL/distone/rest/service/order/create
```

The request body is sent in **JSON** format.

### Example JSON Body

```
{
	"head": {
		"customer": "$#AccountExternalID#$",
		"rec_type": "O",
		"ord_class": "",
		"warehouse": "$#TSAWarehouseID#$",
		"hold_code": "WEB",
		"stat": "HO",
		"ord_ext": "$#InternalID#$",
		"source_code": "WEB",
		"ship_id": "$#TSAShipToID#$",
		"order_by": "$#TSAOrderedBy#$"
	},
	"lines": [
			@@lines    {
			"reference": {$#auto_num#$},
			"item": "$#ItemExternalID#$",
			"um_o": "$#TSAumdisplay#$",
			"quantity": $#UnitsQuantity#$
							}
			@@lines
	],
	"notes": "$#Remark#$",
	"echo": true,
	"complete": true
}
```

### Main Fields Description

#### head

Contains the general Sales Order information.

| Field | Description |
| --- | --- |
| `customer` | Customer / Account External ID |
| `rec_type` | Record type. `O` is used for Sales Orders |
| `warehouse` | Warehouse ID |
| `hold_code` | Order hold code, for example `WEB` |
| `stat` | Order status, for example `HO` |
| `ord_ext` | Internal Pepperi Order ID |
| `source_code` | Order source, for example `WEB` |
| `ship_id` | Ship-To ID |
| `order_by` | User or contact who placed the order |

#### lines

Contains the list of order items.

| Field | Description |
| --- | --- |
| `reference` | Auto-generated line reference number |
| `item` | Item External ID |
| `um_o` | Unit of measure |
| `quantity` | Item quantity |

#### notes

Additional order remarks or comments.

#### echo

If set to `true`, D1 returns additional response details.

#### complete

If set to `true`, the order is submitted as completed and ready for processing.

### Authentication

A valid and active **auth token** is required for the request to be processed successfully.

Without a valid token, D1 will reject the request and return an authorization error.

### Important Notes

Before running the webhook, make sure to verify:

1.  Correct `D1_URL` value.
2.  Availability of a valid auth token.
3.  Proper mapping of Pepperi fields:
    -   `#AccountExternalID#`
    -   `#TSAWarehouseID#`
    -   `#InternalID#`
    -   `#TSAShipToID#`
    -   `#TSAOrderedBy#`
    -   `#ItemExternalID#`
    -   `#TSAumdisplay#`
    -   `#UnitsQuantity#`
    -   `#Remark#`

4.  The order contains item lines.
5.  Warehouse, customer, Ship-To, and Item External IDs exist and are valid in D1.
