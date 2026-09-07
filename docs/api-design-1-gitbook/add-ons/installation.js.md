# Installation.JS

### Intallation.JS&#x20;

should have 4 functions exported (install, uninstall, upgrade, downgrade), in the code example below you can see the default installation.js&#x20;

All functions should be written using the add-on function methodology and interface

installation.js example (the response must contains success field):

```javascript
exports.install = async (Client, Request) => {
    return {success:true,resultObject:{}}
}
exports.uninstall = async (Client, Request) => {
    return {success:true,resultObject:{}}
}
exports.upgrade = async (Client, Request) => {
    return {success:true,resultObject:{}}
}
exports.downgrade = async (Client, Request) => {
    return {success:true,resultObject:{}}
}
```

### parameters in the "Request.body" of upgrade/downgrade/uninstall/install that can be used:

* DeploymentAuditLogUUID
* StartDateTime
* AddonUUID
* FromVersion (in uninstall - will be the current  installed version)
* ToVersion (in install - will be the version to install)



