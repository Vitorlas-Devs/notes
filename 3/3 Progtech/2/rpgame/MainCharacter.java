package rpgame;

public class MainCharacter extends Character {
  double armor;
  
  public MainCharacter(String name, int health, int attack, double armor) {
    super(name, health, attack);
    this.armor = armor;
  }
}
