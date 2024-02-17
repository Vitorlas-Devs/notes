public class Ops {
  public static void main(String[] args) {
    if (args.length != 2 || args[0] == null || args[1] == null)
      throw new Error("Usage: <x> <y>");

    final int x = Integer.parseInt(args[0]);
    final int y = Integer.parseInt(args[1]);

    if (y == 0)
      throw new Error("Can't divide by zero");

    System.out.println("x + y = " + (x + y));
    System.out.println("x - y = " + (x - y));
    System.out.println("x * y = " + (x * y));
    System.out.println("x / y = " + (x / y));
    System.out.println("x % y = " + (x % y));
  }
}
