public class PointMain {
  public static void main(String[] args) {
    Point p = new Point();
    p.x = 5;
    p.y = 7;

    System.out.println("x: " + p.x + "\ty: " + p.y);

    Point p2 = new Point(3, 4);
    p2.move(1, 1);

    System.out.println("x: " + p2.x + "\ty: " + p2.y);

    Point p3 = new Point(5, 6)
        .mirror(0, 0)
        .mirror(0, 0);

    System.out.println("x: " + p3.x + "\ty: " + p3.y);

    System.out.println("p1 <--> p2: " + p.distance(p2));
  }
}
