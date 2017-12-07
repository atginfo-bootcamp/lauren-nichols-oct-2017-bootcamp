public with sharing class AnimalGod {

	public static void handlesAnimals() {

		Dog myDog = new Dog();
		Fish myFish = new Fish();

		doAnimalStuff(myDog, 'Bones');
		doAnimalStuff(myFish, 'Fish Flakes');

	}

	private static void doAnimalStuff(Animals animal, String typeOfFood){
		animal.speak();
		animal.eat(typeOfFood);
	}
}