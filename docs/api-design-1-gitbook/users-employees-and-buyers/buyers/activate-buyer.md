# Activate buyer

{% swagger method="post" path="/buyers/activate" baseUrl="https://api.pepperi.com/v1.0" summary="Activate buyers as users" %}
{% swagger-description %}
Activating a buyer will create a user with the buyer's key.
{% endswagger-description %}

{% swagger-parameter in="body" name="Keys" type="array" %}
array of buyers keys
{% endswagger-parameter %}

{% swagger-response status="200: OK" description="" %}
```

[
  {
        "Buyer": "e3c2d300-a1df-4288-a293-699598b18063",
        "Name": "Dana Levi",
        "Email": "dana.l@gmail.com",
        "Success": true,
        "Password": "GBHGFHF" // will be shown only to admin
       
    },
    {
        "Buyer": "fb6b5f63-ee13-4618-862a-045c9af2c3c2",
        "Name": "Dor Cohen",
        "Email": "dor.c@gmail.com",
        "Success": false,
        "Message": "This buyer is not under your chain",
    },
    {
        "Buyer": "eb6b5f63-ee13-4618-862a-045c9af2c3c3",
        "Name": "Bar Cohen",
        "Email": "bar.c@gmail.com",
        "Success": false,
        "Message": "Buyer is already activated",
    }
]

```
{% endswagger-response %}
{% endswagger %}
