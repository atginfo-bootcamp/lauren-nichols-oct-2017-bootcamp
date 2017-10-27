//to invoke in dev console Day3ListsAndLoops.execute();

public with sharing class Day3ListsAndLoops {

	public static void execute(){

		//Create string variable called myName
		String myName = 'Lauren';

		//Create new empty list called 'names'
		// THIS IS THE PREFERRED WAY TO INITIALIZE
		List<String> names = new List<String>();

		//Create new list with default values
		List<String> students = new List<String>{'Student 1', 'Student 2'};

		//Alternate syntax for creating a new array (list) with 20 empty indexes
		String[] employees = new String[20];

		names.add(myName);
		names.add('Joe');
		names.add('Jack');
		names.add('James');

		System.debug('Names here: ' + names);

		names.remove(3);// remove item at index 3, which is James

		System.debug('Removed names: ' + names);

		//dynamically remove last element in array
		names.remove(names.size() -1 );

		System.debug('Names after removing names.size(): ' + names);

		Set<String> uniqueNames = new Set<String>();

		uniqueNames.add(myName);
		uniqueNames.add(myName);
		uniqueNames.add(myName);
		uniqueNames.add(myName);

		//store the number of items in our set
		Integer uniqueNameSize = uniqueNames.size();

		System.debug('uniqueNames: ' + uniqueNames);
		System.debug('uniqueNameSize: ' + uniqueNameSize);

	}



	public static void executeLoops(){


		//for loop takes three parameters
		//indexVariable
		//condition
		//counterVariable
		for(Integer i = 0; i < 10; i ++){
			System.debug(i);

		}

		List<String> names = new List<String>();

		names.add('lauren1');
		names.add('lauren2');
		names.add('lauren3');
		names.add('lauren4');

		for(Integer i = 0; i < names.size(); i ++){
			System.debug(names.get(i));
		}

		for(Integer i = 0; i < names.size(); i ++){
			System.debug(names[i]);
		}

		//Advanced for loop - loop every item in the list - only works for lists
		//less code, cleaner
		for(String name : names ){
			System.debug(name);
		}

	}


	public static void createNewAccount(){

		Account myAccount = new Account();

		myAccount.Name = 'Advanced Technology Group';
		myAccount.Type = 'Prospect';

		System.debug('myAccount before insert: ' + myAccount);

		//Database Manipulation Language (DML) making actions on a database
		//insert, update, undelete, delete (CRUD)
		insert myAccount;


		System.debug('myAccount after insert: ' + myAccount);

	}



	public static void updateExistingAccount(){

		//Query in APEX
		List<Account> queriedAccounts = [
			SELECT Id, Name, Type 
			FROM Account 
			WHERE Name = 'Advanced Technology Group' 
			LIMIT 1
		];

		System.debug(queriedAccounts);

		if(queriedAccounts.size() > 0){
			Account myAccount = queriedAccounts[0];

			myAccount.Name = 'Amazon';

			update myAccount;

		}

	}

	public static void updateAccountTypeOnEveryAccount(){

		//Query all accounts
		List<Account> queriedAccounts = [
			SELECT Id, Name, Type 
			FROM Account
		];

		//Print out all acocunts to the console
		System.debug(queriedAccounts);

		//Loop through accounts
		for(Account currAccount :  queriedAccounts){
			//Update Type = 'Other'
			currAccount.Type = 'Other';

			//Print out the account to the console
			System.debug('queriedAccounts: ' + currAccount);
		}

		//Update Accounts (DML)
		update queriedAccounts;
		
	}

}