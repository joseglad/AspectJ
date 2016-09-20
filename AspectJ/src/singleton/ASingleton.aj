package singleton;

import java.util.HashMap;
import java.util.Map;

public aspect ASingleton {
	
	private Map<Class<?>, Object> singletons = new HashMap<Class<?>, Object>();
	
	pointcut newSingleton():
		call(public singleton.Singleton+.new(..));
	
	
	Object around(): newSingleton() {
		Class<?> singletonClass = thisJoinPoint.getSignature().getDeclaringType();
		Object singletonObject = this.singletons.get(singletonClass);		
		
		if(singletonObject == null) {
				singletonObject = proceed();
				this.singletons.put(singletonClass, singletonObject);
		}
		return singletonObject;		
	}
}
