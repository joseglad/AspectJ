package diagramme;

import java.util.HashMap;
import java.util.Map;


public aspect Diagramme {
	//Pour garder les objets en mémoire et savoir qui appelle qui
	//Garder la Source et la Cible en mémoire
	//un Integer pour connaitre la distance entre les != objets
	//Faire un traceur de diagramme qui prend appuie sur le rang
	private Map<Object, Integer> actors = new HashMap<Object, Integer>();
	private int rank = -1;
	private final String blanks	= "            ";
	private final String dashes	= "------------";
	private final String arrow	= "----------->"; //Plus aura le nom de la méthode
	private final int size		= 14;
	private String names		= "";
	private int callCounter		= 0;
	
	private void checkAddition(Object object) {
		if(!this.actors.containsKey(object)) {
			String name = "";
			this.rank++;
			this.actors.put(object, rank);
			if(object == null) {
				name = "Main";
			} else {
				name = object.toString();
			}
		
			while(name.length() < this.size) {
				if((name.length() % 2) == 1) {
					name += " ";
				} else {
					name = " " + name + " ";
				}
			}
			this.names += name;
		}
	}
	
	//Attention on peut avoir le nom de la méthode via sa signature
	pointcut news():
		call(public * *.set*(..)) ||
		call(public * *.add*(..));
	
	
	before(): news() {
		Object source = thisJoinPoint.getThis();
		Object target = thisJoinPoint.getTarget();
		
		this.callCounter = (this.callCounter + 1) % 6;
		
		this.checkAddition(source);
		this.checkAddition(target);
		
		int sourceRank = actors.get(source);
		int targetRank = actors.get(target);
		
		for(int i = 0; i < this.size / 2; i++) {
			System.out.print(" ");
		}		
		for(int i = 0; i < sourceRank; i++) {
			System.out.print("|" + this.blanks);
		}
		
		for(int i = sourceRank + 1; i < targetRank; i++) {
			System.out.print("|" + this.dashes);
		}
		System.out.println("|" + this.arrow + "|");
		
		if(this.callCounter == 5) System.out.println(this.names);
	}
}
