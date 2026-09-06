package model;

public class CartItem {

    // Stores the selected food item.
    private Food food;

    // Stores how many times the food item was added to the cart.
    private int quantity;

    // Default constructor.
    public CartItem() {
    }

    // Constructor to create a cart item with food and quantity.
    public CartItem(Food food, int quantity) {
        this.food = food;
        this.quantity = quantity;
    }

    // Returns the selected food item.
    public Food getFood() {
        return food;
    }

    // Sets the selected food item.
    public void setFood(Food food) {
        this.food = food;
    }

    // Returns the quantity of the food item.
    public int getQuantity() {
        return quantity;
    }

    // Sets the quantity of the food item.
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    // Calculates the total price for this cart item.
    public double getTotalPrice() {
        return food.getPrice() * quantity;
    }
}