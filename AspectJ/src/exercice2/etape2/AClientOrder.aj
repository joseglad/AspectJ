package exercice2.etape2;

import java.util.LinkedList;
import java.util.List;

import exercice2.etape1.Client;
import exercice2.etape1.Order;

public aspect AClientOrder {
	private List<Order> Client.orders;
	private Client Order.client;
	
	public void Client.addOrder(Order o) {
		o.setClient(this);
		orders.add(o);
	}
	
	public void Order.setClient(Client c) {
		client = c;
	}
	
	public Client Order.getClient() {
		return client;
	}
	
	/*
	pointcut addOrderPC(Order order):
		call( public void Client.addOrder(Order)) && args(order);
	
	after(Order order): addOrderPC(order) {
		System.out.println("AClientOrder: #Ajout du client dans l'order");
		Client client = (Client) thisJoinPoint.getThis();
		order.setClient(client);
	}
	*/
	
	
	after() : initialization(Client.new(..)) {
		Client client = (Client) thisJoinPoint.getTarget();
		client.orders = new LinkedList<Order>();
	}
	
	
}
