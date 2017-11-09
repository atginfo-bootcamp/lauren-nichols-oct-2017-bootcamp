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
	}	


	@isTest static void test_method_one() {
		// Implement test code


	}
	
	@isTest static void test_method_two() {
		// Implement test code


	}
	
}