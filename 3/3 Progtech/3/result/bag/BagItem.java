/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bag;

import java.util.Objects;

/**
 *
 * @author bli
 */
class BagItem extends Object {

    private final String item;
    private int count;

    public BagItem(String Item, int count) {
        this.item = Item;
        this.count = count;
    }
    
    public void increaseCount(int count) {
        this.count += count;
    }

    public String getItem() {
        return item;
    }
    
    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
    
    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null) {
            return false;
        }
        if (!(o instanceof BagItem)) {
            return false;
        }
        BagItem bi = (BagItem) o;
        return Objects.equals(this.item, bi.item) && Objects.equals(this.count, bi.count);
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 53 * hash + Objects.hashCode(this.item);
        hash = 53 * hash + this.count;
        return hash;
    }

    @Override
    public String toString() {
        return item + "=" + count;
    }    
}
