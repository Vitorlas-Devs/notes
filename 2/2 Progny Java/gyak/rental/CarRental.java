package rental;

import java.util.*;
import java.io.*;

public class CarRental {
  private ArrayList<Car> cars;

  public CarRental(String filename) {
    cars = new ArrayList<>();

    File file = new File(filename);

    if (!file.exists())
      return;

    try {
      Scanner sc = new Scanner(file);

      while (sc.hasNextLine()) {
        try {
          String line = sc.nextLine();
          System.out.println(line);
          String brand = line.split(":")[0];
          String licensePlate = line.split(":")[1].split(",")[0];
          double price = Double.parseDouble(line.split(",")[1]);

          Car car = Car.make(brand, licensePlate, price);

          if (car != null)
            cars.add(car);
        } catch (Exception e) {
          continue;
        }
      }

      sc.close();
    } catch (Exception e) {
    }
  }

  public int numberOfCars() {
    return cars.size();
  }

  public void insertionSort() {

  }

  public double weightedAverage() {
    return 0;
  }

  public Car rentCheapest() {
    return null;
  }

  public ArrayList<Car> sale() {
    return null;
  }

  @Override
  public String toString() {
    String out = "";

    for (Car c : cars) {
      out += c.toString() + "\n";
    }

    return out;
  }
}
