# Dataflows SQL Configuration

### General Settings

Add these 2 fields:

**sql\_connection**: Data Source=**Server Name**;Initial Catalog=DB**Name**;Integrated Security=False;User ID=**your** **value**;Password=**password**

**signalr\_client\_id:** clientID

<figure><img src="../../../../.gitbook/assets/image (160).png" alt=""><figcaption></figcaption></figure>

### Dataflow task

{% tabs %}
{% tab title="Settings" %}
**listener\_run\_exe:** ./exporter/exporter.exe (path to **exporter.exe** on the client's server from the listener's folder.)

**is\_sql\_source: true**

**is\_new\_api: true**
{% endtab %}

{% tab title="Details" %}
* **Application:** Generic Desktop Connector
* **Source Object:** Generic Desktop Export
* **Target Object:** Store Data Table For Later Use
{% endtab %}

{% tab title="SQL" %}
write your SQL code here
{% endtab %}
{% endtabs %}
