# The addon.config.json file

The addon creation script includes a addon.config.json file in each addon's root folder.

This file contains information about the addon, and is used by different mechansims to support rollup operation, publishing of an addon version, debugging info etc.

<pre><code>{
  "AddonUUID": string, // The addon UUID,
  "AddonVersion": string, // Semver version of the addon.
  "DebugPort": number, // Used by the debug server to determine which port number will be used to serve the addon.
  "WebappBaseUrl": "https://app.sandbox.pepperi.com", // Used by the debug server 
  "DefaultEditor": string, // Used by the debug server
  "Endpoints": string[], // List of ts files in server-side folder to be used as endpoints. 
                         // Files listed here will be used by (1) rollup to create the final
                         // js files. It will also be used (2) by the @pepperi-addons/scripts when 
                         // calling the publish-addon script. The compiled version of these files 
                         // will be excluded from the client.zip                        
  "Editors": string[] , // Obsolete. Was used when the published folder was split into three parts (CPI, client and server side).
<strong>  "PublishConfig": {
</strong>    "ClientStack": string, //"ng10",
    "Editors": string[], // Used in WebApp to build the Settings tree.
    "Dependencies": { [key: string]: string }, // { 
                                               // "adal": "1.4.60",
                                               // "cpi_data": "0.6.12",
                                               // }
                                               //
                                               // A dictionary of addon names and semver versions,
                                               // defining addons and addons versions upon which
                                               // this addon version is dependent on.

    "CPISide": string[] // A list of ts files found in cpi-side folder
                        // Used to rollup the endpoints of the cpi-side.
  },
  "AddonPackage": // This property is used by the @pepperi-addons/scripts publish-addon script
                  // to configure the published addon files
  {
      "ClientZip": false                         // create client.zip or not, default is true                                        
      "Dependencies": {[key: string]: string]},
                                   //{"@angular/common": "14.0.2"}
                                  // To keep client.zip file small, compiled clien-side js files 
                                  // that are derived from the dependencies listed in this 
                                  // dictionary will be removed from the client.zip file, and when
                                  // unpacked a new Symbolic Link will be created instead.
                                  // For more details about supported dependencies and versions
                                  // see the Pepperi Pack addon documentation
   }
}
</code></pre>
