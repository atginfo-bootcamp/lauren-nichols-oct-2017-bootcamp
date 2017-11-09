@isTest
private class ApexBootCampUnitTest {
	
	@isTest static void test_method_one() {
		// Implement test code
		List<Lead> queenLeads = [SELECT Id, Title FROM Lead WHERE Title = 'Queen'];

		//System.assert() -> pass in a condition to ensure code doesn't fail
		System.assert(queenLeads != null);

		//System.assertEquals(); compares if two arguments ARE equal
		String idealTitle = 'Queen';
		for(Lead lead : queenLeads){
			System.assertEquals(lead.Title, idealTitle);
		}

		//System.assertNotEquals(); compares if two arguments are NOT equal
		String kingTitle = 'King';
		for(Lead lead : queenLeads){
			System.assertNotEquals(lead.Title, kingTitle);
		}
		
	}
	
	@isTest static void test_method_two() {
		// Implement test code
	}
	
}