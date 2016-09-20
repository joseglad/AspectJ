package exercice2.etape1;

public class Main {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		System.out.println("Main: Initialisation");
		System.out.println("Main        Clients        Orders        Client         Order");
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
		
		System.out.println("Main: #Clients: Est-ce que les références sont les mêmes ?");
		System.out.println("Main: " + clients);
		System.out.println("Main: " + clients2);
		System.out.println("Main: #Clients: Est-ce que c'est le même objet ?");
		System.out.println("Main: " + clients.getClient(0));
		System.out.println("Main: " + clients2.getClient(0));
		
		System.out.println("Main: #Orders: Est-ce que les références sont les mêmes ?");
		System.out.println("Main: " + orders);
		System.out.println("Main: " + orders2);
		
		/*
		System.out.println("Main: #Orders: Est-ce que c'est le même objet ?");
		System.out.println("Main: " + orders.getOrders(0).getId());
		System.out.println("Main: " + orders2.getOrders(0).getId());
		*/
		
		//System.out.println("Main: #Hedi prend la commande order1 :");
		hedi.addOrder(orders.getOrders(0));
		
		//System.out.println("Main: #Affichage de la commande order1 :");
		//orders.getOrders(0).printOrder(); 
		//System.out.println(" " + orders.getOrders(0).getClient());
		
		
		//System.out.println("Main: #On essaye de supprimer Hedi");
		try {
			clients.delClient(hedi);
		} catch(ClientHasOrderException e) {
			//System.out.println("Main: L'exception ClientHasOrderException a été levée");
		}
		
		
		hedi.delOrder(orders.getOrders(0));
		//System.out.println("Main: #On supprime la dernière commande de Hedi");
		try {
			clients.delClient(hedi);
			//System.out.println("Main: La suppression de Hedi dans la liste de clients a été faite avec succès");
		} catch(ClientHasOrderException e) {
			//System.out.println("Main: L'exception ClientHasOrderException a été levée");
		}
		
		

	}

}
