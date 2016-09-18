package diagramme;

import exercice2.etape1.*;

public aspect Diagramme {
	pointcut newClients():
		call(public Clients.new(..));
	
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
	
	
	after(): newClients() {
		System.out.println("  |----new---->|             |             |             | ");
	}
	
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
	
	
}
