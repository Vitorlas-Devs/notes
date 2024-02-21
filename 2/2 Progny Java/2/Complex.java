public class Complex {
  double r;
  double i;

  public Complex(double r, double i) {
    this.r = r;
    this.i = i;
  }

  public double abs() {
    return this.r * this.r + this.i * this.i;
  }

  public Complex add(Complex c) {
    return new Complex(this.r + c.r, this.i + c.i);
  }

  public Complex sub(Complex c) {
    return new Complex(this.r - c.r, this.i - c.i);
  }

  public Complex mul(Complex c) {
    return new Complex(
        this.r * c.r - this.i * c.i,
        this.r * c.i - this.i * c.r);
  }

  @Override
  public String toString() {
    return this.r + " + " + this.i + "i";
  }

  public static void main(String[] args) {
    Complex c1 = new Complex(3, 2);
    Complex c2 = new Complex(1, 2);

    System.out.println(c1.add(c2));
  }
}
