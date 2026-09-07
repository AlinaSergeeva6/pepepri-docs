---
description: CPI side system translations to add-ons
---

# Translation

* To begin using translations for a specific addon, use the `load` endpoint. This endpoint allows you to upload translations associated with a particular addon. The provided translations will be stored for future retrieval.
* Once the translations are successfully loaded, you can retrieve specific translations for keys in various languages using the following SDK.



<details>

<summary>pepperi.translations.load({addonUUID, translations})</summary>

load translations for specific add-ons for later use.

**Usage example:**

```javascript
pepperi.translations.load({
    "addonUUID": "00000000-0000-0000-0000-000000000000",
    "translations": {
        "en": {
            "hello": "World"
        },
        "he": {
            "hello": "עולם"
        },
        "ru": {
            "hello": "Мир"
        }
    }
})
```

**Result:**

```
// undefined or exception in case of an error
```

&#x20;     &#x20;

&#x20;    &#x20;



</details>



<details>

<summary>pepperi.translations.translate({key, addonUUID}}</summary>

Retrieves the translation for a given key

**Usage example:**

```javascript
// key: The key for which the translation is requested.
const value: string = pepperi.translations.translate({
    "key": "addon_name",
    // optional - if not passed, the user translation will be returned
    "addonUUID": "00000000-0000-0000-0000-000000000000",
    "language": "en" // not yet supported
})
```

**Result (string):**

Retrieves the value based on the device's language preference. If the requested key is unavailable in the device's language, it retrieves the value in English. If there is no English translation available for the requested key, it retrieves the key itself

</details>

