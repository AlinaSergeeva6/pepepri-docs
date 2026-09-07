---
description: standard pepperi resource
---

# user\_defined\_flows

### GET /user\_defined\_flows

<pre><code>[{

    ...standardResourceFields, //eg. Hidden, ModificationDateTime etc.
    // auto generated on create
    Key: '',
    
    // mandatory on create
    Name: '',
    
    // optional
    Description: '',
    
    // The parameters available in the flow
    // mandatory
    Params: [
        {
            // mandatory
            Name: '',
            
            // The type of the parameter
            // Must be one of Scheme FieldType
            Type: 'String' | 'DateTime' etc.,
            
            // optional
            Description: '',
            
            // optional - must be the correct type by parameter
            DefaultValue: any,
            
            // optional, default is false
            // Internal=true means that this parameter will not be available 
            // to be set in the picker, but is available as a parameter to logic blocks
            Internal: true/false

            // The name of the resource that the object references
<strong>            // optional - must be provided if Type is 'Object', Default is 'Any'
</strong>            ObjectStructure: string
        }
    ],
    
    Steps: [
        {
            Name: '',
            
            // for debug purposes, we can disable execution of a certain step
            Disabled: false
            
            DisabledConditionFilter: { // JSON object from the query builder },
            
            Type: 'Group',
            
            Steps: [
                {
                    Type: 'LogicBlock',
                    
                    // data copied from the logic block relation
                    Relation: {
                        AddonUUID: '',
                        Name: '',
                        ExecutionURL: '/addon-cpi/execute_logic_block'
                        ModuleName: '',
                        ComponentName: '',
                    },
                    
                    // saved by the logic block editor
                    Configuration: {}
                }
            ],
            
            // whether to run the group concurrently, default is true
            Concurrent: true/false
        },
        {
            Name: '',    
            
            // for debug purposes, we can disable execution of a certain step
            Disabled: false
            
            Type: 'LogicBlock',
            
            // data copied from the logic block relation
            Relation: {
                AddonUUID: '',
                ExecutionURL: '/addon-cpi/execute_logic_block'
                ModuleName: '',
                ComponentName: '',
            },
            
            // saved by the logic block editor
            Configuration: {}
        }
    ]
}]
</code></pre>
