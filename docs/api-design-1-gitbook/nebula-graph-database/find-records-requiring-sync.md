---
description: Gets the keys of a resource's records that should be synced
---

# 🔂 Find Records Requiring Sync

{% hint style="warning" %}
**Limitations:** \
\- This endpoint will return an error if the data to return is larger than 4MB.\
\- After 28 seconds the endpoint will throw an error.
{% endhint %}

{% swagger method="post" path="/nebula/sync/{AddonUUID}/{SchemaName}" baseUrl="https://api.pepperi.com/v1.0" summary="Find records requiring sync" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="body" name="Token" type="string" required="true" %}
A security token from get_resources.
{% endswagger-parameter %}

{% swagger-parameter in="query" name="AddonUUID" type="string" required="true" %}
The owner of the schema
{% endswagger-parameter %}

{% swagger-parameter in="query" name="SchemaName" type="string" required="true" %}
The name of the schema
{% endswagger-parameter %}

{% swagger-response status="200: OK" description="Success" %}
<pre class="language-javascript"><code class="lang-javascript">{
    Keys: [...], // array of documents keys
<strong>    HiddenKeys: [...] // array of hidden documents keys
</strong>}
</code></pre>
{% endswagger-response %}
{% endswagger %}

{% hint style="info" %}
The documents will be filtered the same way get\_resources was filtered.
{% endhint %}

{% hint style="info" %}
**Token** - the security token is only valid for 30 minutes.
{% endhint %}
