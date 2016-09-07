package exercice2.etape2;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class AClientOrder {
	
	@Pointcut("call(public void exercice2.etape1.Client.addOrder(Order))")
	void toBeTraced() {
		
	}
}
