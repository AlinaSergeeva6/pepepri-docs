---
description: whenever the value of one of the properties changed.
---

# Field Change

## **OnClientFormFieldValueChange**

**Input**

<pre class="language-typescript"><code class="lang-typescript"><strong>interface FieldValueChangeEventInput{
</strong><strong>    Form: Form;
</strong><strong>    FormKey: string; // mutually exculsive with form
</strong><strong>    Object: {[key: stirng]: unknown};
</strong><strong>    ObjectKey: string; // mutually exculsive with object
</strong><strong>    BlockKey: string;
</strong><strong>    FieldID: string;
</strong><strong>    OldValue: unknown;
</strong><strong>    NewValue: unknown;
</strong><strong>    Parameters?: any;
</strong>}
</code></pre>

Output: Partial<[FormContainer](field-change.md#formcontainer)>
