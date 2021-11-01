// Dit pauzeert de game

class Pausemenu {
  PImage pauseBackground;
  Pausemenu() {
    pauseBackground = loadImage("pyres_pause.png");
  }
  void pauseMenu() {
    background(pauseBackground);
    fill(138, 7, 7);
    textAlign(CENTER);
    textFont(font1);
    text("Game paused", 640, 400);
    textAlign(BASELINE);
    timerPause = true;
  }
}