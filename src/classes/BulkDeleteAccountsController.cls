public with sharing class BulkDeleteAccountsController {

	public List<AccountWrapper> accountWrappers {get; set;} 
	public Boolean selectAll {get; set;} 
	public String inputAccountName {get; set;}
	public Integer inputNumOfAccounts {get; set;}

	public BulkDeleteAccountsController() {
		initializeAccountWrappers();
		this.selectAll = false;
		
	}

	public void initializeAccountWrappers(){
		List<Account> accounts = [SELECT Id, Name, Type FROM Account];

		accountWrappers = new List<AccountWrapper>();

		for (Account account : accounts){

			AccountWrapper accountWrapper = new AccountWrapper(account);

			accountWrappers.add(accountWrapper);
		}	
	}

	public List<Account> createNewAccounts(Integer inputNumOfAccounts, String inputAccountName){
		List<Account> accountsToCreate = new List<Account>();
		

		Integer counter = 0;

		for(Integer i = 0; i < inputNumOfAccounts; i ++){
			Account account = new Account(Name = inputAccountName + '-' + counter);
			accountsToCreate.add(account);
		}

		insert accountsToCreate;


		return null;
	}

	public PageReference submitAccounts(){
		createNewAccounts(inputNumOfAccounts, inputAccountName);

		initializeAccountWrappers();
		return null;

	}

	public PageReference toggleSelectAll(){
		for(AccountWrapper accountWrapper : accountWrappers){
			accountWrapper.isChecked = selectAll;
		}

		return null;
	}

	public PageReference deleteSelectedAccounts(){
		List<Account> accountsToDelete = new List<Account>();


		for(AccountWrapper accountWrapper : accountWrappers){

			if(accountWrapper.isChecked){
				accountsToDelete.add(accountWrapper.account);

			}
		}

		try {

			delete accountsToDelete;

		} catch(Exception e){
			System.debug(e);
			ApexPages.addMessages(e);
		}

		initializeAccountWrappers();

		return null;
	}

	//This is an 'Inner Class' - a class within a class, very common in VP
	public class AccountWrapper{

		public Boolean isChecked {get; set;}
		public Account account {get; set;}

		//Constructor AccountWrapper within the Inner Class
		public AccountWrapper(Account account){

			this.isChecked = false;
			this.account = account;



		}

	}



}