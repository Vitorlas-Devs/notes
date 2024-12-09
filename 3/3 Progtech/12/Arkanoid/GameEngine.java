/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Arkanoid;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Logger;
import javax.swing.AbstractAction;
import javax.swing.ImageIcon;
import javax.swing.JPanel;
import javax.swing.KeyStroke;
import javax.swing.Timer;

import java.io.File;
import java.io.IOException;
import javax.swing.ImageIcon;

/**
 *
 * @author bli
 */
public class GameEngine extends JPanel {

  private final int FPS = 240;
  private final int PADDLE_Y = 550;
  private final int PADDLE_WIDTH = 100;
  private final int PADDLE_HEIGHT = 20;
  private final int PADDLE_MOVEMENT = 2;
  private final int BALL_RADIUS = 20;

  private boolean paused = false;
  private Image background;
  private int levelNum = 0;
  private Level level;
  private Ball ball;
  private Paddle paddle;
  private Timer newFrameTimer;

  public GameEngine() {
    super();

    System.out.println("Working Directory = " + System.getProperty("user.dir"));
    System.out.println("Trying to load background from: " + new File("data/images/background.jpg").getAbsolutePath());

    File bgFile = new File("data/images/background.jpg");
    if (!bgFile.exists()) {
      System.err.println("ERROR: Cannot find background image at: " + bgFile.getAbsolutePath());
    }

    background = new ImageIcon("data/images/background.jpg").getImage();
    this.getInputMap().put(KeyStroke.getKeyStroke("LEFT"), "pressed left");
    this.getActionMap().put("pressed left", new AbstractAction() {
      @Override
      public void actionPerformed(ActionEvent ae) {
        paddle.setVelx(-PADDLE_MOVEMENT);
      }
    });
    this.getInputMap().put(KeyStroke.getKeyStroke("RIGHT"), "pressed right");
    this.getActionMap().put("pressed right", new AbstractAction() {
      @Override
      public void actionPerformed(ActionEvent ae) {
        paddle.setVelx(PADDLE_MOVEMENT);
      }
    });
    this.getInputMap().put(KeyStroke.getKeyStroke("DOWN"), "pressed down");
    this.getActionMap().put("pressed down", new AbstractAction() {
      @Override
      public void actionPerformed(ActionEvent ae) {
        paddle.setVelx(0);
      }
    });
    this.getInputMap().put(KeyStroke.getKeyStroke("ESCAPE"), "escape");
    this.getActionMap().put("escape", new AbstractAction() {
      @Override
      public void actionPerformed(ActionEvent ae) {
        paused = !paused;
      }
    });
    restart();
    newFrameTimer = new Timer(1000 / FPS, new NewFrameListener());
    newFrameTimer.start();
  }

  public void restart() {
    try {
      String levelPath = "data/levels/level0" + levelNum + ".txt";
      File levelFile = new File(levelPath);
      System.out.println("Trying to load level from: " + levelFile.getAbsolutePath());
      if (!levelFile.exists()) {
        System.err.println("ERROR: Cannot find level file at: " + levelFile.getAbsolutePath());
      }
      level = new Level(levelPath);
    } catch (IOException ex) {
      System.err.println("Failed to load level: " + ex.getMessage());
      ex.printStackTrace();
      // Create an empty level instead of crashing
      level = new Level();
    }
    Image paddleImage = new ImageIcon("data/images/paddle.png").getImage();
    paddle = new Paddle(350, PADDLE_Y, PADDLE_WIDTH, PADDLE_HEIGHT, paddleImage);
    Image ballImage = new ImageIcon("data/images/ball.png").getImage();
    ball = new Ball(400, 300, BALL_RADIUS, BALL_RADIUS, ballImage);
  }

  @Override
  protected void paintComponent(Graphics grphcs) {
    super.paintComponent(grphcs);
    grphcs.drawImage(background, 0, 0, 800, 600, null);
    level.draw(grphcs);
    paddle.draw(grphcs);
    ball.draw(grphcs);
  }

  class NewFrameListener implements ActionListener {

    @Override
    public void actionPerformed(ActionEvent ae) {
      if (!paused) {
        ball.moveX();
        if (level.collides(ball)) {
          ball.invertVelX();
        }
        if (!ball.moveY()) {
          levelNum = 0;
          restart();
        }
        if (level.collides(ball)) {
          ball.invertVelY();
        }
        if (paddle.collides(ball)) {
          ball.invertVelY();
        }
        paddle.move();
      }
      if (level.isOver()) {
        levelNum = (levelNum + 1) % 2;
        restart();
      }
      repaint();
    }

  }
}
