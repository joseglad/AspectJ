package exercice2.etape2;

import exercice2.etape1.Order;
import exercice2.etape1.Orders;

public class ClientImpl implements ClientItf{
	private Orders orders;
	
	@Override
	public void addOrder(Order o){
		this.orders.addOrder(o);
	}
	
	@Override
	public boolean hasOrder(){
		return this.orders.getNumberOfOrders() > 0;
	}
	
	@Override
	public void delOrder(Order o){
		this.orders.delOrder(o);
	}
}