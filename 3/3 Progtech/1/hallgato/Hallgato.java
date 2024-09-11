package hallgato;

import java.util.ArrayList;

// public class Hallgato {
//   String name;
//   int age;
//   String nationality;

//   /**
//    * @param n Name
//    * @param a Age
//    * @param nt Nationality
//    */
//   public Hallgato(String n, int a, String nt) {
//     name = n;
//     age = a;
//     nationality = nt;
//   }

//   public String getName() {
//     return name;
//   }

//   public void setName(String n) {
//     name = n;
//   }
// }

public record Hallgato(String name, int age, String nationality, double[] grades) {
  public static Hallgato best(ArrayList<Hallgato> hallgatók) {
    Hallgato best = hallgatók.get(0);

    for (Hallgato h : hallgatók) {
      if (sumGrades(h.grades) > sumGrades(best.grades)) {
        best = h;
      }
    }

    return best;
}

  public static double sumGrades(double[] grades) {
    double sum = 0;
    for (double g : grades) {
      sum += g;
    }
    return sum / grades.length;
  }
}
