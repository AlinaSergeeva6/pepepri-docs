---
title: "Credit Guard (creditguard.co.il)"
description: "Pepperi Integration Guide"
order: 189
---
# Credit Guard (creditguard.co.il)

*Pepperi Integration Guide*

**REMARK** CreditGuard is Israeli payment system frequently used as main payment system for such clients as Hacarem (Company ID 30012895) and WBAIS (Company ID 30012679).

It has its own proprietary and easy to use redirect api. For additional information please refer to the attached CG-Gateway-Redirect-Api.pdf

### UI Tasks description.

There are 4 key UI tasks which drive the payment routine

![](/static/image-357.png)

|  |  |
| --- | --- |
| UI task | Description |
| CreditGuard get page url | Contains the call to receive payment page iFrame |
| CreditGuard Payment Page | Main UI task. Displays payment iFrame and performs the logic. |
| DeclinePage | UI which called when payment failed. |
| ApprovePage | UI which called when payment succeeded. |

### CreditGuard Payment Page.

It is the UI task which you should call in order to launch GreditGuard payment procedure.

### Logic and code review.

As always you need to call the UI task using custom form in your transaction/activity workflow. Be aware that Credit Guard iframe look goofy and in order to show it as pretty as possible and maintain good responsiveness you need to add this to your custom form

```
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style>
    * {
    margin: 0;
    padding: 0;
  }
    </style>
```

Before all scripts attached.

![](/static/image-358.png)

Ui\_page\_body setting of the UI task contains the view configuration and styling. Nothing special.

![](/static/image-359.png)

Ui\_page\_head includes all the logic.

![](/static/image-360.png)

**Actions: 1.** Receive the context to get the current uuid of the routine.

**2.** Perform the transaction search to receive the necessary data. The Most important here are TSACreditGuardID and TSAPaymentStatus they should be created in header fields of your transaction. TSACreditGuardID stores the payment ID. TSAPaymentStatus stores the payment status (unexpected).

**3.** After search it checks whether the transaction was paid or not by the value of TSACreditGuard id. It required to eliminate duplicated payments for same transaction.

**4.** If TSACreditGuardID is empty we may proceed. The function accumulates the data from transaction such as sum, email, Pepperi transaction id and calls the execution of **CreditGuard get page url** using get\_data function.

**5\.** If all data transferred in right format the CG Iframe appears.

![](/static/image-361.png)

### CreditGuard get page url.

Depending on the required by client payment options the url of this ui task may vary. Notice that here described **SANDBOX CREDITGUARD URL** and behavior. Please refer to attached pdf to find out the functionality and data type of each parameter.

**Sandbox URL:**

```
https://cguat2.creditguard.co.il/xpo/Relay?user=cgdemo&password=C!kd2nc3a&int_in=
<ashrait
  ><request
    ><version>2000</version><language>HEB</language><dateTime /><command
      >doDeal</command
    ><requestid /><doDeal
      ><terminalNumber>0882803015</terminalNumber><cardNo>CGMPI</cardNo
      ><successUrl>*~approvePage~*</successUrl
      ><errorUrl>*~declinePage~*</errorUrl><cancelUrl></cancelUrl
      ><total>*~total~*</total><transactionType>Debit</transactionType
      ><creditType>SpecialCredit</creditType><currency>ILS</currency
      ><transactionCode>Phone</transactionCode><validation>TxnSetup</validation
      ><numberOfPayments>10</numberOfPayments><user>*~user~*</user
      ><mid>11665</mid><uniqueid>*~transID~*</uniqueid
      ><mpiValidation>AutoComm</mpiValidation><description></description
      ><email>*~agent~*</email><customerData></customerData></doDeal></request
></ashrait>
```

**Prod URL:**

```
https://api.creditguard.co.il/merchants/xpo/Relay?user=RECEIVED_FROM_CUSTOMER&
password=RECEIVED_FROM_CUSTOMER&int_in=<ashrait
  ><request
    ><version>2000</version><language>HEB</language><dateTime /><command
      >doDeal</command
    ><requestid /><doDeal
      ><terminalNumber>PARAMETER VALUE RECEIVED FROM CUSTOMER</terminalNumber><cardNo>CGMPI</cardNo
      ><successUrl>*~approvePage~*</successUrl
      ><errorUrl>*~declinePage~*</errorUrl><cancelUrl></cancelUrl
      ><total>*~total~*</total><transactionType>Debit</transactionType
      ><creditType>SpecialCredit</creditType><currency>ILS</currency
      ><transactionCode>Phone</transactionCode><validation>TxnSetup</validation
      ><numberOfPayments>10</numberOfPayments><user>*~user~*</user
      ><mid>PARAMETER VALUE RECEIVED FROM CUSTOMER</mid><uniqueid>*~transID~*</uniqueid
      ><mpiValidation>AutoComm</mpiValidation><description></description
      ><email>*~agent~*</email><customerData></customerData></doDeal></request
></ashrait>
```

