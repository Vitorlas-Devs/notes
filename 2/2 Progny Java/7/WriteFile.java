import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;

public class WriteFile {
  public static void main(String[] args) throws IOException {
    try (
        BufferedReader br = new BufferedReader(new FileReader(args[0]));
        PrintWriter pw = new PrintWriter(args[1]);) {
      String line;
      while ((line = br.readLine()) != null) {
        System.out.println(line);
        pw.println(line);
      }
    } catch (IOException e) {
      System.err.println(e.getMessage());
    }
  }
}
