package plane.point2d;

public class Point {
  public double x;
  public double y;

  public Point() {
    x = 0;
    y = 0;
  }

  public Point(double x, double y) {
    this.x = x;
    this.y = y;
  }

  public void move(double x, double y) {
    this.x += x;
    this.y += y;
  }

  public Point mirror(double x, double y) {
    this.x += 2 * (x - this.x);
    this.y += 2 * (y - this.y);

    return this; // really bad!!!!!!!!!!!
  }

  public double distance(Point p) {
    return Math.sqrt(Math.pow(this.x - p.x, 2) + Math.pow(this.y - p.y, 2));
  }
}
