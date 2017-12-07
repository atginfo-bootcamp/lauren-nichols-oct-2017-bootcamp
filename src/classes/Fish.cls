public with sharing class Fish implements Animals {
	
	public Fish() {
		
	}

	public void speak(){
		System.debug('The fish goes gurgle');		
	}

	public void eat(String typeOfFood){
		System.debug('The fish loves ' + typeOfFood);
	}

	public void die(){
		System.debug('The fish dies......');
	}

}