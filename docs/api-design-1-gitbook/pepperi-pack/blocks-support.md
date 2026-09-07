---
description: Support in client zip improvements.
---

# Blocks support

Here is the todo list (for each addon):

* angular.json (client-side)
  1. Set "commonChunk": true in architect -> build -> options.
  2. Set "namedChunks”: true in architect -> build -> configurations -> production
* package.json file (client-side) - change all "dependencies" to be like this
  1.

      ```json
      "@angular/animations": "14.0.2",
      "@angular/cdk": "14.0.2",
      "@angular/common": "14.0.2",
      "@angular/compiler": "14.0.2",
      "@angular/core": "14.0.2",
      "@angular/elements": "14.0.2",
      "@angular/flex-layout": "14.0.0-beta.40",
      "@angular/forms": "14.0.2",
      "@angular/material": "14.0.2",
      "@angular/material-moment-adapter": "14.0.2",
      "@angular/platform-browser": "14.0.2",
      "@angular/platform-browser-dynamic": "14.0.2",
      "@angular/router": "14.0.2",
      "@mat-datetimepicker/core": "^9.0.68",
      "@mat-datetimepicker/moment": "^9.0.68",
      "@ngx-translate/core": "^14.0.0",
      "@ngx-translate/http-loader": "^7.0.0",
      "@pepperi-addons/data-views": "0.0.2",
      "@pepperi-addons/ngx-composite-lib": "^0.4.2-beta.33",
      "@pepperi-addons/ngx-lib": "^0.4.2-beta.150",
      "@pepperi-addons/papi-sdk": "^1.53.0",
      "@tweenjs/tween.js": "^17.1.1",
      "hammerjs": "^2.0.8",
      "moment": "^2.27.0",
      "ng-gallery": "^5.0.0",
      "ng2-file-upload": "^1.4.0",
      "ngx-quill": "^12.0.1",
      "ngx-signaturepad": "0.0.9",
      "ngx-translate-multi-http-loader": "^3.0.0",
      "ngx-virtual-scroller": "^4.0.3",
      "quill": "^1.3.7",
      "rxjs": "7.8.0",
      "tslib": "^2.0.0",
      "zone.js": "~0.11.5"
      ```
*   package.json file (root)  - upgrade scripts

    ```json
    "@pepperi-addons/scripts": "^2.0.16"
    ```
* addon.config.json file  (root)
  1. Add "pepperi\_pack": “1.1.6” to PublishConfig -> Dependencies.
  2. Add "AddonPackage" section after "PublishConfig" like this
     1.

         ```json
         "AddonPackage": {
             "ClientZip": true,
             "Dependencies": {
                 "@angular/animations": "14",
                 "@angular/cdk": "14",
                 "@angular/common": "14",
                 "@angular/core": "14",
                 "@angular/elements": "14",
                 "@angular/flex-layout": "14",
                 "@angular/forms": "14",
                 "@angular/material": "14",
                 "@angular/platform-browser": "14",
                 "@angular/router": "14",
                 "@mat-datetimepicker/core": "9",
                 "@ngx-translate/core": "14",
                 "@pepperi-addons/ngx-composite-lib": "0",
                 "@pepperi-addons/ngx-lib": "0",
                 "hammerjs": "2",
                 "moment": "2",
                 "ng-gallery": "5",
                 "ng2-file-upload": "1",
                 "ngx-quill": "12",
                 "ngx-signaturepad": "0",
                 "ngx-virtual-scroller": "4",
                 "quill": "1",
                 "rxjs": "7"
             }
         }
         ```

