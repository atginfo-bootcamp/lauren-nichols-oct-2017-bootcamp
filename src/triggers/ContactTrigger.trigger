trigger ContactTrigger on Contact (after insert, after update, after delete) {


	if(Trigger.isAfter && Trigger.isInsert){

		ContactTriggerHelper.handleAFterInsert(Trigger.new);
	
	} else if(Trigger.isAfter && Trigger.isUpdate){

		ContactTriggerHelper.handleAfterUpdate(Trigger.new, Trigger.oldMap);

	} else if(Trigger.isAfter && Trigger.isDelete){

		ContactTriggerHelper.handleAfterDelete(Trigger.old);

	}


}