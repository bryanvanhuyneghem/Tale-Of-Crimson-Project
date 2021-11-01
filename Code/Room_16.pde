class Room16 {
  PImage room16;
  PImage arrow;
  PImage arrow1;
  int timer1;
  int timer2;
  String loadText;
  Room16() {
    room16 = loadImage("Room 16 - Basement.jpg");
    arrow =  loadImage("ARROWDOWN.png");
    arrow1 =  loadImage("ARROWRIGHT.png");
  }
  void RoomLoad() {
    isRepeating = true;
    room16.resize(1280, 800);
    background(room16);
    fill(255);
    textAlign(CENTER);
    textFont(font1);
    text("Cleared", 1040, 50);
    textAlign(BASELINE);
    fill(138, 7, 7);

    // Toont een pijl als er gehoverd wordt op een bepaalde plaats
    if (mouseX > 111  && mouseX <166 && mouseY > 664 && mouseY < 800) {
      image (arrow, 90, 670, 420/5, 600/5);
    }
    if (mouseX > 1050  && mouseX < 1272 && mouseY > 150 && mouseY < 550 ) {
      image (arrow1, 1150, 300, 420/5, 600/5);
    }

    // Display de naam van de kamer 
    if (millis () - timer1 < 6000) {
      fill(255);
      textAlign(CENTER);
      text("Basement", 640, 50);
      textAlign(BASELINE);
      fill(138, 7, 7);
    }

    // Laat een bepaalde tekst een aantal seconden verschijnen
    if (millis() - timer2 < 5000) {
      showText();
    }

    // Toon het hintsymbool rechts boven op het scherm
    if (difficulty.hints) {
      image(hintIcon, 1201, 19);
    }

    // Laad de timer
    timer();
  }

  // Controleer of iets wordt aangeklikt en doe iets
  void keyCheck() {
    // Speel onder andere geluid af wanneer de speler van kamers wisselt
    if (mouseX > 1150  && mouseX < 1272 && mouseY > 301 && mouseY < 401 ) {
      kamer = 17;
      room17.timer1 = millis();
      song1room16.play();
      song1room16.rewind();
      timer2 = 0;
    }
    if (mouseX > 111  && mouseX < 166 && mouseY > 664 && mouseY < 800) {
      woodenDoor.play();
      woodenDoor.rewind();
      song1room15.play();
      song1room15.rewind();
      kamer = 15;
      room15.timer1 = millis();
      timer2 = 0;
    }
    if (mouseX > 670  && mouseX < 820 && mouseY > 280 && mouseY < 500 ) {
      kamer = 18;
      room18.timer1 = millis();
      song1room16.play();
      song1room16.rewind();
      whisper.play();
      whisper.rewind();
      timer2 = 0;
    }
    if (mouseX > 61  && mouseX < 128 && mouseY > 501 && mouseY < 526) {
      loadText = "randomchest";
      timer2 = millis();
    }
  }

  // Gebruik deze tekst
  void showText() {
    fill(255);
    textAlign(CENTER);
    textFont(font2);
    switch (loadText) {
    case "randomchest" :
      text("There is nothing in the chest.", 640, 785);
      break;
    }
    textAlign(BASELINE);
    fill(138, 7, 7);
  }
}