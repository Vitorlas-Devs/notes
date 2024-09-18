package rpgame;

public class Main {
  public static void main(String[] args) {
    // create a battle, add characters, enemies and fight them until one of them dies
    var bela = new MainCharacter("Bela", 100000, 10, 0.5);
    var warrior = new Warrior("Warrior", 100, 10);
    var berserk = new Berserk("Berserk", 100, 30);
    var protector = new Protector("Protector", 100, 5);
    var blackDragon = new BlackDragon("Black Dragon", 100, 100);
    var redDragon = new RedDragon("Red Dragon", 100, 100);
    
    bela.attack(warrior);
    warrior.attack(bela);

    // print the results
    System.out.println(bela);
    System.out.println(warrior);
  }
}
