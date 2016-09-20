package exercice1;
import org.aspectj.lang.reflect.MethodSignature;


public aspect ATrace {
	pointcut toBeTraced():
		call( public void B.print(String) ) ||
		execution( public void B.print(String));
	
	before(): toBeTraced() {
		System.out.println("--");
		System.out.println("before toBeTraced");
		System.out.println("Source : " + thisJoinPoint.getThis());
		System.out.println("Cible : " + thisJoinPoint.getTarget());
		MethodSignature method = (MethodSignature) thisJoinPoint.getSignature();
		System.out.println("Nom de la méthode : " + method.getName());
		Object[] objects = thisJoinPoint.getArgs();
		System.out.print("Paramètres : ");
		for(int i = 0; i < objects.length; i++) {
			System.out.print(objects[i] + "; ");
		}
		System.out.println();
		System.out.println("--");
		
	}
}
