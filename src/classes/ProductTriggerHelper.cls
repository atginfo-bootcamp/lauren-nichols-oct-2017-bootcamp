public with sharing class ProductTriggerHelper {
	

	public static void handleAfterUpdate(List<Product2> products, Map<Id, Product2> oldProductMap){
		checkIfNameChanged(products, oldProductMap);
		trackIfProductChanged(products, oldProductMap);
	}


	private static void checkIfNameChanged(List<Product2> products, Map<Id, Product2> oldProductMap){
		//Loop products
		//Determine if name changed, if so print to console.

		List<String> trackChanges = new List<String> {'Name', 'ProductCode', 'isActive', 'fakeField'};
		List<Product2> changedProducts = (List<Product2>) Utils.checkForChangedFields(products, oldProductMap, trackChanges);
		for(Product2 product : products){
				System.debug('Product Name Changed!' + product);
		}

		List<Product2> changedProductsWithExpectedProductFamily = (List<Product2>) Utils.checkForChangedFields(products, oldProductMap, 'Family', 'Special');
		for(Product2 product : products){
				System.debug('Product Family Changed!' + product);
		}
	}

	public static void trackIfProductChanged(List<Product2> products, Map<Id, Product2> oldProductMap){

		List<Product2> changedProducts = (List<Product2>) Utils.checkForChangedFields(products, oldProductMap, Constants.TRACK_PRODUCT_CHANGES);

		List<Product_Changes__c> productChanges = new List<Product_Changes__c>();

		for(Product2 product : changedProducts){

			System.debug('Product Changed: ' + product);

			Product_Changes__c productChange = new Product_Changes__c();

			productChange.Product__c = product.Id;
			productChange.Date_Changed__c = Datetime.now();
			productChange.User__c = product.LastModifiedById;

			productChanges.add(productChange);
		}

		insert productChanges;

	}

	//This is the old version before moving to the generic SObject: 
	//private static void checkIfNameChanged(List<Product2> products, Map<Id, Product2> oldProductMap){
	//	//Loop products
	//	//Dtermine if name changed, if so print to console.

	//	for(Product2 product : products){
	//		Product2 oldProduct = oldProductMap.get(product.Id);
	//		if(product.Name != oldProduct.Name){
	//			System.debug('Name changed!' + product);
	//		}
	//	}
	//}



}