package data;

public class Van extends Car {
  protected final int length;

  public Van(String b, String c, int w, int l) {
    super(b, c, w);
    length = l;
  }

  public Van() {
    this("VW", "Black", 1380, 5000);
  }

  @Override
  public String toString() {
    return "%s\tLength: %d".formatted(super.toString(), length);
  }
}
