---
title: "Custom Order Details"
order: 43
---
# Custom Order Details

20KB

[custom order details form.txt](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2F0Vct7Gyl9hOEkONvl5bt%2Fcustom%20order%20details%20form.txt?alt=media&token=0832cd3e-8551-451e-bfb0-d52c59673a0e)

[Open](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2F0Vct7Gyl9hOEkONvl5bt%2Fcustom%20order%20details%20form.txt?alt=media&token=0832cd3e-8551-451e-bfb0-d52c59673a0e)

By this form you can update the fields from transaction before submitting it. There is not a lot of code here, so it will not be difficult to modify it for your needs. here is the template that you can insert in yor code:

```
//part of settings
var globalData={
        cfContext: [],
        fields:{},
        needFields: [ //fields what u wanna update/use
            "TSACSOrderSubmittedBy",
            "TSACSHoldCode",
            "TSASendOrderAsS1ToJDE",
            "TSAS1ReasonCode",
            "TSAEditableNotesAccountPassword",
            "TSAEditableNotesAuthorizedBuyers",
            "TSAEditableNotesShippingInstructions",
            "TSAEditableNotesOtherComments"
        ],
      };

//part where we get the fields
pepperi.api.transactions.get({
          key: { UUID: globalData.cfContext.transaction.uuid },
          fields: [
            ...globalData.needFields
          ],
          responseCallback: "fieldsInsertToHtml"
      });

//Then code checks all values from transaction and inserts those to output HTML form:
const {
                TSACSOrderSubmittedBy,
                TSACSHoldCode,
                TSASendOrderAsS1ToJDE,
                TSAS1ReasonCode,
                TSAEditableNotesAccountPassword,
                TSAEditableNotesAuthorizedBuyers,
                TSAEditableNotesShippingInstructions,
                TSAEditableNotesOtherComments,
            } = globalData.fields;

            cSOrderSubmittedBy.value = TSACSOrderSubmittedBy;
            cSHoldCode.innerHTML = TSACSHoldCode;
            addBoolFromField(TSASendOrderAsS1ToJDE);
            s1ReasonCode.innerHTML = TSAS1ReasonCode;
            editableNAccPass.value = TSAEditableNotesAccountPassword;
            editableNAuthBuyers.value = TSAEditableNotesAuthorizedBuyers;
            editableNShipInst.value = TSAEditableNotesShippingInstructions;
            editableNOthrComments.value = TSAEditableNotesOtherComments;
```

The entered values will be substituted in the fields earlier, and if they are not there, the form will be empty.

The view in Browser:

![](https://alinasergeeva6.github.io/pepepri-docs/static/11332323213.png)

Mobile view:

![](https://alinasergeeva6.github.io/pepepri-docs/static/44114141.png)

```
//There in HTML we have two types of lines for input fields:
<div class="type_single"></div>
<div class="type_double"></div>
U can use that for yr custom templates.

//After all manipulation we just have button “Continue” what update transaction
//fields in this code:
function updateDetails(){
        if(cSOrderSubmittedBy.value == ''){
          cSOrderSubmittedBy.classList.add('warn'); //that just for important/mandatory field
        } else {
          try{
            cSOrderSubmittedBy.classList.remove('warn');
            pepperi.api.transactions.update({
              objects: [{
                UUID: globalData.cfContext.transaction.uuid,  //UUID transaction and other fields to update
                TSACSOrderSubmittedBy: cSOrderSubmittedBy.value,
                TSACSHoldCode: cSHoldCode.outerText,
                TSASendOrderAsS1ToJDE: !checkVal,
                TSAS1ReasonCode: s1ReasonCode.outerText,
                TSAEditableNotesAccountPassword: editableNAccPass.value,
                TSAEditableNotesAuthorizedBuyers: editableNAuthBuyers.value,
                TSAEditableNotesShippingInstructions: editableNShipInst.value,
                TSAEditableNotesOtherComments: editableNOthrComments.value
              }]
            });
            console.log('Updated');
            window.pepperiApp.onClose();
          } catch(e) {
            console.log('not updated(');
          }
        }
      };

//This template has comments for part of code. I think that easy for understand.
```
