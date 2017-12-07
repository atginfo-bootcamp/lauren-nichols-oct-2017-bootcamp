public with sharing class Dog implements Animals{
	
	public Dog(){

	}

	public void speak(){
		System.debug('The goes woof');		
	}

	public void eat(String typeOfFood){
		System.debug('The dog loves ' + typeOfFood);
	}
}