package util;

public class Pair<T> {
  private final T first;
  private final T second;

  public Pair(T f, T s) {
    first = f;
    second = s;
  }

  public T getFirst() {
    return first;
  }

  public T getSecond() {
    return second;
  }

  @Override
  public String toString() {
    return "(" + first + ", " + second + ")";
  }
}
