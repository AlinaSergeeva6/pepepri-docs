/**
 * Parameters:
 * AccountUUID, string
 * templateKey, string
 */

export async function main(data) {
    // your predefined parameters will be properties on data object
    let accountUUID: string = data.AccountUUID;
    let templateKey: string = data.templateKey;

    // Choose survey template if not supply as parameter (optional).
    if (templateKey.length === 0) {
        const templateMmodalOptions: any = {
            addonBlockName: 'ResourcePicker',
            hostObject: {
                resource: 'MySurveyTemplates',
                view: 'view-uuid', // need to change per env
                selectionMode: 'single', // multi
                selectedObjectKeys: [],
            },
            title: 'Select Survey Template',
            allowCancel: true,
        };

        const templatesResult = await client?.['showModal'](templateMmodalOptions);

        // If survey template was choosen
        if (!templatesResult.canceled && templatesResult.result.length > 0) {
            const resObject = JSON.parse(templatesResult.result);
            if (resObject?.selectedObjectKeys.length > 0) {
                templateKey = resObject.selectedObjectKeys[0];
            }
        }
    }

    // Choose account if not supply as parameter (optional).
    if (templateKey.length > 0 && accountUUID.length === 0) {
        const accountsModalOptions: any = {
            addonBlockName: 'ResourcePicker',
            hostObject: {
                resource: 'accounts',
                view: 'view-uuid', // need to change per env
                selectionMode: 'single', // multi
                selectedObjectKeys: [],
            },
            title: 'Select Account',
            allowCancel: true,
        };

        const accountsResult = await client?.['showModal'](accountsModalOptions);
        if (!accountsResult.canceled && accountsResult.result.length > 0) {
            const resObject = JSON.parse(accountsResult.result);
            if (resObject?.selectedObjectKeys.length > 0) {
                accountUUID = resObject.selectedObjectKeys[0];
            }
        }
    }
    // Create new survey
    if (templateKey.length > 0 && accountUUID.length > 0) {
        const newSurvey = {
            Template: templateKey,
            Account: accountUUID,
            StatusName: 'In Creation',
        };

        const res = await pepperi.resources.resource('MySurveys').post(newSurvey);

        // navigate to a slug and provide key as param
        await client?.navigateTo({url: 'surveys?survey_key=' + res.Key});
    } else {
        await client?.alert('Info', `Cannot create survey, ${templateKey.length === 0 ? 'template' : 'account'} is not supply.`);
    }
}
