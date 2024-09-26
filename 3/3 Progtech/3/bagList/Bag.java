/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bagList;

import java.util.ArrayList;

// {a, a, b, b, b, b, c}
// [(a, 2), (b, 4), (c, 1)]

/**
 *
 * @author bli
 */
public class Bag {

  private final ArrayList<BagItem> data;

  public Bag() {
    this.data = new ArrayList<>();
  }

  public void add(String item, int count) {
    if (count <= 0) {
      throw new IllegalArgumentException();
    }
    BagItem bi = getItem(item);
    if (bi == null) {
      data.add(new BagItem(item, count));
    } else {
      bi.increaseCount(count);
    }
  }

  public boolean contains(String item) {
    BagItem bi = getItem(item);
    return (bi != null);
  }

  public Integer remove(String item) {
    BagItem bi = getItem(item);
    if (bi != null) {
      data.remove(bi);
      return bi.getCount();
    }
    return null;
  }

  public boolean remove(String item, int count) {
    if (count <= 0) {
      throw new IllegalArgumentException();
    }
    BagItem bi = getItem(item);
    if (bi == null) {
      return false;
    }
    int left = bi.getCount() - count;
    if (left > 0) {
      bi.setCount(left);
    } else {
      remove(item);
    }
    return true;
  }

  public int howMany(String item) {
    BagItem bi = getItem(item);
    if (bi != null) {
      return bi.getCount();
    }
    return 0;
  }

  public boolean isEmpty() {
    return data.isEmpty();
  }

  public void clear() {
    data.clear();
  }

  public Bag union(Bag bag) {
    Bag result = new Bag();
    for (BagItem bi : bag.data) {
      result.add(bi.getItem(), bi.getCount());
    }
    for (BagItem bi : this.data) {
      result.add(bi.getItem(), bi.getCount());
    }
    return result;
  }

  // Implement intersection and difference here
  public Bag intersection(Bag bag) {
    Bag result = new Bag();

    for (var b1 : this.data) {
      if (bag.contains(b1.getItem())) {
        var b2 = bag.getItem(b1.getItem());
        result.add(b1.getItem(), Math.abs(b1.getCount() - b2.getCount()));
      }
    }

    return result;
  }

  public Bag difference(Bag bag) {
    Bag result = new Bag();

    // for (var b1 : this.data) {
    // if (!bag.contains(b1.getItem())) {
    // var b2 = bag.getItem(b1.getItem());
    // if (b2 != null) {
    // result.add(b1.getItem(), Math.abs(b1.getCount() - b2.getCount()));
    // }
    // else {
    // result.add(b1.getItem(), b1.getCount());
    // }
    // }

    for (BagItem bi : data) {
      result.add(bi.getItem(), bi.getCount());
    }
    for (BagItem bi : bag.data) {
      result.remove(bi.getItem(), bi.getCount());
    }

    return result;
  }

  // public Bag

  private BagItem getItem(String item) {
    for (BagItem bi : this.data) {
      if (item.equals(bi.getItem())) {
        return bi;
      }
    }
    return null;
  }

  @Override
  public String toString() {
    return "Bag{" + "data=" + data + '}';
  }
}
