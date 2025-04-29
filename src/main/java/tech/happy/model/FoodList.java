package tech.happy.model;

public class FoodList {
	private String foodName;
	private int price;
	private String mealTime;
	
	public FoodList(String foodName, int price, String mealTime) {
		super();
		this.foodName = foodName;
		this.price = price;
		this.mealTime = mealTime;
	}

	public String getFoodName() {
		return foodName;
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getMealTime() {
		return mealTime;
	}

	public void setMealTime(String mealTime) {
		this.mealTime = mealTime;
	}
	
	
}
