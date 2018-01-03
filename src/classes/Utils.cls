public without sharing class Utils {
	//Becky wants to know if productCode or isActive was changed also
	public static List<SObject> checkForChangedFields(List<SObject> newRecords, Map<Id, SObject> oldRecordMap, String field){
		
		return checkForChangedFields(newRecords, oldRecordMap, new List<String>{ field });

	}


	public static List<SObject> checkForChangedFields(List<SObject> newRecords, Map<Id, SObject> oldRecordMap, List<String> fields){
		
		List<SObject> changedRecords = new List<SObject>();

		for(SObject newRecord : newRecords){
			SObject oldRecord = oldRecordMap.get((Id)newRecord.get('Id'));
			
			for(String field : fields){
				try {
					if(newRecord.get(field) != oldRecord.get(field)){
						changedRecords.add(newRecord);
						break;
					}
					
				} catch (Exception ex) {
					System.debug('Execption thrown while checking field: ' + ex.getMessage());
				}
			}
		}

		return changedRecords;
	}
}