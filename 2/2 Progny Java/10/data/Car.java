package data;

public class Car implements Vehicle {
  public final String brand;
  protected final String color;
  protected final int weight;

  public Car(String b, String c, int w) {
    brand = b;
    color = c;
    weight = w;
  }

  @Override
  public int getWeight() {
    return weight;
  }

  @Override
  public String getBrand() {
    return brand;
  }

  @Override
  public String getColor() {
    return color;
  }

  @Override
  public String toString() {
    return "Brand: %s\tColor: %s\tWeight: %d".formatted(brand, color, weight);
  }
}
