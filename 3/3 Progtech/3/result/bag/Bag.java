/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bag;

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

    public Bag intersection(Bag bag) {
        Bag result = new Bag();
        for (BagItem otherBi : bag.data) {
            for (BagItem ownBi : data) {
                if (otherBi.getItem().equals(ownBi.getItem())) {
                    result.add(otherBi.getItem(), Math.min(otherBi.getCount(), ownBi.getCount()));
                }
            }
        }
        return result;
    }
    
    public Bag difference(Bag bag) {
        Bag result = new Bag();
        for (BagItem bi : data) {
            result.add(bi.getItem(), bi.getCount());
        }
        for (BagItem bi : bag.data) {
            result.remove(bi.getItem(), bi.getCount());
        }
        return result;
    }
        
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


