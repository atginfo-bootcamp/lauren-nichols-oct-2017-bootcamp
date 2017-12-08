public with sharing class BackToTheFuture {
	
	//@Future - fire and forget, handle some stuff and worry about it later
	public static void execute(){

		System.debug('We are going back to the FUTURE');

		goDoSomeWorkInTheFuture();

		System.debug('We are back from the future.....');
	}

	@Future
	public static void goDoSomeWorkInTheFuture(){

		System.debug('We are in the future!!!');
	}

}