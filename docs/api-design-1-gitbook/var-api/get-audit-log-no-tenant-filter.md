# Get audit log no tenant filter

{% swagger method="get" path="audit_logs/var/audit_logs?fields={fields}&Where={WhereClause}&order_by={orderBy}&page={pageIndex}&page_size={pageSize}&is_distinct={isDistinct}&include_count={isCount}" baseUrl="https://api/pepperi/com/v1.0/" summary="Get list of audit log objects that belongs to all of the distributors" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="header" name="Authorization" type="String" required="false" %}
Var Admin
{% endswagger-parameter %}

{% swagger-response status="200: OK" description="List of audit log objects" %}
```javascript
{
    // Response
}
```
{% endswagger-response %}
{% endswagger %}
