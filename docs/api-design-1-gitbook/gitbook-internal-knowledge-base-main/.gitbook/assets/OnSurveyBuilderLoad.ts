/**
 * Parameters:
 * None
 */

export async function main(data) {
    return {
        "AdditionalFields":
        {
            'AccountType': { Type: "String", Description: "Type of account" },
            'YourCustomField': { Type: "String", Description: "field description" }
        }
    };
}