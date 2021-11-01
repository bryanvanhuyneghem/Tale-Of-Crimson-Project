class Room15 {
  PImage room15;
  PImage keys;
  PImage arrow;
  PImage arrow1;
  boolean showKey = true;
  int timer1;
  int timer2;
  String loadText;
  Room15() {
    room15 = loadImage("Room 15 - Dungeon_tunnel.jpg");
    arrow =  loadImage("ARROWDOWN.png");
    keys = loadImage ("key_01.png");
  }

  void RoomLoad() {
    isRepeating = true;
    background(room15);
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

    // Controleer of de sleutel al dan niet al is opgepakt door de speler
    if (showKey) {
      image(keys, 310, 440, 17, 50);
    }

    // Laat een bepaalde tekst een aantal seconden verschijnen
    if (millis() - timer2 < 5000) {
      showText();
    }

    // Display de naam van de kamer 
    if (millis () - timer1 < 6000) {
      fill(255);
      textAlign(CENTER);
      textFont(font1);
      text("Dungeon tunnel", 640, 50);
      textAlign(BASELINE);
      fill(138, 7, 7);
    }

    // Toon het hintsymbool rechts boven op het scherm
    if (difficulty.hints) {
      image(hintIcon, 1201, 19);
    }

    // Laad de timer
    timer();

    // Laad de standaard cursor
    cursor(cursor1, 5, 5);
  }

  // Controleer of iets wordt aangeklikt en doe iets
  void keyCheck() {
    // Speel onder andere geluid af wanneer de speler van kamers wisselt
    if (mouseX > 605  && mouseX <720 && mouseY > 245 && mouseY < 345 ) {
      song1room15.play();
      song1room15.rewind();
      woodenDoor.play();
      woodenDoor.rewind();
      kamer = 16;
      room16.timer1 = millis();
      timer2 = 0;
    }
    if (mouseX > 111  && mouseX <166 && mouseY > 664 && mouseY < 800) {
      kamer = 14;
      room14.timer1 = millis();
      timer2 = 0;
    }

    if (mouseX > 308  && mouseX <360 && mouseY > 440 && mouseY < 580 && showKey) {
      showKey = false;
      loadText = "key";
      inventory.key5V = true;
      timer2 = millis();
      keySound.play();
      keySound.rewind();
    }
  }

  // Gebruik deze tekst
  void showText() {
    fill(255);
    textAlign(CENTER);
    textFont(font2);
    switch (loadText) {
    case "key" :
      text("You obtain a key.", 640, 785);
      break;
    }
    textAlign(BASELINE);
    fill(138, 7, 7);
  }
}