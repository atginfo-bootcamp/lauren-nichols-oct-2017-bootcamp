public with sharing class Day4CreateAccountsWithContacts {
	
	public static void createAccountsAndContacts(Integer numAccounts){


		// create accounts with contacts associated to them
		// create accounts first, then contacts
		// Loop 'numAccounts' number of times to create 'numAccounts' number of accounts
		// Account name must be "myAccount-#"
		// create 2 contacts for each account
		// insert contacts
		// query accounts and subquery contacts
		// loop through accounts and contacts 
		// print out all contacts for each account and the account name
		List<Account> createdAccounts = new List<Account>();
		List<Contact> createdContacts = new List<Contact>();

		for(Integer i = 0; i < numAccounts; i ++){

			System.debug('Creating Account: ' + i);
			Account createdAccount = createAccount(i);
			createdAccounts.add(createdAccount);
			//createdAccounts.add(createdAccount(i)); //THIS IS IDENTICAL AS THE LINE ABOVE
			
		}

		insert createdAccounts;

		for(Account currAccount : createdAccounts){
			createdContacts.add(createContact(currAccount.Id, 1));
			createdContacts.add(createContact(currAccount.Id, 2));
		}
		
		insert createdContacts;

	}

	public static Account createAccount(Integer accountNameSuffix){
		
		String accountName = 'myAccount-' + accountNameSuffix;

		Account myAccount = new Account(Name = accountName);

		System.debug('My Account: ' + myAccount);

		return myAccount;
	}



	public static Contact createContact(Id accountId, Integer contactNumber){

		Contact newContact = new Contact(
			FirstName = 'Contact First Name: ' + contactNumber, 
			LastName = 'Contact Last Name: ' + contactNumber, 
			AccountId = accountId);

		System.debug('My Contact: ' + newContact);

		return newContact;
	}


	public static void queryAndPrintAccountsAndContacts(){

		List<Account> queriedAccounts = [
			SELECT Id, Name,
				(SELECT Id, FirstName, LastName, Name FROM Contacts)
			FROM Account
			WHERE Name LIKE 'myAccount%'
		];

		for(Account queriedAccount : queriedAccounts){
			System.debug('Queried Account: ' + queriedAccount.Name);

			for(Contact queriedContact : queriedAccount.Contacts){
				System.debug('Queried Contact: ' + queriedContact.Name);
			}
		}
	}

}