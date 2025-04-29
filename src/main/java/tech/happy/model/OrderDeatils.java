package tech.happy.model;

public class OrderDeatils {
	private String name;
	private int price;
	private String meal;
	private int quantity;
	
	public OrderDeatils(String name, int price, String meal, int quantity) {
		super();
		this.name = name;
		this.price = price;
		this.meal = meal;
		this.quantity = quantity;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getMeal() {
		return meal;
	}

	public void setMeal(String meal) {
		this.meal = meal;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
}
