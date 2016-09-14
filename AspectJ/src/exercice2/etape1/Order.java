package exercice2.etape1;

public class Order {
	private int id;
	private double amount;
	
	public Order(int id, double amount) {
		this.id = id;
		this.amount = amount;
	}
	
	public int getId() {
		return this.id;
	}
	
	public double getAmount() {
		return this.amount;
	}
	
	public void printOrder(){
		System.out.print("id : " + id + "; amount : " + amount + ";");
	}
}
