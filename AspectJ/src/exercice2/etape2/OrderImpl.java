package exercice2.etape2;

import exercice2.etape1.Client;

public class OrderImpl implements OrderItf{

	private Client client;

	@Override
	public void setClient(Client c) {
		this.client = c;
		
	}

	@Override
	public Client getClient() {
		return this.client;
	}

}