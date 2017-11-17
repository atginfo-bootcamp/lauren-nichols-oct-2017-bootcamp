public with sharing class Employee {

    private static Integer nextEmployeeIdNumber = 1;

    private final Integer EMPLOYEE_ID;//users not allowed to set this, we will configure it

    //These will need to be passed into the constructor
    //Because these are private, this is why we need getter/setter methods to accecss them
    private String title;
    private String firstName;
    private String lastName;

    //This are being set below
    private Date hireDate;
    private String status;
    private Datetime statusDate;

    public Employee(String title, String firstName, String lastName) {
        //IMPLEMENT THIS
     
        this.EMPLOYEE_ID = nextEmployeeIdNumber;

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
    	return EMPLOYEE_ID;
    }

    public void setStatus(String status){
            this.status = status;
            statusDate = Datetime.now();
    }

    public String getStatus(){
        return status;
    }


    public void printEmployeeInfo(){
    	System.debug('EMPLOYEE_ID: ' + EMPLOYEE_ID);
    	System.debug('title: ' + title);
    	System.debug('firstName: ' + firstName);
    	System.debug('lastName: ' + lastName);
    	System.debug('hireDate: ' + hireDate);
    	System.debug('status: ' + status);
    	System.debug('statusDate: ' + statusDate);
    }
}