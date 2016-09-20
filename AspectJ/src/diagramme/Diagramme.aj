package diagramme;

import java.util.HashMap;
import java.util.Map;

import exercice2.etape1.*;

public aspect Diagramme {
	//Pour garder les objets en mémoire et savoir qui appelle qui
	//un Integer pour connaitre la distance entre les != objets
	private Map<Object, Integer> actors = new HashMap<Object, Integer>();
	private int rank = -1;
	
	//Attention on peut avoir le nom de la méthode via sa signature
	pointcut news():
		call(public Clients.new(..)) ||
		call(public void Orders.addOrder(..)) ||
		call(public Orders.new(..));
	
	/*
	pointcut addClient():
		call(public void Clients.addClient(..));
	
	pointcut newOrders():
		call(public Orders.new(..));
	
	pointcut addOrder():
		call(public void Orders.addOrder(..));
	
	pointcut newClient():
		call(public Client.new(..));
	
	pointcut newOrder():
		call(public Order.new(..));
		
	*/
	
	
	after(): news() {
		Object ob = thisJoinPoint.getThis();
		if(!actors.containsKey(ob)) {
			rank++;
			actors.put(thisJoinPoint.getThis(), rank);
			System.out.println(ob.getClass().getName().toString() + "N est pas contenu");
		}
		
		int thisRank = actors.get(thisJoinPoint.getThis());
		switch(thisRank)
		{
		case 0:
			System.out.println("  |----new---->|             |             |             | ");
			break;
		default:
			;
		}
	}
	
	/*
	after(): addClient() {
		System.out.println("  |-addClient->|             |             |             | ");
	}
	
	after(): newOrders() {
		System.out.println("  |------------|-----new---->|             |             | ");
	}
	
	after(): addOrder() {
		System.out.println("  |------------|--addOrder-->|             |             | ");
	}
	
	after(): newClient() {
		System.out.println("  |------------|-------------|-----new---->|             | ");
	}
	
	after(): newOrder() {
		System.out.println("  |------------|-------------|-------------|-----new---->| ");
	}
	
	*/
}
