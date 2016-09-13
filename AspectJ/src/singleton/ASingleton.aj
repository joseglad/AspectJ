package singleton;

import exercice2.etape1.*;

public aspect ASingleton {
	private Clients clients;
	
	pointcut newClients():
		call(public Clients.new(..));
	
	pointcut execClients():
		execution(public Clients.new(..));
		
	before(): newClients() {
		System.out.println("/*");
		System.out.println("ASingleton : appel de new Clients");
		System.out.println("*/");
	}
	
	Clients around(): execClients() {
		System.out.println("/*");
		System.out.println("ASingleton : exécution de new Clients");
		if(thisJoinPoint.getThis() == null){
			//clients = (Clients) thisJoinPoint.getThis();
			
			System.out.println("ASingleton : création du singleton!");
			System.out.println("*/");
			Clients c = (Clients) proceed();
			clients = c;
			return c;
			
		}
		
		System.out.println("ASingleton : singleton déjà créé!");
		System.out.println("*/");
		return clients;
	}
}
