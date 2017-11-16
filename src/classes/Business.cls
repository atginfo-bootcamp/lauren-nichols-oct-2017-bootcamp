public with sharing class Business {
    

    private static String businessName = 'Emporium';
    private String locationName;
    private String address;
    private String phoneNumber;
   	private List<Employee> employees;


    public Business(String locationName, String address, String phoneNumber) {
        //require all fields are passed in and set all field values, except for employee

        this.locationName = locationName;
        this.address = address;
        this.phoneNumber = phoneNumber;

        this.employees = new List<Employee>();
    }

    public void printBusinessInfo(){

    	System.debug('businessName: ' + businessName);
    	System.debug('locationName: ' + locationName);
    	System.debug('address: ' + address);
    	System.debug('phoneNumber: ' + phoneNumber);
    	System.debug('employees: ' + employees);

    }

    public void addEmployee(Employee employee){

    	// Call other constructor method to keep business logic simplified
    	addEmployee(new List<Employee>{employee});
    }

    public void addEmployee(List<Employee> employees){

    	

    	this.employees.addAll(employees);
    	
    }

    public void removeEmployee(Integer employeeId){
    	//work on this last
    }

    public List<Employee> getEmployees(){

    	return null;
    }

    public Employee getEmployeeById(Integer employeeId){

    	return null;
    }

    public void printLocationInfo(){
    	//print out all location information
    }

    //WORK ON VERY LAST IF FINISHED WITH ALL OTHER WORK
    //return true if success, false if employee not found
    public static Boolean transferEmployee(Business fromLocation, Business toLocation, Integer employeeId){
    	// use the getEmployeeById() to find employee on fromLocation
    	return false;
    }
}