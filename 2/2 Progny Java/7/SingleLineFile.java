import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class SingleLineFile {
  public static void main(String[] args) {
    System.out.println("Sum = " + addNumbers(args[0]));
  }

  public static int addNumbers(String fileName) {
    int sum = 0;

    try (BufferedReader br = new BufferedReader(new FileReader(fileName))) {
      String line = br.readLine();

      if (line == null)
        throw new IllegalArgumentException("Empty file");

      String[] nums = line.split(" ");

      for (String n : nums) {
        try {
          sum += Integer.parseInt(n);
        } catch (NumberFormatException e) {
          System.err.println("NaN detected: " + n);
        }
      }
    } catch (IOException e) {
      System.err.println(e.getMessage());
    }

    return sum;
  }
}
