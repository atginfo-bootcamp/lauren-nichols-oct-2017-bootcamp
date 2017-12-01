public with sharing class AccountListControllerExt {

	private final Account account;
    public list<Product2> products;
    // The extension constructor initializes the private member
    // variable mysObject by using the getRecord method from the standard
    // controller.
    public AccountListControllerExt(ApexPages.StandardController stdController) {
        this.account = (Account) stdController.getRecord();

        products = [SELECT Id, Name, ProductCode, Family FROM Product2];
    }
    public list<Product2> getProducts() {
        return products;
    }

}