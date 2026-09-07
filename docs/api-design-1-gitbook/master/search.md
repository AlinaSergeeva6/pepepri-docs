# Search

{% hint style="warning" %}
works only on legacy papi + adal resources for now&#x20;
{% endhint %}

{% hint style="info" %}
not supporting pagination yet - default will always be returning all based on the key list
{% endhint %}

{% swagger method="post" path="/v1/{pepperi_resource}/search" baseUrl="https://api.pepperi.com" summary="" %}
{% swagger-description %}
Perform a search like the "where" clause but given body to overcome the URL size limitation to get list of objects 
{% endswagger-description %}

{% swagger-parameter in="body" name="KeyList" type="String Array" required="true" %}
Must provide the key list the where is additional filter
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Fields" type="String" %}
Field IDs separated by ',' if not provided all fields will be returned
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Where " type="string" %}
pepperi "where" clause
{% endswagger-parameter %}
{% endswagger %}
