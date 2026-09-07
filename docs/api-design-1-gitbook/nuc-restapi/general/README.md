---
description: general guidelines for nucleus REST API
---

# General

The Nucleus REST API is a newly introduced interface in Nuc, designed to simplify the process of adding APIs and debugging. It is an internal API that is exclusively accessible to services within the Pepperi VPN, making it unavailable for use by external services or users outside the VPN.

In order to use it there should be a tool/sdk (available within papi service) that will calculate and cache the port to be used per tenant&#x20;

The base URL for all endpoints should be : `http://nuc_url:{port}`

port is the port number of the nucleus under which the tenant is running, one should use SDK for that and not compute it on their own, it must get the port from local cache for performance
