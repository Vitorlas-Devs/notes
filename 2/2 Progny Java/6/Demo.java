public class Demo {
  public static void main(String[] args) {
    int[] ints = new int[]{1, 2, 3, 4, 5, 6};
    Foo f = new Foo(ints);

    f.printArray();

    ints[2] = 123;

    f.printArray();

    f.getArray()[4] = 987;

    f.printArray();
  }
}
