# Initialization

{% hint style="info" %}
Before reading this section, please read [this](https://app.gitbook.com/o/-LUP1oYCM4aw4IDpwJDW/s/-LfO_rsQzfnV957oTV_f/~/changes/a3yb2j8auyJc3UOuCheg/integration-platform-ipaas/payments/worldpay/important-information-before-starting-integration). It contains important information including code samples, Request examples, etc.
{% endhint %}

### Tasks

The name of the main task is “**WorldPay Payment**”. It contains all js logic (it is written in ui\_page\_head).

In example tasks, to make changes easy, we use global variables. Keys for them are displayed in credential list. **(You can read more** [**here**](https://app.gitbook.com/o/-LUP1oYCM4aw4IDpwJDW/s/-LfO_rsQzfnV957oTV_f/~/changes/a3yb2j8auyJc3UOuCheg/integration-platform-ipaas/payments/worldpay/important-information-before-starting-integration)**)**

The first function uses **Get Access Token task** to send xml code and get a link in response to use it in iframe src.

We need to define host URI and link to the css file. Styles can be customized. Moreover, inputs, placeholders, labels, field order, card types and validations can be changed in xml code to customize an iframe

{% hint style="info" %}
CSS file is mandatory, you need to use at least default styles file.
{% endhint %}

Example of simplest code:

```
<?xml version="1.0" encoding="utf-8"?>
<merchantHtmlPacketModel  xmlns="Paymetric:XiIntercept:MerchantHtmlPacketModel">
    <iFramePacket>
        <hostUri>https://integration.pepperi.com/</hostUri>
        <cssUri>http://test.css</cssUri>
    </iFramePacket>
    <templateHtml name="CreditCard">
        <paymentTypes>
            <paymentType type="american express" />
            <paymentType type="mastercard" />
            <paymentType type="maestro" />
            <paymentType type="visa" />
            <paymentType type="custom" value="HD" text="Home Depot" />
        </paymentTypes>
    </templateHtml>
</merchantHtmlPacketModel>

```

We send it as a string with post\_array to the UI task token:

<figure><img src="../../../../.gitbook/assets/3 (13).png" alt=""><figcaption></figcaption></figure>

And receive access token to render iframe:

```
renderFrameElements: async function (accessToken) {
      const frameUrl = `!%generic_param_3%!/diecomm/View/
Iframe/${controller.helpData.merchantGUID}/${accessToken}/True`;
const frameHtml = `<iframe src="${frameUrl}" 
id="worldPayIframe"></iframe>`;
      $(`#worldPayIframeContainer`).html(frameHtml);
    }

```

In default iframe we can see these inputs:

<figure><img src="../../../../.gitbook/assets/4 (13).png" alt=""><figcaption></figcaption></figure>

### Supported card types that we can add to xml:

* Visa
* MasterCard
* American Express
* Diner\`s
* Discover
* JCB
* Maestro

You can also take those fields and put them in the tags and add classes to change styles like:

```
<tag name="div" class="cardholderName">
<label for="cardholderName" text="Name on card" />
<tboxCardHolderName />
<validationMsg class="valmsg" for="cardholderName" />
</tag>
```

In response you will get:

```
<div name="div" id="div" class="cardholderName">
            <label name="lbl-c-cardname" id="lbl-c-cardname" xi-elem="c-cardname" for="c-cardname">Name on card</label>
            <input type="text" name="c-chn" id="c-cardname" xi-name="Card Holder Name" aria-label="Card Holder Name" 
                    xi-elem="c-chn" data-rule-required="true" data-msg-required="Please enter the card holder name" 
                    xi-error-msg-style="text" autocomplete="off" aria-required="true">
            <div name="valmsg-c-cardname" id="c-cardname-error" class="valmsg" xi-elem="c-cardname" data-msg-for="c-cardname"></div>
</div>

```

Customized response can look like this:

<figure><img src="../../../../.gitbook/assets/5 (11).png" alt=""><figcaption></figcaption></figure>

**Pay** and **Cancel** buttons need to be added to the ui\_page\_body of main UI task.

Add function to send request with iframe id and access token in target url param for payment submit:

```
onSubmitClick: async function (accessToken) {
      const frameUrl = `!%generic_param_3%!/diecomm/View/Iframe/${controller.helpData.merchantGUID}/${accessToken}/True`;
      $XIFrame.submit({
        iFrameId: 'worldPayIframe',
        targetUrl: frameUrl,
        onSuccess: function (msg) {
          const parsedMessage = JSON.parse(msg);
          const hasPassed = parsedMessage.data.HasPassed;
          const operationDone = parsedMessage.operation === 'done';
          
          validate(!!hasPassed && operationDone);
          controller.proceedAuth(accessToken);
        },
        onError: function (msg) {
          showErrorMessageAndClose();
        }
      });
    },

```

On success we need to get all needed fields from response:

```
const fields = await this.getResponsePacket(accessToken);

      let cardToken = fields.find(field => field.Name === 'Card Number').Value;
      let cardNumber = fields.find(field => field.Name === 'Card Number').Value;
      let cardType = fields.find(field => field.Name === 'Card Type').Value;
      let cardHolderName = fields.find(field => field.Name === 'Card Holder Name').Value;
      let cardSecurityCode = fields.find(field => field.Name === 'Card Security Code').Value;
      let expirationMonth = fields.find(field => field.Name === 'Expiration Month').Value;
      let expirationYear = fields.find(field => field.Name === 'Expiration Year').Value ? String(fields.find(field => field.Name === 'Expiration Year').Value).slice(-2) : '';
      let testAmount = cardType == 'ax' ? 1 : cardType == 'di' ? 1 : cardType == 'vi' ? 0 : cardType == 'm' ? 0 : 0;
      validate(cardToken, "Can't get card token!");

```

getResponsePacket is UI task that gets response with access token:

<figure><img src="../../../../.gitbook/assets/6 (5).png" alt=""><figcaption></figcaption></figure>

After this we send fields with test withdrawal amount in “WorldPay Card Pre-Authorization” task which can be 0 or 1 for different card types to get information about validation of the card.

<figure><img src="../../../../.gitbook/assets/7 (8).png" alt=""><figcaption></figcaption></figure>

```javascript
//If we receive 
result.object["s:Envelope"]["s:Body"]["SoapOpResponse"]["SoapOpResult"]["packets"]["ITransactionHeader"]["StatusCode"] == “100”
 
//And 
result.object["s:Envelope"]["s:Body"]["SoapOpResponse"]["SoapOpResult"]["packets"]["ITransactionHeader"]["InfoItems"]["InfoItem"].find(el => el.Key == "TR_CARD_CIDRESPCODE") == “M”

```

Card is valid and we can withdraw full amount from card with “WorldPay Card Authorization” task, check this response again and in case of the same response results - withdrawal is successful.
