@isTest
private class ContactTriggerHelperTests {

	//This test class is going to verify that our contact trigger helper is not faulty

	private static void stageData(Integer numAccounts, String accountName){

		//Create new accounts based on numAccounts parameter
		//Set up Account fields (i.e. accountName)
		//Need to commit accounts to the DB

		//Query our newly created accounts from the DB
		//Loop through accounts
		//Create contacts for each account (AccountId populated)

		//Commit contacts to DB - Insert all contacts into the DB at once

		List<Account> accounts = new List<Account>();

		for(Integer i = 0; i < numAccounts; i ++){

			Account acct = new Account();

			acct.Name = accountName + ' ' + i;
			accounts.add(acct);
		
		}

		insert accounts;

		//Loop through all the newly created test accounts and store them in a list;
		List<Account> testAccountsDB = [SELECT Id FROM Account WHERE Name LIKE :accountName];

		List<Contact> contactsList = new List<Contact>();

		for(Account currentAccount : testAccountsDB){

			Integer numberOfContacts = (Integer)(Math.random()*4);

			for(Integer i = 0; i < numberOfContacts; i ++){

				Contact contact = new Contact();

				contact.LastName = 'Test Boidly';
				contact.AccountId = currentAccount.Id;
				contactsList.add(contact);
			}

		}

		insert contactsList;
	}	


	@isTest static void test_method_one() {
		// Implement test code
		stageData(10, 'Lotus Flowers');

		List<Account> accountList = [
			SELECT Name, Current_Number_of_Contacts__c, 
				(SELECT LastName, AccountId FROM Contacts) 
			FROM Account
		];

		System.assert(accountList.size() == 10);

	}
	
	@isTest static void test_method_two() {
		// Implement test code


	}
	
}