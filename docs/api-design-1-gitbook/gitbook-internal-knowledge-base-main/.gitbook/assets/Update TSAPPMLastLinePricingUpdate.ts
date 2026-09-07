/*
* Key: b81ac836-8098-4013-b78a-122cae2116a6
* Name: Update TSAPPMLastLinePricingUpdate
* Description: Update TSAPPMLastLinePricingUpdate
* Created: 20.01.2025, 16:10:22
* Last Modified: 20.01.2025, 16:10:22
*/

// This script:
// 1. updates a line TSA with the current time, in order to trigger a TSAPPIItemPromotionTrigger field.
//
// This code is called from the events, after pricing is calculated.
//
// Script parameters:
//  * transactionUUID - string

export async function main(context: any): Promise<string> {
    const startTime = new Date().getTime();
    const transactionUUID = context.transactionUUID;
    const transactionLineUUID = context.transactionLineUUID;

    const transaction = await pepperi.DataObject.Get('transactions', transactionUUID);
    const isOrderEditable = await isEditableTransaction(transaction);
    if (!isOrderEditable) {
        console.log('transaction is not editable');
        return '';
    }

    const currtime = new Date().getTime().toString();
    const promisesArr = [updateLine(transactionLineUUID, { TSAPPMLastLinePricingUpdate: currtime })];

    await Promise.all(promisesArr);

    const endTime = new Date().getTime();
    console.log(`Updating TSAPPMLastLinePricingUpdate took ${endTime - startTime}ms`);

    return '';
}

async function updateLine(transactionLineUUID: string, objForUpdate: object) {
    const t1 = new Date().getTime();
    await pepperi.app.transactionLines.update({ objects: [{ UUID: transactionLineUUID, ...objForUpdate }] });
    console.log(`Line update took ${new Date().getTime() - t1}ms`);
}

async function isEditableTransaction(order: any): Promise<boolean> {
    let isEditable = true;
    const transitions = await order.availableTransitions();
    if (transitions.length == 0) {
        const inTransition = await order.inTransition();
        isEditable = inTransition;
    }
    return isEditable;
}
