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
	private final String blanks	= "            ";
	private final String dashes = "------------";
	private final String arrow	= "----------->";
	private String names 		= "      ";
	
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
			if(source == null) {
				this.names += "Main ";
			} else {
				this.names += source.toString();
			}
			for(int i = 0; i < this.blanks.length() / 2; i++) {
				this.names += " ";
			}
			//System.out.println(" N est pas contenu");
		}
		if(!actors.containsKey(target)) {
			rank++;
			actors.put(target, rank);
			if(target == null) {
				this.names += "Main ";
			} else {
				this.names += target.toString() + " ";
			}
			for(int i = 0; i < this.blanks.length() / 2; i++) {
				this.names += " ";
			}
			//System.out.println(" N est pas contenu");
		}
		int sourceRank = actors.get(source);
		int targetRank = actors.get(target);
		//System.out.println(source + "(" + sourceRank +") " + target + "(" + targetRank +") ");
		
		System.out.print(this.blanks);
		for(int i = 0; i < sourceRank; i++) {
			System.out.print("|" + this.blanks);
		}
		
		for(int i = sourceRank + 1; i < targetRank; i++) {
			System.out.print("|" + this.dashes);
		}
		System.out.println("|" + this.arrow + "|");
		System.out.println(this.names);
	}
}
