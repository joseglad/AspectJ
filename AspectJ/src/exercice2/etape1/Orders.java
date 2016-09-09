package exercice2.etape1;

import java.util.LinkedList;
import java.util.List;

public class Orders {
	private List<Order> orders;
	
	public Orders() {
		this.orders = new LinkedList<Order>();
	}
	
	public void addOrder(Order o) {
		this.orders.add(o);
	}
	
	public void detOrder(Order o) {
		this.orders.remove(o);
	}
	
	public int getNumberOfOrders(){
		return this.orders.size();
	}
}