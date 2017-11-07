trigger LeadTrigger on Lead (before insert,  
							 after update) 

{//When do you want your code to fire? Choose what you need based on scenario

	//One Trigger per SFDC Object

	//Boolean isInsert = Trigger.isInsert; Trigger is just a boolean "did something happen at this time? yes/no"

	//System.debug('Trigger.isInsert: ' + Trigger.isInsert);
	//System.debug('Trigger.isUpdate: ' + Trigger.isUpdate);
	//System.debug('Trigger.isDelete: ' + Trigger.isDelete);
	//System.debug('Trigger.isUndelete: ' + Trigger.isUndelete);

	//System.debug('Trigger.isAfter: ' + Trigger.isAfter);
	//System.debug('Trigger.isBefore: ' + Trigger.isBefore);



	//Records in new state being inserted to the DB, ID's created after insert (DB manages this)
	//List<Lead> leads = Trigger.new;
	//Trigger.new; 
	//Map<Id, Lead> leadMap = Trigger.newMap;
	//Trigger.newMap;


	//Records are populated with old values before update, null on inserts - needs to exsist, can't update something that doesn't exist yet
	//List<Lead> oldLeads = Trigger.old;
	//Trigger.old;
	//Map<Id, Lead> oldLeadMap = Trigger.oldMap;
	//Trigger.oldMap;

	
	// Records in new stat being insterted to the DB
	//System.debug('Trigger.new: ' + Trigger.new);
	//System.debug('Trigger.newMap: ' + Trigger.newMap);
	// Records are populated with old values before update
	//System.debug('Trigger.old: ' + Trigger.old);
	//System.debug('Trigger.oldMap: ' + Trigger.oldMap);


	//Common way to choose what code to call and when
	if(Trigger.isBefore && Trigger.isInsert){

		//call your code/classes to do stuff
		//call helper methods
		LeadTriggerHelper.beforeInsert(Trigger.new);
		

		//Change first lead title to Princess - NO DML NEEDED IN 'BEFORE' CONTEXT
		

	} else if(Trigger.isAfter && Trigger.isUpdate){
		//do stuff after update
		//call helper methods
		LeadTriggerHelper.afterUpdate(Trigger.new, Trigger.oldMap);

		//Cannot change a record 'AFTER' it is no longer mutable
		
	}

}