package singleton;

import java.util.HashMap;
import java.util.Map;

import exercice2.etape1.*;

public aspect ASingleton {
	
	private Map<Class<?>, Object> singletons = new HashMap<Class<?>, Object>();
	
	pointcut newSingleton():
		call(public Clients.new(..)) ||
		call(public Orders.new(..));
	
	
	Object around(): newSingleton() {
		
		System.out.println("ASingleton : exécution de new de Clients ou Orders");
		
		Class<?> singletonClass = thisJoinPoint.getSignature().getDeclaringType();
		Object singletonObject = this.singletons.get(singletonClass);		
		
		if(singletonObject == null) {
			singletonObject = proceed();
			this.singletons.put(singletonClass, singletonObject);
		}
		
		
		return singletonObject;
		
	}
}
