---
title: "Custom Homepage Header"
description: "Effort Estimation: 2h(with dropdown 4h-8h)"
order: 285
---
# Custom Homepage Header

*Effort Estimation: 2h(with dropdown 4h-8h)*

Description:

Config files that allow you to create visual copy of standard header with setting gear and icon with title for homepage by using custom homepage config file.

### Advantages and disadvantages

!!!success
Allows you to add any changes for homepage header.
!!!

!!!danger
Requires loading a config file on the pepperi resources with the names of the transactions/activities used to create the header dropdown if the App Home Screen for a certain profile/profiles has more than 16 elements.(Now dropdown does not work)
!!!

### Demo - how does it work:

Open Services Demo Environment (7343) (30013939) -> Settings -> Branded App -> WebApp Main Bar. Fo Admin add Custom\_Header\_V1 and reload page. For Rep header already added so login as testRep@demoenviromnent.com

### How to copy to another environment:

Implementing this feature on new environment requires :

1\. Download config files. For Rep Custom\_Header\_Rep\_V1 or for admin Custom\_Header\_V1(with settings gear) . 2. Change all variables which are required according to the new environment. Replace links to the config files with dropdown data if necessary. 3. Upload changed file to Configuration Files with File Type: WebApp Customization. 4. Add to WebApp Customization.

### Advanced configuration:

You can update dropdown logic. It works like the old version of the custom homepage, so it allows you to add any buttons and visual elements to the header. As an example, in Dermalogica, іsame header with additional logic is used so that when the homepage is opened, updates the value from the resource api is updated via dataflow task of the promotion points for opened account in Accounts activity.
