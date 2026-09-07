export interface VisitLog {
	Resouce: string;
	Type: string;
	Title: string;
	Instance: string;
	StartTime: string;
	EndTime: string;
	Status: string;
}

export interface Step {
	Title: string;
	Resource: string;
	ResourceCreationData: string;
	BaseActivities: string[];
	Mandatory: boolean;
	Disabled: boolean;
	Completed: boolean;
	CompletedStatusName: string[];
	MaxCount: number;
	salesChannelSelector: string[];
	profileSelection: string[];
	additionalVisitData: string;
	catalogToUse: string;
}

export interface Group {
	Title: string;
	Steps: Step[];
}

export interface Visit {
	Key: string;
	Title: string;
	Groups: Group[];
	Active: boolean;
	divisionSelector: string;
}

export interface SelectedStep {
	GroupIndex: number;
	StepIndex: number;
}

export interface RootObject {
	AccountUUID: string;
	Visits: Visit[];
}

export interface ClickObject {
	AccountUUID: string;
	Visit: Visit;
	SelectedStep: SelectedStep;
}

export const VISIT_FLOW_MAIN_ACTIVITY = "VF_VisitFlowMainActivity";
export const DEBUG_ENABLED = false;

async function onVisitStepClickScript(dataObject: any) {
	debugger;

	let inputData: ClickObject = dataObject.data;
	let instance: string | undefined = undefined;

	try {
		if (
			inputData?.SelectedStep?.GroupIndex >= 0 &&
			inputData.SelectedStep.StepIndex >= 0 &&
			inputData.Visit?.Groups?.length
		) {
			const group = inputData.Visit.Groups[inputData.SelectedStep.GroupIndex];

			if (group?.Steps?.length) {
				const step = group.Steps[inputData.SelectedStep.StepIndex];
				instance = await getStepInstance(
					step,
					inputData.AccountUUID,
					inputData.Visit.Groups
				);
				if (instance) {
					step.BaseActivities.splice(0, 0, instance);
					await debug(
						"BaseActivities:\n" + JSON.stringify(step.BaseActivities)
					);
				}
			}
		} else {
			debug("error with selected step");
		}
	} catch (err: any) {
		return {};
	}
	return inputData;

	async function getStepInstance(
		step: Step,
		accountUUID: string,
		groups: Group[]
	) {
		if (
			step?.Resource === "activities" &&
			step?.ResourceCreationData === VISIT_FLOW_MAIN_ACTIVITY
		) {
			// Loop over all steps and array of object of steps
			// And save to TSAVisitLog field
			if (step?.CompletedStatusName.includes("Submitted")) {
				// Last step of the visit flow
				await createVisitLog(groups);
			}

			return null; // we dont want to create this activity. let the default implementation continue
		} else {
			return await getActivityUUID(step, accountUUID);
		}
	}

	async function getActivityUUID(step: Step, accountUUID: string) {
		let instance: any;
		let firstInstanceCompleted = true;

		try {
			debug("***** step *****:\n" + JSON.stringify(step));
			if (step.BaseActivities.length) {
				const uuid = step.BaseActivities[0];
				let instanceObj = await getActivityObject(step, uuid);
				debug("***** getActivityObject *****:\n" + JSON.stringify(instanceObj));
				firstInstanceCompleted = step.CompletedStatusName.some(
					(e) => e === instanceObj?.StatusName
				);
				debug(
					"***** firstInstanceCompleted *****:\n" +
						JSON.stringify(firstInstanceCompleted)
				);
			}

			debugger;
			if (
				(!step.MaxCount && firstInstanceCompleted) ||
				(step.MaxCount &&
					step.MaxCount > 0 &&
					step?.BaseActivities?.length < step.MaxCount &&
					firstInstanceCompleted) ||
				step.BaseActivities === undefined ||
				step.BaseActivities.length == 0
			) {
				const newResource = await createResource(step, accountUUID);
				debug("NEW RESOURCE:\n" + JSON.stringify(newResource));
				if (newResource?.id) {
					return newResource.id;
				} else {
					throw new Error(
						`Resource ${step.ResourceCreationData} was not created`
					);
				}
			} else {
				return null;
			}
		} catch (err: any) {
			throw new Error(err.message);
		}
	}

	async function createResource(step: Step, accountUUID: string) {
		let resource: any = null;
		try {
			switch (step.Resource) {
				case "activities": {
					resource = await pepperi.app.activities.add({
						type: {
							Name: step.ResourceCreationData,
						},
						references: {
							account: {
								UUID: accountUUID,
							},
						},
					});
					break;
				}
				case "transactions": {
					debug("Catalog Name: " + step.catalogToUse);
					let additional = {};
					if (step.additionalVisitData) {
						additional = { TSAVisitData: step.additionalVisitData };
					}

					resource = await pepperi.app.transactions.add({
						type: {
							Name: step.ResourceCreationData,
						},
						references: {
							account: {
								UUID: accountUUID,
							},
							catalog: {
								Name: step.catalogToUse,
							},
						},
						object: additional,
					});
					break;
				}
				default:
					const user: User = await pepperi.environment.user();
					const newSurvey = await pepperi.resources
						.resource(step.Resource)
						.post({
							Creator: user.uuid, // Add the user UUID here
							Agent: user.uuid,
							Template: step.ResourceCreationData, //templateKey
							Account: accountUUID,
							StatusName: "InCreation", //Check this with Ido & Chasky
							// how do we add the object values?
						});
					if (newSurvey?.Key) {
						resource = {
							id: newSurvey.Key,
						};
					}
					break;
			}
		} catch (err: any) {
			debug(err.message);
			throw new Error(err.message);
		}
		return resource;
	}

	async function getTransaction(key: string, fields: string[]) {
		return await pepperi.api.transactions.get({
			fields: fields,
			key: { UUID: key },
		});
	}

	async function getActivity(key: string, fields: string[]) {
		return await pepperi.api.activities.get({
			fields: fields,
			key: { UUID: key },
		});
	}

	async function getSurvey(resource: string, key: string) {
		const res = await pepperi.resources.resource(resource).search({
			Fields: ["Key", "StatusName"],
			Where: `Key='${key}'`,
		});
		return res as any;
	}

	async function createVisitLog(groups: Group[]) {
		let visitLog: VisitLog[] = [];

		for (let { Steps } of groups) {
			for (let step of Steps) {
				for (let uuid of step.BaseActivities) {
					let instanceObj = await getActivityObject(step, uuid);
					visitLog.push({
						Resouce: step.Resource,
						Type: step.ResourceCreationData,
						Title: step.Title,
						Instance: uuid,
						StartTime: instanceObj?.CreationDateTime,
						EndTime: instanceObj?.ActionDateTime,
						Status: instanceObj?.StatusName,
					});
				}
			}
		}

		let mainActivityUUID = visitLog[0].Instance;
		await pepperi.api.activities.update({
			objects: [
				{ UUID: mainActivityUUID, TSAVisitLog: JSON.stringify(visitLog) },
			],
		});
	}

	async function getActivityObject(step: Step, uuid: string) {
		let fields: string[] = ["StatusName", "CreationDateTime", "ActionDateTime"];

		let instanceObj:
			| {
					StatusName: string;
					CreationDateTime: string;
					ActionDateTime: string;
			  }
			| undefined;

		switch (step.Resource) {
			case "activities": {
				instanceObj = (await getActivity(uuid, fields)).object as any;
				break;
			}
			case "transactions": {
				instanceObj = (await getTransaction(uuid, fields)).object as any;
				break;
			}
			default:
				debugger;
				instanceObj = (await getSurvey(step.Resource, uuid)).Objects[0] as any;
				break;
		}

		return instanceObj;
	}
}

async function debug(message: string) {
	await console.log(message);
}

export async function main(data) {
	const res = await onVisitStepClickScript(data);
	return {
		Data: res,
	};
}
