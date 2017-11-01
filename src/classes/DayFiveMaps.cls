public with sharing class DayFiveMaps {
	//dictionaries: key:value pair


	//public: visibility modifier
	//static: don't have to create a new instance 
	//void: not returning anything - return type  

	public static void example(String name){

		List<String> namesList = new List<String>(); 

		namesList.add('Lauren');
		namesList.add('John');
		namesList.add('Sarah');
		namesList.add('Seth');
		namesList.add('Mark');

		// Keep track if name is found
		Boolean foundName = false;

		for(String eachName : namesList){
			if(eachName == name){
				System.debug( 'Found name in list: ' + name );
				foundName = true; 
				break; //this exists out of the loop when name is found
			}
		}

		// If foundName is false
		if(!foundName){
			System.debug('Name not found: ' + name);
		}


		Map<String, String> namesMap = new Map<String, String>();

		namesMap.put('Lauren', 'Lauren Marie');
		namesMap.put('John', 'John Smith');
		namesMap.put('Sarah', 'Sarah Scott');
		namesMap.put('Seth', 'Seth Man');
		namesMap.put('Mark', 'Mark Bark');

		if(namesMap.containsKey(name)){
			System.debug( 'Found name in list: ' + name );
		} else {
			System.debug( 'Name not found in list: ' + name );
		}
	}


	public static void associateContactsToAccounts(){

		// Alternate Syntax here: (if you do not need to store the Account query)
		// Map<Id, Account> accountMap = new Map<Id, Account>([SELECT Id, Name FROM Account]);


		List<Account> accountList = [SELECT Id, Name FROM Account];
		Map<Id, Account> accountMap = new Map<Id, Account>(accountList);


		List<Contact> contactList = [SELECT Id, Name, FirstName, LastName, AccountId FROM Contact];

		//loop through contacts
		//print out the name of the contact and the account name
		Account accountName = new Account();

		//for(Contact currentContact : contactList){
		//	//System.debug('Current contact name: ' + currentContact.Name);

		//	if(accountMap.containsKey('Id') && accountMap.get('Id') == currentContact.AccountId){
		//		accountName = accountMap.get('Name');
		//		System.debug('Current account name: ' + accountName);
		//	}
		//}
	
	
	} 



}