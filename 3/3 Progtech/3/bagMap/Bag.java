/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bagMap;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author bli
 */
public class Bag {

    private HashMap<String, Integer> data;

    public Bag() {
        data = new HashMap<>();
    }

    public void add(String item, int count) {
        if (count <= 0) {
            throw new IllegalArgumentException();
        }
        if (!data.containsKey(item)) {
            data.put(item, count);
        } else {
            data.put(item, data.get(item) + count);
        }
    }

    public boolean contains(String item) {
        return data.containsKey(item);
    }

    public Integer remove(String item) {
        return data.remove(item);
    }

    public boolean remove(String item, int count) {
        if (!data.containsKey(item)) {
            return false;
        }
        int left = data.get(item) - count;
        if (left > 0) {
            data.put(item, left);
        } else {
            data.remove(item);
        }
        return true;
    }

    public int howMany(String item) {
        Integer count = data.get(item);
        return count != null ? count : 0;
    }

    public boolean isEmpty() {
        return data.isEmpty();
    }

    public void clear() {
        data.clear();
    }

    public Bag union(Bag bag) {
        Bag result = new Bag();
        for (Map.Entry<String, Integer> entry : bag.data.entrySet()) {
            result.add(entry.getKey(), entry.getValue());
        }
        for (Map.Entry<String, Integer> entry : this.data.entrySet()) {
            result.add(entry.getKey(), entry.getValue());
        }
        return result;
    }

    // Implement intersection and difference here
    
    @Override
    public String toString() {
        return "Bag{" + "data=" + data + '}';
    }
}
