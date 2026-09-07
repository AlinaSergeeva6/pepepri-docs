# Button Click

## OnClientFormButtonClick

Input:

```typescript
interface ButtonClickEventInput{
    Form: Form;
    FormKey: string; // mutually exculsive with form
    Object: {[key: stirng]: unknown};
    ObjectKey: string // mutually exculsive with object
    BlockKey: string;
    ButtonKey: string;
    Parameters?: any;
}
```

Output: Partial<[FormContainer](button-click.md#formcontainer)>
