public with sharing class AccountAndOppCreatorController {


	public Account account {get; set;}
	public Contact contact {get; set;}
	public Opportunity oppty {get; set;}


	public AccountAndOppCreatorController() {
		account = new Account();
		contact = new Contact();
		oppty = new Opportunity();
	
	}

	public PageReference saveRecords(){

		System.debug(LoggingLevel.ERROR, 'Account here: ' + account);


		try {

			insert account;
			account.Name = '';
			account.AccountNumber = '';
			account.Description = '';
			account.Type = '';

			contact.AccountId = account.Id;
			if(contact.FirstName == '' || contact.FirstName == null || contact.LastName == '' || contact.LastName == null || contact.Salutation == '' || contact.Salutation == null){

				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Please fill in the Contact fields.'));
				return null;

			} else {

				insert contact;
				contact.FirstName = '';
				contact.LastName = '';
				contact.Salutation = '';

			}

			if( oppty.Type == '' || oppty.Type == null || oppty.StageName == '' || oppty.StageName == null || oppty.CloseDate == null){

				ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Please fill in the Opportunity fields.'));
				return null;
			} else {

				oppty.AccountId = account.Id;

				if(oppty.Name == ''){
					oppty.Name = account.Name;
				}
	
				insert oppty;
				oppty.Name = '';
				oppty.Type = '';
				oppty.StageName = '';
				oppty.CloseDate = null;
			}


			

			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Records created successfully.'));


		} catch(Exception ex){

			System.debug(LoggingLevel.ERROR, ex);
			ApexPages.addMessages(ex);
			
		}

		return null;
	}


}