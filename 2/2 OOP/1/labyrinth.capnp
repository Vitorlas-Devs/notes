@0xf186e83e19dc0eec;

interface Labyrinth {
  struct Labyrinth {
    x @0 :UInt16;
    y @1 :UInt16;

    content @2 :Content;
    dir @3 :Direction;
  }

  new @0 (map :List(List(Content))) -> (lab :Labyrinth);
  collect @1 (x :UInt16, y :UInt16);
  whatisthere @2 (x :UInt16, y :UInt16, dir :Direction) -> (content :Content);
}

enum Content {
  empty @0;
  wall @1;
  treasure @2;
  ghost @3;
}

enum Direction {
  up @0;
  down @1;
  left @2;
  right @3;
}
