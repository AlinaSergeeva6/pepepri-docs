# Upgrade all installed addons

{% swagger method="post" path="/distributor/addons/reinitiate" baseUrl="https://api.pepperi.com/v1.0" summary="Install or upgrade all system addons to the latest phased version" %}
{% swagger-description %}
Install all system addons which are not currently installed. Upgrade all installed addons to their latest phased version. Run MaintenanceJob to update all other addons.
{% endswagger-description %}
{% endswagger %}
