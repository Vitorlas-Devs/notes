import util.*;

public class Main {
  public static void main(String[] args) {
    Pair<String> s = new Pair<>("a", "n");
    Pair<Integer> i = new Pair<>(1, 2);

    Pair<Pair<Double>> d = new Pair<>(new Pair<>(1.0, 3.3), new Pair<>(1.2, 4.3));

    System.out.println(s);
    System.out.println(i);
    System.out.println(d);
    System.out.println(d.getFirst());
  }
}