Such parameters for production as user, pass, terminalNumber, mid should be received from customer by you or your pm.

After the payment done the CG Iframe should call one of the tasks ApprovePage Or DeclinePage depending on the status of the payment. Both of them update your transaction with necessary information such as TSACreditGuardID value, TSAPaymentStatusValue. You may also receive additional information. By parsing the response from the iframe:

![](/static/image-362.png)

And put it in your tsa fields in transaction.

![](/static/image-363.png)

Keep in mind that you are working in iframe an if you want to use pepperi api you need to add **window.parent** to your function.

1MB

[CG-Gateway-Redirect-API.pdf](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-legacy-files/o/assets%2F-LfO_rsQzfnV957oTV_f%2F-Mj4V_1SSqLL1qDIGise%2F-Mj4VhLPirHiAxSXGCog%2FCG-Gateway-Redirect-API.pdf?alt=media&token=ff2c6814-0dfb-4ca1-a295-028cb34c61af)

PDF

[Open](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-legacy-files/o/assets%2F-LfO_rsQzfnV957oTV_f%2F-Mj4V_1SSqLL1qDIGise%2F-Mj4VhLPirHiAxSXGCog%2FCG-Gateway-Redirect-API.pdf?alt=media&token=ff2c6814-0dfb-4ca1-a295-028cb34c61af)

12KB

[Credit Guard - Test Cards.xlsx](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-legacy-files/o/assets%2F-LfO_rsQzfnV957oTV_f%2F-Mj4V_1SSqLL1qDIGise%2F-Mj4VlTFYjabBze-_gPt%2FCredit%20Guard%20-%20Test%20Cards.xlsx?alt=media&token=1dcf382c-5210-49f0-9bfd-aeb54a2e16f0)

[Open](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-legacy-files/o/assets%2F-LfO_rsQzfnV957oTV_f%2F-Mj4V_1SSqLL1qDIGise%2F-Mj4VlTFYjabBze-_gPt%2FCredit%20Guard%20-%20Test%20Cards.xlsx?alt=media&token=1dcf382c-5210-49f0-9bfd-aeb54a2e16f0)

**Possible Problems and How to Solve Them**

During the installation of CreditGuard, several types of errors may occur. These issues can generally be categorized into two groups: those caused by CreditGuard and those caused by Pepperi.

#### CreditGuard-Side Errors

While we cannot directly modify CreditGuard's operations, we can assist in identifying issues to help their team resolve problem. To provide accurate feedback, it's essential to capture all relevant information at the point where the error occurs. Here's how to do that:

1.  **Reproduce the error**: Run the transaction until the issue occurs.
2.  **Gather information**: Go to the browser's "Network" tab and capture screenshots of the request details. Make sure to include:
    -   The request and response data
    -   Headers
    -   Status codes and messages
    -   Any other relevant data

This data will be useful for CreditGuard's support team to diagnose and fix the problem.

![](/static/image-364.png)

#### Common CreditGuard Issue: Incorrect Request Method

One problem we encountered was the use of an incorrect request method. In this case, the **Request Method** was mistakenly set to `GET`, while Pepperi supported `POST` requests in that case.

#### Pepperi-Side Errors

When it comes to issues on the Pepperi side, particular attention should be given to **synchronization**, especially on mobile devices. Ensuring proper syncing is crucial for data processing in Pepperi.

![](/static/image-365.png)

![](/static/image-366.png)

![](/static/image-367.png)

To avoid issues:

1.  **Separate actions**: The data returned by CreditGuard and any actions based on that data should be placed in different workflow actions.
2.  **Include blocks**: Ensure there are blocks between these actions to give the system time to process and update data accurately before proceeding to the next step.

This structure will help prevent synchronization errors and ensure that data is handled properly, especially when dealing with mobile devices.
