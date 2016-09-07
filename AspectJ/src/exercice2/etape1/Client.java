package exercice2.etape1;

public class Client {
	private String name;
	private String address;
	private Orders orders;
	
	public Client(String name, String address){
		this.name = name;
		this.address = address;
		this.orders = new Orders();
	}
	
	public void addOrder(Order o){
		o.setClient(this);
		this.orders.addOrder(o);
	}
	
	public boolean hasOrder(){
		return this.orders.getNumberOfOrders() > 0;
	}
	
	public void delOrder(Order o){
		o.setClient(null);
		this.orders.detOrder(o);
	}
	
	public String toString(){
		return this.name;
	}
}
