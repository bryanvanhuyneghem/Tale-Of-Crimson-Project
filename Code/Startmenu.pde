class Startmenu {
  PImage startmenu;
  PImage mute;
  PImage unmute;
  boolean mute0;
  boolean hoverMenu;
  boolean isRepeating1 = false;

  Startmenu() {
    startmenu = loadImage("startscreen.png");
    unmute = loadImage("music_play.png");
    mute = loadImage("music_mute.png");
    song3.pause();
  }

  // Mute of unmute de soundtrack
  void mute() {
    if (!mute0) {
      image(unmute, 1144, 680);
      isRepeating1 = true;
    } else {
      image(mute, 1144, 680);
      song1.pause();
    }
  }

  // Controleer waar de speler klikt en doe iets
  void keyCheck() {

    if (mouseX > 1143 && mouseX < 1230 && mouseY > 683 && mouseY < 770) {
      mute0 = !mute0;
    }
    if (mouseX > 125 && mouseX < 292 && mouseY > 187 && mouseY < 233) {
      kamer = 29;
    }
    if (mouseX > 123 && mouseX < 420 && mouseY > 347 && mouseY < 398) {
      link("http://www.ataleofcrimson.com/Manual.html");
    }
    if (mouseX > 120 && mouseX < 209 && mouseY > 494 && mouseY < 536) {
      exit();
    }
  }

  // Check het hoveren van de muis van de speler
  void hoverMenu() {
    cursor(cursor1, 5, 5);
    textFont(font1);
    fill(138, 7, 7);
    if (mouseX > 125 && mouseX < 292 && mouseY > 187 && mouseY < 233) {
      text("Start game", 130, 224);
    } else if (mouseX > 123 && mouseX < 420 && mouseY > 347 && mouseY < 398) {
      text("Miniguide (website)", 130, 380);
    } else if (mouseX > 120 && mouseX < 209 && mouseY > 494 && mouseY < 536) {
      text("Quit", 130, 526);
    }
    fill(255);
  }

  // Teken het menu
  void menu() {
    background(startmenu);
    fill(255);
    textFont(font1);
    text("Start game", 130, 224);
    text("Miniguide (website)", 130, 380);
    text("Quit", 130, 526);
    hoverMenu();
    mute();
    if (isRepeating1 && !mute0)
    {
      if (!song1.isPlaying())
      {
        song1.rewind();
        song1.play();
      }
      if (!song1.isPlaying()) 
      {
        song1.play();
      }
    }
  }
}