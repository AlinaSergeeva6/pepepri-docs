# Execute now codejob

{% swagger method="post" path="code_jobs/async/{CodeJobUUID}/execute" baseUrl="https://api.pepperi.com/v1.0/" summary="" %}
{% swagger-description %}
execute codejob immediately 
{% endswagger-description %}

{% swagger-parameter in="path" name="CodeJobUUID" required="true" %}
requested codejob uuid
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Body" type="Object" %}
body params
{% endswagger-parameter %}

{% swagger-response status="200: OK" description="" %}
```javascript
{
    "ExecutionUUID": "3274fbbc-8e62-42c8-bdde-21f9ccfd2506",
    "URI": "/audit_logs/3274fbbc-8e62-42c8-bdde-21f9ccfd2506"
}
```
{% endswagger-response %}
{% endswagger %}
