public with sharing class Day15DynamicSOQL {

	/**
	* This methid is a dynamic query for products
	* @param whereClause [description]
	*
	*/
	public static List<Product2> queryProducts(String whereClause) {
		String query ='SELECT ID, Name, ProductCode, Family FROM Product2';
		if(whereClause != null) {
			query += ' WHERE ' + whereClause;
		}

		List<Product2> products = (List<Product2>) Database.query(query);
		System.debug('products: ' + products);
		return products;
	}

}