package exercice2.etape2;

import org.aspectj.lang.ProceedingJoinPoint;

import org.aspectj.lang.annotation.*;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.DeclareParents;
import org.aspectj.lang.annotation.Pointcut;

import exercice2.etape1.*;

@Aspect
public class AClientOrder {
	@DeclareParents(
			value="Client",
			defaultImpl=ClientImpl.class)
	private ClientItf client;
	
	@DeclareParents(
			value="Order",
			defaultImpl=OrderImpl.class)
	private OrderItf order;
	
	
	@Pointcut("call(public void Client.addOrder(Order))")
	void addOrderAdvice() {}
	
	@Before("addOrderAdvice()")
	public void trace() {
		System.out.println("hello");
	}
}
