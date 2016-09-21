package exercice2.etape1;

import java.util.LinkedList;
import java.util.List;

import singleton.Singleton;

public class Orders implements Singleton{
	private List<Order> orders;
	
	public Orders() {
		this.orders = new LinkedList<Order>();
	}
	
	public void addOrder(Order o) {
		this.orders.add(o);
	}
	
	public void delOrder(Order o) {
		this.orders.remove(o);
	}
	
	public int getNumberOfOrders(){
		return this.orders.size();
	}

	public Order getOrders(int index) {
		return this.orders.get(index);
	}
	
	public String toString(){
		return "Orders";
	}
}
