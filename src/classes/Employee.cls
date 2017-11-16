public with sharing class Employee {

    private static Integer nextEmployeeIdNumber = 1;

    private final Integer employeeId;//users not allowed to set this, we will configure it

    //These will need to be passed into the constructor
    private String title;
    private String firstName;
    private String lastName;

    //This are being set below
    private Date hireDate;
    private String status;
    private Datetime statusDate;

    public Employee(String title, String firstName, String lastName) {
        //IMPLEMENT THIS
     
        this.employeeId = nextEmployeeIdNumber;

        this.title = title;
        this.firstName = firstName;
        this.lastName = lastName;

        this.hireDate = Date.today();
        this.status = 'Active';
        this.statusDate = Datetime.now();

        //incrementing nextEmployeeIdNumber by one each time this constructor is called
        nextEmployeeIdNumber ++;
    }

    public Integer getEmployeeId(){
    	return employeeId;
    }

    public void printEmployeeInfo(){
    	System.debug('employeeId: ' + employeeId);
    	System.debug('title: ' + title);
    	System.debug('firstName: ' + firstName);
    	System.debug('lastName: ' + lastName);
    	System.debug('hireDate: ' + hireDate);
    	System.debug('status: ' + status);
    	System.debug('statusDate: ' + statusDate);
    }
}