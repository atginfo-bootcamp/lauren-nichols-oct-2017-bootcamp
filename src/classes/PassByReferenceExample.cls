public with sharing class PassByReferenceExample {
	
	public static void execute(){

		Account myAccount = new Account(Name = 'My Little Pony', Type = 'Other');

		System.debug('Initial value of my account: ' + myAccount);

		modifyAccount(myAccount);
		System.debug('After calling modifyAccount(): ' + myAccount);

		modifyAccountName(myAccount.Name);
		System.debug('After calling modifyAccountName(): ' + myAccount);

	}

	//This method takes an account By Reference and modified properties on it
	//Original variable will be modified
	public static void modifyAccount(Account account){

		account.Name = 'THE NAME WAS CHANGED in modifyAccount()';
		account.Type = 'Prospect';

	}

	//This method takes the account anme as a string (Primitive Data Type) and modifies it
	//This will not modify the original variable
	public static void modifyAccountName(String accountName){

		accountName = accountName + 'I CHANGED THE NAME AGAIN';
	}

}