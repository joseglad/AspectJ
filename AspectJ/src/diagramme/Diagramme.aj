package diagramme;

import java.util.HashMap;
import java.util.Map;

import exercice2.etape1.*;

public aspect Diagramme {
	//Pour garder les objets en mémoire et savoir qui appelle qui
	//Garder la Source et la Cible en mémoire
	//un Integer pour connaitre la distance entre les != objets
	//Faire un traceur de diagramme qui prend appuie sur le rang
	private Map<Object, Integer> actors = new HashMap<Object, Integer>();
	private int rank = -1;
	private final String dashes = "------------";
	
	//Attention on peut avoir le nom de la méthode via sa signature
	pointcut news():
		call(public * *.set*(..)) ||
		call(public * *.add*(..));
	
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
	
	
	before(): news() {
		Object source = thisJoinPoint.getThis();
		Object target = thisJoinPoint.getTarget();
		if(!actors.containsKey(source)) {
			rank++;
			actors.put(source, rank);
			System.out.println(" N est pas contenu");
		}
		if(!actors.containsKey(target)) {
			rank++;
			actors.put(target, rank);
			System.out.println(" N est pas contenu");
		}
		int sourceRank = actors.get(source);
		int targetRank = actors.get(target);
		System.out.println(source + "(" + sourceRank +") " + target + "(" + targetRank +") ");
		
		
		switch(sourceRank)
		{
		case 0:
			System.out.println("  |----new---->|             |             |             | ");
			break;
		case 1:
			System.out.println("  |----neW---->|             |             |             | ");
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
