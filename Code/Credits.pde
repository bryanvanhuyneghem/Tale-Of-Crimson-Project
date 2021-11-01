// Speel de slotvideo af
class Credits {
  String s = "Score: ";

  Credits() {
  }

  void credits() {
    song1.pause();
    song3.pause();
    song2.pause();
    movie.play();
    image(movie, 0, 0, width, height);
    if (movie.time() >= 438.12265)
    {
      if (mouseX > 51 && mouseX < 291 && mouseY > 742 && mouseY < 777) {
        fill(138, 7, 7);
        text("Go to startmenu", 50, 772);
      } else {
        fill(255, 255, 255);
        text("Go to startmenu", 50, 772);
        song3.pause();
      }
      fill(255, 255, 255);
      textAlign(CENTER);
      text(s + room20.score + " " + difficulty.versie, 640, 150);
      textAlign(BASELINE);
    }
  }

  // Controleer of iets wordt aangeklikt en doe iets
  void keyCheck() {
    if (mouseX > 51 && mouseX < 291 && mouseY > 742 && mouseY < 777 && movie.time() >= 438.000) {
      kamer = 0;
      minutes = 00;
      seconds = 00;
      hour = 02;
      setup();
      frameCount = 0;
    }
  }
}