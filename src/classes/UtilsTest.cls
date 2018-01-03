@isTest
private class UtilsTest {
	
	@isTest static void checkForChangedFields() {

		List<Account> accounts = new List<Account>{
			new Account(Id = '0011I00000CFe2m', Name = 'Test Name'),
			new Account(Id = '0011I00000CFe23', Name = 'Test Name')
		};

		Map<Id, Account> oldAccountMap = new Map<Id, Account>{ '0011I00000CFe2m' => new Account(Id = '0011I00000CFe2m', Name = 'Test Name Changed'),
			'0011I00000CFe23' => new Account(Id = '0011I00000CFe23', Name = 'Test Name')

		};

		String fieldsToCheck = 'Name';

		List<SObject> changedRecords = Utils.checkForChangedFields( accounts, oldAccountMap, fieldsToCheck);

		//assert size
		System.assertEquals(1, changedRecords.size());
		//assert that the 1 record that is returned == the first account we made (dummy account)
		System.assertEquals(accounts[0], changedRecords[0]);
	}

	@isTest static void checkForChangedFieldsTestException() {

		List<Account> accounts = new List<Account>{
			new Account(Id = '0011I00000CFe2m', Name = 'Test Name', Type = 'Other'),
			new Account(Id = '0011I00000CFe23', Name = 'Test Name', Type = 'External')
		};

		Map<Id, Account> oldAccountMap = new Map<Id, Account>{ 
			'0011I00000CFe2m' => new Account(Id = '0011I00000CFe2m', Name = 'Test Name Changed', Type = 'Prospect'),
			'0011I00000CFe23' => new Account(Id = '0011I00000CFe23', Name = 'Test Name', Type = 'Prospect')

		};

		List<String> fieldsToCheck = new List<String>{'Name', 'I dont exist', 'Type'};

		List<SObject> changedRecords = Utils.checkForChangedFields( accounts, oldAccountMap, fieldsToCheck);

		//assert size
		System.assertEquals(2, changedRecords.size());
		//assert that the 1 record that is returned == the first account we made (dummy account)
		System.assertEquals(accounts[0], changedRecords[0]);
	}	
	
}