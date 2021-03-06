package exercice2.etape2;

import java.util.LinkedList;
import java.util.List;

import exercice2.etape1.*;

public aspect AClientOrder {
	private List<Order> Client.orders;
	private Client Order.client;
	
	public void Client.addOrder(Order o) {
		o.setClient(this);
		orders.add(o);
	}
	
	public boolean Client.hasOrder(){
		return !orders.isEmpty();
	}
	
	public void Client.delOrder(Order o){
		o.setClient(null);
		orders.remove(o);
	}
	
	public void Order.setClient(Client c) {
		client = c;
	}
	
	public Client Order.getClient() {
		return client;
	}
	
	pointcut delClientPCConstraint(Client clientToDelete):
		call(public void Clients.delClient(Client)) &&
		args(clientToDelete);
	
	
	after() : initialization(Client.new(..)) {
		Client client = (Client) thisJoinPoint.getTarget();
		client.orders = new LinkedList<Order>();
	}
	
	void around(Client clientToDelete) throws ClientHasOrderException: delClientPCConstraint(clientToDelete) {
		if(clientToDelete.hasOrder()) {
			throw new ClientHasOrderException();
		}
		proceed(clientToDelete);
	}
}
