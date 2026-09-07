---
description: Describes the pepperi headless application concept
---

# Headless Application

This section contains the guidelines for the pepperi headless API, in pepperi is is also known as Event Driven Application &#x20;

Headless API is triggering events because of a user action in the application UI. The event is handled by the server side, it will process the event and will perform server-side logic, activate client actions, emit configured UserFlow as defined and will return data as defined by the event&#x20;

### OnClient{Resource}{Operation}

Resource is the application/addon that defines the page block firing the events\
Example for resources: Transaction, ApplicationHeader, Gallery, Survey

Operation is the definition of the action the user has performed directly or indirectly like pressing a button or loading a page, this operation will fire the event \
Example for operations: ButtonClicked, Load, FieldChanged

Combined examples, OnClientGalleryCardClicked&#x20;

### Documentation Structure

Every Headless Event has a should define the following three sections per page&#x20;

1. **OnClient{Resource}{Operation}** - CPI Side business logic performed by the event handler including expected client actions&#x20;
2. **input -** JSON - input should contain: {
   1. {Resource}Key - (string) or {Resource}Config (JSON object)
   2. State - the current state on the client of the Resource&#x20;
   3. Changes - partial state object, the changes that need to be applied (i.e.. changes on the state)
   4. {Menu|Button}Key - string represents the key of the button or menu that was clicked
3. **output -** JSON that should contain:
   1. State&#x20;
   2. Data
   3. Config

