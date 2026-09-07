# Pages events

#### Response Body (For all the endpoints)

```
{
    // This is the data of the block.
    // If this block is a producer of some keys from this object (and data is changed)
    // all consumers of these keys will be called with the merge changes in "Changes" property.
    "State": {},
    
    // the addon can return a modified configuraion
    // if the addon does not return this property the original saved configuration will be used
    "Configuration": {},
    
    // Optoinal - this will override the base configuration (Configuration.Data)
    // Supported only in the PageLoadEndpoint. These will be merged opon the Configuration
    // per the correct screen size, and merged on the hostObject.configuration if the
    // screen size changes
    "ConfigurationPerScreenSize": {
        "Tablet": {
            // the blocks configuration
        },
        "Mobile": {
            // the blocks configuration
        }
    },
}
```
