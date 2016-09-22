package diagramme;

import exercice2.etape1.*;

public class DiagramMain {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		System.out.println("Diagramme d'échange de messages\n");
		Clients clients = new Clients();
		Clients clients2 = new Clients();
		Client jose = new Client("José", "Roubaix");
		Client hedi = new Client("Hedi", "Lille");
		Orders orders = new Orders();
		Orders orders2 = new Orders();
		Order order1 = new Order(1, 2016);
		Order order2 = new Order(2, 7);
		
		clients.addClient(jose);
		clients.addClient(hedi);
		orders.addOrder(order1);
		orders.addOrder(order2);
		
		hedi.addOrder(orders.getOrders(0));
		
		try {
			clients.delClient(hedi);
		} catch(ClientHasOrderException e) {
			//System.out.println("Main: L'exception ClientHasOrderException a été levée");
		}
		
		
		hedi.delOrder(orders.getOrders(0));
		
		try {
			clients.delClient(hedi);
			//System.out.println("Main: La suppression de Hedi dans la liste de clients a été faite avec succès");
		} catch(ClientHasOrderException e) {
			//System.out.println("Main: L'exception ClientHasOrderException a été levée");
		}		

	}

}
