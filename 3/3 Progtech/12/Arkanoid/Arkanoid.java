/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Arkanoid;

import com.formdev.flatlaf.FlatLightLaf;
import javax.swing.UIManager;

/**
 *
 * @author bli
 */
public class Arkanoid {

  /**
   * @param args the command line arguments
   */
  public static void main(String[] args) {
    try {
      UIManager.setLookAndFeel(new FlatLightLaf());
    } catch (Exception e) {
      System.err.println("Failed to initialize FlatLaf");
    }
    
    ArkanoidGUI gui = new ArkanoidGUI();
  }

}
