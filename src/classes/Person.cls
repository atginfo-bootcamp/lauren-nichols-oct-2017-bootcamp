/*
* Person class
* A class is made up for the following three elements: 
* 1. class level properties
* 2. constructor method (anything New -- new instance)
* 3. all other methods
*
*/

//Static Method: 

//Private - accessable from inside the class
//Public - accessable from outside the class
//Protected - inheritance, child can access from parent
//Constructor - initialization method, create a new instance of, using the 'new' keyword
	//method signature - parameter data types that are being passed in
	//method overloading - two methods with the same name & same number of parameters as long as the parameter data types aren't the same
//this - referes to the INSTANCE of a class
public class Person {
	//Instance variable: 
	//Static variable are shared between all instances
	private static Boolean isHuman = true;
	
	//Class level properties: 
	private String name;
	private String email;
	private String gender;
	private Double weight;
	private Integer age;
	private final Boolean IS_DEAD;


	public Person(String defaultName) {
		name = defaultName;
		//alternate syntax
		//this.name = defaultname;

		IS_DEAD = false;
	}


	//This is an overloaded constructor: 
	//To call this: 
	//	Person fred = new Person('Fred', 'foo@bar.com');
	//Why would this be used: optional perameters
	public Person(String defaultName, String defaultEmail) {
		name = defaultName;
		email = defaultEmail;

		IS_DEAD = false;
	}

	public Person(String defaultName, String defaultEmail, Boolean defaultIsDead) {
		name = defaultName;
		email = defaultEmail;
		IS_DEAD = defaultIsDead;
	}



	public void print(){
		System.debug('Person name:' + name);
		System.debug('Person email:' + email);
		System.debug('Person gender:' + gender);
		System.debug('Person weight:' + weight);
		System.debug('Person age:' + age);
		System.debug('Person isDead:' + IS_DEAD);
		System.debug('Person isHuman:' + isHuman);
	}



	//Getter method here: 
	public String getName(){
		return name;
	}

	//Setter method here: 
	public void setName(String name){
		this.name = name;
	}

	//Getter method here: 
	public String getEmail(){
		return email;
	}

	//Setter method here:
	public void setEmail(String email){
		this.email = email;
	}

	//Getter method here: 
	public String getGender(){
		return gender;
	}

	//Setter method here: 
	public void setGender(String gender){
		this.gender = gender;
	}

	//Getter method here: 
	public Double getWeight(){
		return weight;
	}

	//Setter method here: 
	public void setWeight(Double weight){
		this.weight = weight;
	}

	//Getter method here:
	public Integer getAge(){
		return age;
	}

	//Setter method here: 
	public void setAge(Integer age){
		this.age = age;
	}


	//Setter method below:
	public void setIsHuman(Boolean isHumanVal){
		isHuman = isHumanVal;
	}


}