# Deactivate buyer

Deactivating a buyer should hide all account\_users relations and reset the user reference to the default value.

{% swagger method="post" path="/buyers/deactivate" baseUrl="https://api.pepperi.com/v1.0" summary="Deactivate buyers from users" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="body" name="Keys" type="array" %}
array of buyers keys
{% endswagger-parameter %}

{% swagger-response status="200: OK" description="" %}
Same response as activate (without passwords)
{% endswagger-response %}
{% endswagger %}
