public class Foo {
  final private int[] array;

  public Foo(int[] arr) {
    array = arr.clone();
  }

  public int[] getArray() {
    return array.clone();
  }

  public void printArray() {
    for (int i : getArray()) {
      System.out.println(" " + i);
    }
    System.out.println();
  }
}
