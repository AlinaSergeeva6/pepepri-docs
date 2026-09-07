---
description: The first event that load the form
---

# Form Load

## **OnClientFormLoad**

**Input**

<pre class="language-typescript"><code class="lang-typescript"><strong>interface FieldValueChangeEventInput{
</strong><strong>    FormKey?: string; // mutually exculsive with form
</strong>    Form?: FormConfiguration;
    ObjectKey?: string; // mutually exculsive with object
    Object?: ViewDataItem;
    Parameters?: any;
}
</code></pre>

Output: Partial<[FormContainer](form-load.md#formcontainer)>

