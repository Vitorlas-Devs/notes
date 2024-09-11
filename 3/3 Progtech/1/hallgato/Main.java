package hallgato;

import java.util.ArrayList;
import java.util.List;

public class Main {
  ArrayList<Hallgato> hallgatók = new ArrayList<>(
    List.of(
      new Hallgato("Béla", 30, "magyar", new double[] { 1.0, 2.0, 3.0 })),
      new Hallgato("Bartók", 25, "magyar", new double[] { 1.0, 2.0, 3.0 }))
    )
  );

  Hallgato bestHallgato = Hallgato.best(hallgatók);
}
