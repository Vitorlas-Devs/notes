import plane.PublicCircle;

public class CircleMain {
  public static void main(String[] args) {
    PublicCircle pc = new PublicCircle();

    System.out.println("PublicCircle ( " + pc.center.x + ", " + pc.center.y + ") - " + pc.radius);
  }
}
