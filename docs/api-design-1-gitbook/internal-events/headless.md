---
description: Describes the pepperi headless concept
---

# Headless

This section contains the guidelines for the pepperi headless API, in pepperi is is also known as Event Driven Application &#x20;

Headless API is triggering events because of a user action in the application UI. The event is handled by the server side, it will process the event and will perform server-side logic, activate client actions, emit configured UserFlow as defined and will return data as defined by the event&#x20;

### OnClient{Resource}{Operation}

Resource is the application/addon that defines the page block firing the events\
Example for resources: Transaction, ApplicationHeader, Gallery, Survey

Operation is the definition of the action the user has performed directly or indirectly like pressing a button or loading a page, this operation will fire the event \
Example for operations: ButtonClicked, Load, FieldChanged

Combined examples, OnClientGalleryCardClicked&#x20;

### Server Side

Every Event has a should define hte following four sections&#x20;

1. **General** - Server Side business logic performed by the event handler including expected client actions&#x20;
2. **input -** JSON
3. **output -** JSON
4. **UserFlow**  - In which stage each UserFlow will be run and brief explanation&#x20;
