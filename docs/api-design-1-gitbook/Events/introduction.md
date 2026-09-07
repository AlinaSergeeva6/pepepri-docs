# Intro (deprecated)

The **User Defined** **Events** is an add-on that enables the creation of execution flow inside an event emitted in the system, each flow is consistent of multiple logic blocks that runs synchronously one after the other. \
The add-on has an editor that allows admins to add **LogicBlocks** to an event flow, by dragging & dropping logic blocks into the flow area, allowing to determine execution order for them. When a block is dragged into the flow, a configuration editor is opened for the user to configure the execution of this block later in the cpi side of the application.\
Add-ons can create **LogicBlocks** that later will available in the event flow editor. These **LogicBlock** will be available in event flow editor once they are added using the [**LogicBlock**](../addon-relations/addons-link-table/relation-names/logic-block.md) relation.&#x20;

Add-ons that emitting events, and want to let users define flow for these events, can do so by one of the following options:

* Implementing the User Defined Events [Block Interface](../abi-addon-block-interface/addon-block-api/events.md), and sending it the relevant information regarding the events.
* Supporting Events through User Defined Collections.&#x20;

The User Defined Collections add-on is already implementing the User Defined Events block interface, for all the add-ons that save their operative data using collections (i.e Survey, Visit Flow etc.). To support users customizing their event's flow, one must implement the [UDCEvents](../addon-relations/addons-link-table/relation-names/user-events.md) relation. After implementing this relation, the user will be able to go to the collections list on UDC add-on (\
Settings->Configuration->User Defined Collections), choose the desired collection, and choose 'Define Events' from the menu. This will open the User Defined Events add-on where he will be able to define his flow by choosing the desired event and drag & drop logic blocks in the flow area.
