package rpgame;

public abstract class Character {
  String name;
  int health;
  int attack;
  boolean alive;
  
  public Character(String name, int health, int attack) {
    this.name = name;
    this.health = health;
    this.attack = attack;
    this.alive = true;
  }
  
  public void attack(Character opponent) {
    if (opponent instanceof Berserk) {
      opponent.health -= attack * 2;
      return;
    }
    else if (opponent instanceof Protector) {
      opponent.health -= attack * 0.5;
      return;
    }
    else if (opponent instanceof BlackDragon) {
      if (attack < 20) {
        return;
      }
    }
    else if (opponent instanceof RedDragon) {
      if (attack < 60) {
        return;
      }
    }
    else if (opponent instanceof MainCharacter) {
      opponent.health -= attack / ((MainCharacter) opponent).armor;
    }
    
    opponent.health -= attack;

    if (opponent.health < 0) {
      opponent.alive = false;
    }
  }

  @Override
  public String toString() {
    return String.format("%s: %d HP, %d ATK - %s", name, health, attack, alive ? "ALIVE" : "DEAD");
  }
}
