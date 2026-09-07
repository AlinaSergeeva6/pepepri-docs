# Update Single Sync Data

{% hint style="info" %}
Only the same user can change the sync data (even admin cannot change it)
{% endhint %}

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/application/sync/data/{SyncUUID}" method="post" summary="" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="body" name="LocalDataUpdatesURL" type="string" %}
URL containing local data updates in case of data bigger than 500K
{% endswagger-parameter %}

{% swagger-parameter in="body" name="LocalDataUpdates" type="string" %}
the data object coming from the client
{% endswagger-parameter %}

{% swagger-parameter in="body" name="UUID" type="object" %}
the sync uuid - must be the same as the syncUUID in the URL 
{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```
same as GET
```
{% endswagger-response %}
{% endswagger %}

