---
description: restart an existing job which is not running (finished or failure status)
---

# Restart Job



{% swagger method="post" path="/addons/jobs/restart" baseUrl="https://api.pepperi.com/v1.0" summary="" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="body" name="Key" required="true" %}
The UUID of the job
{% endswagger-parameter %}

{% swagger-parameter in="body" name="NumberOfTry" type="number" %}
default is '1'
{% endswagger-parameter %}

{% swagger-parameter in="body" name="NumberOfTries" type="number" %}
how many tries to run this job, default, the NumberOfTries the job was created with
{% endswagger-parameter %}

{% swagger-response status="200: OK" description="empty " %}

{% endswagger-response %}

{% swagger-response status="400: Bad Request" description="in case job is still running " %}

{% endswagger-response %}
{% endswagger %}
