/*
* Key: 46a0a1b7-a177-4bb2-ae52-94e8b47a2aa5
* Name: Calculate Transaction Totals
* Description: Calculate transaction totals - run from the events, after calculating pricing
* Created: 20.01.2025, 15:57:45
* Last Modified: 30.01.2025, 17:37:39
*/

// This script:
// 1. updates a header TSA with the current time, in order to trigger a rule engine that calls calc fields to calculate order totals.
//    (order totals runs in rule engine since they need to be calculated also after package promo is given and the only trigger for it is rule engine on Total Quantities)
//
// This code is called from the events, after pricing is calculated.
//
// Script parameters:
//  * transactionUUID - string

export async function main(context) {
    //Get Transaction UUID from main context object
    const transactionUUID = context.transactionUUID;

    // pepperi library contains DataObject object which allows to receive whole transaction object
    const transaction = await pepperi.DataObject.Get('transactions', transactionUUID);

    //check if transaction is editable
    const isOrderEditable = await isEditableTransaction(transaction);
    if (!isOrderEditable) {
        console.log('transaction is not editable');
        return '';
    }

    const currtime = new Date().getTime().toString();

    //Set transaction header field value
    const promisesArr = [updateTransaction(transactionUUID, {TSAPPMlastupdate: currtime})];

    await Promise.all(promisesArr);

    return '';
}

async function updateTransaction(transactionUUID: string, objForUpdate: object) {
    const t1 = new Date().getTime();
    await pepperi.app.transactions.update({objects: [{UUID: transactionUUID, ...objForUpdate}]});
    console.log(`Transaction update took ${new Date().getTime() - t1}ms`);
}

async function isEditableTransaction(order: Transaction): Promise<boolean> {
    let isEditable = true;
    const transitions = await order.availableTransitions();
    if (transitions.length == 0) {
        const inTransition = await order.inTransition();
        isEditable = inTransition;
    }
    return isEditable;
}
