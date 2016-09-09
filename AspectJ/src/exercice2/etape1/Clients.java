package exercice2.etape1;

import java.util.LinkedList;
import java.util.List;

public class Clients {
	private List<Client> clients;
	
	public Clients() {
		this.clients = new LinkedList<Client>();
	}
	
	public void addClient(Client c){
		this.clients.add(c);
	}
	
	public void delClient(Client c){
		if( !c.hasOrder()) this.clients.remove(c);
		else System.out.println("Attention, " + c + " a une ou plusieurs commandes, on ne peut donc pas le supprimer!");
	}

}