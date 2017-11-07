public with sharing class LeadTriggerHelper {
	

	public static void beforeInsert(List<Lead> leadsList){

		//Update the Lead title field to CEO before committing to the DB
		for(Lead currentLead : leadsList){
			currentLead.Title = 'CEO';
		}

		hotLead(leadsList);

	}


	public static void afterUpdate(List<Lead> leadsList, Map<Id, Lead> oldLeadsMap){

		//Update the lead title to the lead's ID
		//for(Lead currentLead : leadsList){
		//	currentLead.Title = currentLead.Id;
		//}

		//DML call to update the list, since this is after the data has hit the DB, need to invoke again
		//update leadsList;

	}


	public static void hotLead(List<Lead> leadsList){
		//New method called hotLead in Lead trigger
		//Query all Leads with Title from prior class (I used King).
		//Add 5 more Leads to the list (not through existing King method so that they are not inserted yet)
		//Make all Leads have a Rating of 'Hot'
		//Upsert the entire list of leads
		//**Verify**
		//Remove 5 additional leads code
		//Add in check to only update when needed

		List<Lead> queenLeads = [SELECT Id, Title, Rating FROM Lead WHERE Title = 'Queen'];

		//for(Integer i = 0; i < 5; i ++){
		//	Lead newLead = new Lead();

		//	newLead.LastName = 'Nichols';
		//	newLead.Company = 'REI';
		//	newLead.Title = 'Queen';
		//	newLead.Rating = 'Hot'; 

		//	queenLeads.add(newLead);
		//}

		for(Lead currentLead : leadsList){
			if(currentLead.Title == 'Queen'){
				currentLead.Rating = 'Hot';
			}
		}


		for(Lead currentLead : queenLeads){
			currentLead.Rating = 'Hot';
		}

		upsert queenLeads;
	}


}