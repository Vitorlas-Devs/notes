package data.structure;

import java.util.HashMap;

public class MultiSet<E> {
  private HashMap<E, Integer> elemToCount;

  @SafeVarargs
  public MultiSet(E... elems) {
    elemToCount = new HashMap<>();

    for (E e : elems) {
      add(e);
    }
  }

  public int add(E e) {
    return elemToCount.put(e, elemToCount.getOrDefault(e, 0) + 1);
    
    // if (elemToCount.containsKey(e)) {
    // var m = elemToCount.get(e);
    // m++;
    // elemToCount.put(e, m);

    // return m;
    // } else {
    // elemToCount.put(e, 1);

    // return 1;
    // }
  }

  public int getCount(E e) {
    if (elemToCount.containsKey(e)) {
      return elemToCount.get(e);
    }

    return 0;
  }

  public MultiSet<E> intersect(MultiSet<E> e) {
    MultiSet<E> i = new MultiSet<>();

    if (elemToCount.containsKey(e) && e.elemToCount.containsKey(e)) {
      if (e.getCount(e) > getCount(e)) {
        
      }
    }
  }
}
