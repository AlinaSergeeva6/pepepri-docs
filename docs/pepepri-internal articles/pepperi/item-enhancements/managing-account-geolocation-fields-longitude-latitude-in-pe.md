---
title: "Managing Account Geolocation Fields (Longitude/Latitude) in Pepperi"
description: "This guide provides instructions for managing the automatic population of Account fields Longitude and Latitude by the Pepperi backend process using the Google API."
order: 313
---
# Managing Account Geolocation Fields (Longitude/Latitude) in Pepperi

*This guide provides instructions for managing the automatic population of Account fields Longitude and Latitude by the Pepperi backend process using the Google API.*

### Overview

The Longitude and Latitude fields for Accounts in Pepperi are automatically populated by a silent backend process using the Google API. This process runs without visible error notifications, so empty fields may indicate issues, potentially leading to customer dissatisfaction. This guide outlines the reasons for empty fields and provides solutions to address them.

---

### Potential Issues and Solutions

#### Reason 1: Incorrect Address

-   **Causes:**
    -   Extra or missing spaces in the address.
    -   Wrong spelling of street names.
    -   Missing country code, state, or incorrect/missing zip code.

-   **Solution:**
    -   Manually search the address on Google to identify corrections (e.g., add missing spaces or correct spelling).

        ![](/static/image-53.png)

    -   Test the corrected address by POSTing it to the Account via the Pepperi API.
    -   If successful, request the customer to update the address in their ERP, as an accounts file upload will overwrite manual changes.

#### Reason 2: Correct Address with API Error

-   **Causes:**
    -   Errors in receiving location data on certain environments, preventing automatic population.

-   **Workarounds:**
    -   **Manual POST of Coordinates:** POST the Longitude and Latitude fields manually. Once posted, the Google API will no longer overwrite these values, preserving them after account uploads.
        -   Option 1: Manually look up coordinates on Google and upload them.
        -   Option 2: Use a free API (e.g., sign up with a random email at [https://geocode.maps.co/](https://geocode.maps.co/) for up to 1,000,000 requests per month) to fetch coordinates.
            -   Use this API once for initial population or create a scheduled job for new locations.
            -   [Example](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=89438.)

-   **Process Summary:**
    -   Load accounts into Pepperi.
    -   Use a free API to populate missing geolocation data for correct addresses.
    -   Request the customer to fix incorrect addresses or manually load coordinates for the rest.
