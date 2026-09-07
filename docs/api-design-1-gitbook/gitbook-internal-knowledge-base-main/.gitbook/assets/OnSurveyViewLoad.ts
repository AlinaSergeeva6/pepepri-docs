/**
 * Parameters:
 * surveyView, object
 */

export async function main(data) {
    const surveyView: SurveyView = data.surveyView;

    // get the survey object so we'll have the account uuid
    const surveyResource = 'MySurveys';
    const survey = (await getSurvey(surveyResource, surveyView.SurveyKey)).Objects[0];

    const accountUUID = survey.Account;
    const currentAccountType = 'Test';

    // go over the sections->questions and implement custom logic if needed
    for (const section of surveyView.Sections) {
        for (const question of section.Questions) {
            if (question.ShowIfResult) {
                const additionalFields = question.AdditionalFields; // custom defined fields in OnSurveyBuilderLoad
                // implement custom logic
                if (additionalFields?.AccountType && currentAccountType !== additionalFields?.AccountType) {
                    question.Hide = true; // hide the question if needed
                }
            }
        }
    }

    return {
        SurveyView: surveyView,
    };
}

async function getSurvey(resource: string, key: string) {
    const res = await pepperi.resources.resource(resource).search({
        Fields: ['Key', 'StatusName', 'Account', 'Creator'],
        Where: `Key='${key}'`,
    });
    return res as any;
}

export interface ActiveDateRange {
    From: string;
    To: string;
}

export interface Question {
    Key: string;
    Title: string;
    Description: string;
    Type: string;
    Mandatory: boolean;
    Value: string;
    ShowIfResult: boolean;
    Hide: boolean;
    AdditionalFields: any;
}

export interface Section {
    Key: string;
    Title: string;
    Description: string;
    Questions: Question[];
}

export interface SurveyView {
    Key: string;
    SurveyKey: string;
    Name: string;
    Description: string;
    Active: boolean;
    ActiveDateRange: ActiveDateRange;
    Sections: Section[];
    Status: string;
}

export interface ChangedFields {
    FieldID: string; // The survey property name
    NewValue: string; // The changed value
    OldValue: string; // The old value
}

export interface Data {
    SurveyView: SurveyView; // The survey property name
    ChangedFields: ChangedFields;
}
