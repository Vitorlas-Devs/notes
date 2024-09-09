package rental;

public class Car {
  private String brand;
  private String licensePlate;
  private double price;

  private static final double MAX_PRICE = 500.0;
  private static final Car CAR_OF_THE_YEAR = new Car(
      "Alfa Romeo",
      "ABC 123",
      MAX_PRICE);

  private Car(String b, String lp, double p) {
    brand = b;
    licensePlate = lp;
    price = p;
  }

  public double getPrice() {
    return price;
  }

  public boolean isCheaperThan(Car other) {
    return price < other.price;
  }

  public void decreasePrice() {
    if (price != MAX_PRICE && price > 10)
      price -= 10;
  }

  public static Car make(String b, String lp, double p) {
    if (b.length() <= 2)
      return null;

    if (!b.matches("[a-zA-Z ]+"))
      return null;

    if (!isValidLicensePlate(lp))
      return null;

    if (p <= 0 || p > MAX_PRICE)
      return null;

    return new Car(b, lp, p);
  }

  private static boolean isValidLicensePlate(String lp) {
    if (lp.length() != 7)
      return false;

    for (int i = 0; i < 3; i++) {
      if (!Character.isUpperCase(lp.charAt(i))) {
        return false;
      }
    }

    if (lp.charAt(3) != ' ')
      return false;

    for (int i = 4; i < 7; i++) {
      if (!Character.isDigit(lp.charAt(i))) {
        return false;
      }
    }

    return true;
  }

  @Override
  public String toString() {
    return String.format("%s (%s) %5.1f EUR", brand, licensePlate, price).replace('.', ',');
  }
}
