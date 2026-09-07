# Debugging Scripts and Flows

Navigation:

[#scripts](debugging-scripts-and-flows.md#scripts "mention")

[#flows](debugging-scripts-and-flows.md#flows "mention")

{% hint style="danger" %}
Requires the extensions for new Pages. See [pages-add-on](../add-ons-manuals/pages-add-on/ "mention")
{% endhint %}

## Scripts

1. Go to Pepperi Backoffice -> Configuration -> Scripts
2. Select the script you need to debug, then click on pencil and Debugger:

<figure><img src="../.gitbook/assets/image (931).png" alt=""><figcaption></figcaption></figure>

3. The debugging space will be opened:

<figure><img src="../.gitbook/assets/image (941).png" alt=""><figcaption></figcaption></figure>

#### Debugging space consists of:

* **Code Editor**: you can view and edit script code here.&#x20;
* **Result**: shows any errors of the script
* **Logs**: shows the output of all console.log functions in the script
* **Parameters**: you can add the required input values here

{% hint style="warning" %}
If you need to add the **accountUUID** in parameters, you need first to make sure the needed **account** is visible for the admin by **opening it** from the account list, as admin users do not always have access to all the accounts.
{% endhint %}

* **Publish button:**  The changes you add will not be saved unless you click on the **Publish** button.
* **Run button**: You can run the script. You do **not** need to publish the changed script to run it.&#x20;

{% hint style="success" %}
If you want to save the changes of the script, click **Publish**; otherwise just **Run** the script to see if it works.
{% endhint %}

Once you add the needed values, click **Run** to execute the script. You will see errors and logs in the respective sections.&#x20;

{% hint style="info" %}
If the script runs successfully it will open a new tab using the resulting link or Pepperi homepage if the link is not valid. If the script opens external link it will open both homepage and the external links.
{% endhint %}

## Flows

1. Go to Pepperi Backoffice -> Configuration -> Flows
2. Select the flow  you need to debug, then click on pencil and Test:

<figure><img src="../.gitbook/assets/image (937).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (943).png" alt=""><figcaption></figcaption></figure>

#### Debugging space consists of:

* **Flow Parameters**: you can add required input values here
* **Test Output** includes input object, run logs and output object.&#x20;
* **Run Flow button**: You can run the flow.&#x20;

Once you run the flow, the execution result links will be opened or the link to homepage.
