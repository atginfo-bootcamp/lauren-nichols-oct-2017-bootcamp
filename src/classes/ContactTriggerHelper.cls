public with sharing class ContactTriggerHelper {

	public static void handleAFterInsert(List<Contact> contacts){
		// if contact has an account assigned, update number of contacts on account
		//List<Account> accounts = queryAccountsFromContacts(contacts);

		updateAccountNumOfContacts(queryAccountsFromContacts(contacts));

	}

	private static List<Account> queryAccountsFromContacts(List<Contact> contacts){

		//Initialize Set variable;
		Set<Id> accountIds = new Set<Id>();

		//Loop through list of contacts
		for(Contact contact : contacts){
			//If the acount ID on the contact is not null, progress
			if(contact.accountId != null){
				//append the account ID on the contact to the array of account ID's
				accountIds.add(contact.accountId);
			}
		}

		//then take the unique array set of account ID's and pass it into the queryAccounts() function;
		return queryAccounts(accountIds);

	}

	private static List<Account> queryAccounts(Set<Id> accountIds){

		//Initialze a new List variable, called accounts;
		List<Account> accounts = new List<Account>();


		//If the accountIds array set is not empty progress 
		if(!accountIds.isEmpty()){
			//Query the Accounts, with a sub-query on the Contact and return array/list of accounts with the Contact ID
			accounts = [SELECT Id, Current_Number_of_Contacts__c,
				(SELECT Id FROM Contacts) 
			FROM Account 
			WHERE Id IN :accountIds];
		}

		//Return our list of accounts with the Contact ID associated
		return accounts;

	}

	private static void updateAccountNumOfContacts(List<Account> accounts){

			//If the list of accounts with the Contact ID is greater than 0 progress
			if(accounts.size() > 0){

				//Loop through our list of accounts
				for(Account account : accounts){
					//Initialize new Int variable which equals the number of contacts on the account
					Integer numberOfContacts = account.Contacts.size();
					//Then, I want the custom field Current_Number_of_Contacts__c on the account to reflect the number of contacts
					account.Current_Number_of_Contacts__c = numberOfContacts;
				}

			//DML call to the database to update the accounts after contacts have been added to the DB
			update accounts;
		}
	}

	public static void handleAfterUpdate(List<Contact> contacts, Map<Id, Contact> oldContactMap){
		// loop through old contacts
		// check if accountId was changed
			// 1) null --> not null: update account (number of contacts)
			// 2) not null --> null: update the old account (number of contacts)
			// 3) not null --> not null (contact assigned to different account): update both accounts 

			Set<Id> accountIds = new Set<Id>();

			for(Contact contact : contacts){
				Contact oldContact = oldContactMap.get(contact.Id);
				if(contact.AccountId != oldContact.AccountId){
					// the account id was changed!

					if(contact.AccountId != null){
						accountIds.add(contact.AccountId);
					}

					if(oldContact.AccountId != null){
						accountIds.add(oldContact.AccountId);
					}

				}
			}

			List<Account> accounts = queryAccounts(accountIds);

			updateAccountNumOfContacts(accounts);
			
	}

	public static void handleAfterDelete(List<Contact> contacts){

	}

	








}