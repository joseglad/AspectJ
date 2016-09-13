package exercice2.etape1;

public class Main {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		System.out.println("Initialisation");
		Clients clients = new Clients();
		Client jose = new Client("José", "Roubaix");
		Client hedi = new Client("Hedi", "Lille");
		clients.addClient(jose);
		clients.addClient(hedi);
		Order order1 = new Order(1, 2016);
		Order order2 = new Order(2, 7);
		
		System.out.println("Hedi prend la commande order1 :");
		hedi.addOrder(order1);
		order1.printOrder();
		order2.printOrder();
		System.out.println("José prend la commande order2 :");
		jose.addOrder(order2);
		order1.printOrder();
		order2.printOrder();
		
		System.out.println("On essaye de supprimer Hedi :");
		clients.delClient(hedi);
		

	}

}
