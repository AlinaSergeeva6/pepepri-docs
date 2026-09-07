# Intro (flows)

The **User Defined** **Flows** is an add-on that enables the creation of execution flow inside events emitted in the system, each flow consists of multiple logic blocks that runs synchronously one after the other.&#x20;

\
The addon has a list of flows and an editor that allows creation of flows, by dragging & dropping logic blocks into the flow area, allowing to determine execution order for them. When a block is dragged into the flow, a configuration editor is opened for the user to configure the execution of this block later in the cpi side of the application.\
Add-ons can create **LogicBlocks** that will be available in the flow editor. These **LogicBlock** will be available in event flow editor once they are added using the [**LogicBlock**](../../addon-relations/addons-link-table/relation-names/logic-block.md) relation.&#x20;

### Flows API

The flows addon exposes an standard resource API for creating and modifying flows

[GET/POST /user\_defined\_flows](https://app.gitbook.com/o/-LUP1oYCM4aw4IDpwJDW/s/-LVCwP9BVdmHIds0xwia/\~/changes/1524/Events/intro-flows/user\_defined\_flows)

### Flow Parameters

Flow parameter are defined on the flow object and are available to the logic blocks in configure & run time.

The flow parameters are configured/set in the ABI by the user. When opening the ABI the addon opening it can specify dynamic variables that will be available in runtime, for the user to pick from in the picker. These variables will later be used in run-time to replace the parameter values

### Logic Blocks

Flows are constructed from logic blocks. Addons can add logic blocks using the [logic block relation](../../addon-relations/addons-link-table/relation-names/logic-block.md)

### Client API

Addons can run flows in their CPI Side by calling the dedicated client API.

```typescript
// get this for where it was saved using the FlowPicker ABI
const runFlowObject = {
    FlowKey: '',
    FlowParams: {
        Param1: {
            // "static" when the value is the actual value
	    // "dynamic" when the value should be replaced in runtime flow runner
            Source: 'dynamic' | 'static',
            
            // for static this is the value of the parameter
            // for dynamic this is the key of the field in the data parameter to 
            // to get the value from
            Value: 'someValue'
        }
    }
}

const res = await pepperi.flows.run({
    // The runFlow object
    runFlow: runFlowObject
    
    // dynamic parameters that will be set to the flow data
    data: {
        someValue: 124
    }

    // mandatory, used for supporting dynamic params & executing client actions
    // this is taken from the interceptor data 
    // or from req.context (in case of addon api)
    context: context
})

// res.result is an object concatinated from all the responses of all the logic blocks
// if two logic blocks return the same property the latter will override
console.log(res.result)
```

### FlowPicker ABI

The addon also exposes a ABI that allows to choose a flow and set run-time parameters. The output of the ABI is a RunFlow object that can be used to run the flow



### Parameter Handling

* **Parameter Setup**: Each logic block in a flow (e.g., a script block) can have parameters, such as `FirstName, BoolParam etc.` with optional default values.
* **Flow Parameters**: When a flow is created, flow-level parameters (e.g., `SomeName`) can be defined. These can be used by any block in the flow.
* **Static vs. Dynamic Parameters**:
  * **Static**: If a block parameter (e.g., `FirstName`) is set to a static value during flow configuration, it will always use this fixed value at runtime, regardless of changes elsewhere.
  * **Dynamic**: If a block parameter is set to a dynamic value (e.g., `FirstName` is mapped to the flow parameter `SomeName`), it will use the value of `SomeName` during runtime. This value can be influenced by other blocks that modify `SomeName` during execution.
*   **Parameter Modification by Blocks**:

    * Each logic block receives an object containing its parameters, the flow parameters, and values from previous blocks.
    * Blocks can modify flow parameters by including them in the output object. Only parameters included in the output object will affect subsequent blocks using those dynamic parameters.

    **Example**:

    * `SomeName` is set to the value "Mike".
    * Block 1 modifies `SomeName` to "John" (and includes this change in the output object).
    * Block 2 has `FirstName` dynamically set to `SomeName`, so it will receive "John" as the value of `FirstName`.
