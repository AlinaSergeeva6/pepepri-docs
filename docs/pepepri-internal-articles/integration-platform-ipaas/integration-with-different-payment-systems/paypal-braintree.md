---
title: "PayPal Braintree"
order: 198
---
# PayPal Braintree

## PayPal Braintree Integration

### Overview

**Braintree** (now **PayPal Braintree**) is a full-stack payment processing platform that enables businesses to accept online and in-app payments from customers using various payment methods:

-   Credit / debit cards
-   PayPal
-   Venmo
-   Apple Pay
-   Google Pay

It provides robust security features, fraud protection tools, and support for seamless global transactions.

### Prerequisites

| Field | Description | Required? | Notes |
| --- | --- | --- | --- |
| TOKENIZATION\_KEY | Client token (tokenization key) | **Yes** | Needed for both Sandbox and Production |
| PUBLIC\_KEY | Public configuration key | **Yes** | — |
| PRIVATE\_KEY | Private configuration key | **Yes** | Keep secret! |
| BRAINTREE\_VERSION | Braintree API version (e.g. "2024-07-01") | Recommended | Better to specify explicitly |
| MERCHANT\_ID | Merchant account ID | Not required (yet) | May be needed in future updates |

### Useful Data

**GraphQL Endpoints:**

-   **Sandbox**: `https://payments.sandbox.braintree-api.com/graphql`
-   **Production**: `https://payments.braintree-api.com/graphql`

**Postman Collection:**

124KB

[Braintree-GraphQL.postman\_collection.json](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2FteTCKnTCR0HOD9uHK5Vd%2FBraintree-GraphQL.postman_collection.json?alt=media&token=a6b19985-7a2e-435a-b26d-f23c1f29504e)

[Open](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2FteTCKnTCR0HOD9uHK5Vd%2FBraintree-GraphQL.postman_collection.json?alt=media&token=a6b19985-7a2e-435a-b26d-f23c1f29504e)

### Before Usage

Replace placeholder values with real credentials provided by the client:

```
const BRAINTREE_CREDENTIALS = {
  TOKENIZATION_KEY:    "BRAINTREE_TOKENIZATION_KEY",     // Braintree sandbox or production tokenization key
  GRAPHQL_ENDPOINT:    "https://payments.braintree-api.com/graphql",
  // Use "https://payments.sandbox.braintree-api.com/graphql" for Sandbox

  BRAINTREE_VERSION:   "2024-07-01",                     // Braintree API version
  PUBLIC_KEY:          "BRAINTREE_PUBLIC_KEY",
  PRIVATE_KEY:         "BRAINTREE_PRIVATE_KEY",
};
```

### Fields to Store in Transaction

Create fields in transaction to store following records:

-   Payment ID
-   Payment Card Type
-   Payment Last Four Digits
-   Payment Card Expiration Date
-   Payment Card Holder Name

Update configuration in the global object with created fields name:

```
const global = {
  // ... other settings ...

  transactionTotalFieldToSearch: "TRANSACTION_TOTAL_FIELD", // Field name for transaction total in Pepperi API

  fieldsToUpdate: {
    paymentId:                "PAYMENT_ID_FIELD",
    paymentDigits:            "PAYMENT_LAST_FOUR_DIGITS_FIELD",
    paymentCardType:          "PAYMENT_CARD_TYPE_FIELD",
    paymentCardExpirationDate:"PAYMENT_CARD_EXPIRATION_FIELD",
    paymentCardHolderName:    "PAYMENT_CARDHOLDER_NAME",
  },
};
```

---

### How It Works

**UI Task flow:**

1.  Get transaction context
2.  Retrieve total amount from the configured total field
3.  Initialize Braintree UI (Drop-in UI / Hosted Fields, etc.)
4.  On successful payment, the following data is returned:
    -   Payment ID
    -   Payment Card Type
    -   Payment Last Four Digits
    -   Payment Card Expiration Date
    -   Payment Card Holder Name

5.  Update the corresponding fields in the transaction record

---

### Testing

The sandbox environment only accepts specific test credit card numbers.

#### Base Test

-   **Card**: 4111 1111 1111 1111
-   **Expiration Date**: any future date
-   **CVV**: any value

**Behavior based on amount:**

-   Total &lt; 2000 -> successful payment
-   Total > 2000 -> failed payment

#### Test with Postal Code AVS Rule

-   **For AVS match**: Use a valid US postal code (e.g. 90210) -> expect AVS result 'A' or 'Y'
-   **For AVS mismatch**: Use an invalid postal code -> expect AVS result 'N'

More test cards and scenarios: [https://developer.paypal.com/braintree/docs/guides/credit-cards/testing-go-live](https://developer.paypal.com/braintree/docs/guides/credit-cards/testing-go-live?referrer=grok.com)

---

### UI Task Template

A ready-made UI task is available on the **Services Demo Environment**:

**Name**: Braintree Payment Template

**Recommended steps:**

1.  Copy the task to your environment
2.  Update the necessary fields in the configuration
3.  Add the task to the appropriate workflow

---

### Usage Example

You can test the integration on the following environment:

**Murad US (7921) (30015952)** -> Employee Order Sandbox transaction

---

### Additional implementation

#### Current Implementation – Authorize Only.

The current flow performs **authorization** only (holds funds, but does not capture them yet). Transaction status after successful authorization is typically **AUTHORIZED**.

If you need to immediately capture funds (change status to **SUBMITTED\_FOR\_SETTLEMENT**), replace the authorization mutation with the **chargePaymentMethod** mutation.

```
// Define GraphQL mutation to charge the payment method
const query = `
  mutation Charge($input: ChargePaymentMethodInput!) {
    chargePaymentMethod(input: $input) {
      transaction {
        id
        status
        amount {
          value
          currencyCode
        }
        paymentMethodSnapshot {
          ... on CreditCardDetails {
            brandCode
            last4
            expirationMonth
            expirationYear
            cardholderName
          }
        }
      }
    }
  }
`;
```

#### Specifying merchantAccountId

**When to use this feature:**

-   You have multiple merchant accounts in your Braintree gateway (multi-currency, multi-region, separate businesses, etc.)
-   The default merchant account does not match the desired currency or processing rules
-   You want to explicitly route the transaction to a specific merchant account (e.g. USD-only account for US customers)

**Key rule:**

-   Use the **merchant account name** (string identifier), **not** the numeric merchant ID Examples: muradllc\_B2B, muradllc\_USD, eur\_store, gbp\_merchant
-   If merchantAccountId is **omitted** → Braintree automatically uses the **default merchant account** configured in your gateway.

**Implementation:**

Just include the merchantAccountId field inside the transaction object:

```
// Define variables for the GraphQL mutation
const variables = {
  input: {
    paymentMethodId: payload.nonce, // Use nonce from Drop-in
    transaction: {
      amount: global.totalAmountToPay, // Transaction amount in cents
      merchantAccountId: "YOUR_MERCHANT_ACCOUNT_ID", // Merchant Account
    },
  },
};
```
