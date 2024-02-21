public class Circle {
  double x;
  double y;
  double r;

  public Circle(double x, double y, double r) {
    this.x = x;
    this.y = y;
    this.r = r;
  }

  public void enlarge(double f) {
    this.r *= f;
  }

  public double getArea() {
    return this.r * this.r * Math.PI;
  }

  @Override
  public String toString() {
    return "(" + this.x + ", " + this.y + ")" + " - " + this.r;
  }

  public static void main(String[] args) {
    Circle c = new Circle(0, 0, 2);
    
    System.out.println("area = " + c.getArea());
    c.enlarge(2);

    System.out.println("scale by 2 = " + c);
    System.out.println("area = " + c.getArea());
  }
}
