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
	
	public Client getClient(int index){
		return this.clients.get(index);
	}
	
	public void delClient(Client c) throws ClientHasOrderException {
		this.clients.remove(c);
	}
}
