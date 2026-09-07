---
description: >-
  Gets data of Nebula-synced resources that were changed and the keys of each
  resource's records that should be synced.
---

# 🔃 Find Schemes & Records Requiring Sync

{% hint style="warning" %}
Limitations:

* Supports up to 20K modified keys per resource - throws otherwise.
* Maximum 4MB response, about 100K modified keys.&#x20;
* After 28 seconds the endpoint will throw an error.
{% endhint %}

{% swagger method="post" path="/nebula/sync_modified_keys" baseUrl="https://api.pepperi.com/v1.0" summary="Get resources and records requiring sync" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="body" name="Find Resource Requiring Sync body" required="true" type="object" %}
Exactly like in resources endpoint
{% endswagger-parameter %}

{% swagger-parameter in="body" name="PageKey" type="string" %}
The key of the page, should be taken from NextPageKey of  previous page response.
{% endswagger-parameter %}

{% swagger-parameter in="body" name="PageSize" type="number" %}
The size of the page.\
Default: 100K.
{% endswagger-parameter %}

{% swagger-response status="200: OK" description="Resources & Records" %}
<pre class="language-typescript"><code class="lang-typescript">{
    // Will be undefined if we got to the last page.
    NextPageKey: string | undefined;
    
    // Same as Get Resources Requiring Sync without the Token.
    {...} // LastSyncDateTime returns only for the first page.
    
    // Each resouce has in addition the following data: 
    "ModifiedKeys": {...} // Same as Get Records Requiring Sync
<strong>}
</strong></code></pre>
{% endswagger-response %}
{% endswagger %}
