public with sharing class LocationManagement {



	public static void createLocationAndEmployess(){
		//Business__c missoulaLocation = createLocation('Missoula', '216 W Main Street\nMissoula, MT 59801', '406-205-4899');
		////DML call to the database
		//insert missoulaLocation;

		//List<Employee__c> employees = new List<Employee__c>();

		//employees.add(createEmployee(missoulaLocation, 'Lauren', 'Nichols', 'Active', 'Executive'));
		//employees.add(createEmployee(missoulaLocation, 'Jackie', 'Nichols', 'Active', 'Executive'));

		////DML call to the database
		//insert employees;

		Business__c bozemanLocation = createLocation('Bozeman', '216 W Main Street\nBozeman, MT 59713', '406-205-4899');
		//DML call to the database
		insert bozemanLocation;

		List<Employee__c> employees = new List<Employee__c>();

		employees.add(createEmployee(bozemanLocation, 'John', 'Wise', 'Active', 'Executive'));
		employees.add(createEmployee(bozemanLocation, 'Joan', 'Little', 'Active', 'Executive'));

		//DML call to the database
		insert employees;

	}


	public static void queryAndLogData(){
		List<Employee__c> employeesByLocationId = getEmployeesForLocation('a001I0000048yic');
		System.debug('employeesByLocationId: ' + employeesByLocationId);

		List<Employee__c> employeesByLocationName = getEmployeesByLocationName('Missoula');
		System.debug('employeesByLocationName: ' + employeesByLocationName);

		Business__c locationWithEmpoloyees = getLocationAndEmployees('a001I0000048yic');
		System.debug('locationWithEmpoloyees: ' + locationWithEmpoloyees);
		System.debug('locationWithEmpoloyees - subquery: ' + locationWithEmpoloyees.Employees__r);

	}


	//Method overloading: two functions that are the 'same' but with varying method signatures/parameters
	public static Business__c createLocation(String name, String address, String phoneNumber){
		return createLocation('Advanced Technology Group', name, address, phoneNumber);
	}
	
	//Static methods: called at the class level, not at the instance level (ie. LocationManagement.createLocation(); NOT Missoula.createLocation();)
	public static Business__c createLocation(String businessName, String name, String address, String phoneNumber){

		Business__c location = new Business__c(
			Business_Name__c = businessName,
			Address__c = address,
			Name = name, 
			Phone_Number__c = phoneNumber
			);
		

		return location;
	}




	public static Employee__c createEmployee(Business__c location, String firstName, String lastName, String status, String title){

		Employee__c employee = new Employee__c(
			First_Name__c = firstName,
			Last_Name__c = lastName,
			Status__c = status,
			Title__c = title,
			Business_Location__c = location.Id,
			Hire_Date__c = Date.today(),
			Status_Date__c = Datetime.now()
			);


		return employee;
	}



	public static List<Employee__c> getEmployeesForLocation(Id locationId){

		List<Employee__c> employees = [
			SELECT id, Name, Business_Location__c, First_Name__c, Last_Name__c, Status__c, Title__c, Status_Date__c, Hire_Date__c
			FROM Employee__c
			WHERE Business_Location__c = :locationId
		];

		return employees;
	}



	public static List<Employee__c> getEmployeesByLocationName(String locationName){

		List<Employee__c> employees = [
			SELECT id, Name, Business_Location__c, First_Name__c, Last_Name__c, Status__c, Title__c, Status_Date__c, Hire_Date__c
			FROM Employee__c
			WHERE Business_Location__r.Name = :locationName
		];

		return employees;
	}



	public static Business__c getLocationAndEmployees(Id locationId){

		Business__c location = [
			SELECT Business_Name__c, Address__c, Name, Phone_Number__c,

				(SELECT id, Name, Business_Location__c, First_Name__c, Last_Name__c, Status__c, Title__c, Status_Date__c, Hire_Date__c
				FROM Employees__r)

			FROM Business__c
			WHERE Id = :locationId
		];

		return location;
	}



	public static List<Employee__c> getEmployeeByEmployeeId(String employeeId){

		List<Employee__c> employees = [
			SELECT id, Name, Business_Location__c, First_Name__c, Last_Name__c, Status__c, Title__c, Status_Date__c, Hire_Date__c
			FROM Employee__c
			WHERE Name = :employeeId
		];

		return employees;
	}


	public static Employee__c transferEmployeeLocation(String employeeId, Id targetLocationId){

		List<Employee__c> foundEmployees = getEmployeeByEmployeeId(employeeId);

		if(foundEmployees.size() != 0){
			Employee__c employee = foundEmployees[0];
			employee.Business_Location__c = targetLocationId;

			update employee;

			return employee;
		}

		return null;
	}


	public static void updateStatusDateOnStatusChange(List<Employee__c> employees, Map<Id, Employee__c> oldEmployeeMap){

		for(Employee__c employee : employees){
			Employee__c oldEmployee = oldEmployeeMap.get(employee.Id);

			if(employee.Status__c != oldEmployee.Status__c){
				employee.Status_Date__c = Datetime.now();
			}
		}
	}

}