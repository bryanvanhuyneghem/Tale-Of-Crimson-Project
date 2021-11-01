class Portrait {
  PImage portrait;
  PImage locked;
  PImage painting1;
  PImage painting2;
  PImage painting3;
  PImage painting4;
  PImage painting5;
  PImage painting6;
  PImage painting7;
  PImage painting8;
  PImage painting9;
  PImage painting10;
  PImage painting11;
  PImage painting12;
  boolean showPainting1;
  boolean showPainting2;
  boolean showPainting3;
  boolean showPainting4;
  boolean showPainting5;
  boolean showPainting6;
  boolean showPainting7;
  boolean showPainting8;
  boolean showPainting9;
  boolean showPainting10;
  boolean showPainting11;
  boolean showPainting12;
  boolean locked1;
  boolean locked2;
  boolean locked3;
  boolean locked4;
  boolean locked5;
  boolean locked6;
  boolean locked7;
  boolean locked8;
  boolean locked9;
  boolean locked10;
  boolean locked11;
  boolean locked12;

  Portrait() {
    portrait = loadImage("portrait_background.png");
    locked = loadImage("locked_portrait.png");
    painting1 = loadImage("John_portrait.png");
    painting2 = loadImage("Olivia4_portrait.png");
    painting3  = loadImage("Lucius_portrait.png");
    painting4 = loadImage("Crimson_portrait.png");    
    painting5 = loadImage("Olivia3_portrait.png");
    painting6 = loadImage("Eden_portrait.png");
    painting7 = loadImage("Olivia1_portrait.png");
    painting8  = loadImage("Vlad_portrait.png");
    painting9 = loadImage("Crimson2_portrait.png");    
    painting10 = loadImage("Marcus_portrait.png");
    painting11 = loadImage("Olivia2_portrait.png");
    painting12 = loadImage("Olivia5_portrait.png");
  }

  // Verberg of toon portretten
  void portrait() {
    background(portrait);
    if (!locked1) {
      image(locked, 65, 236);
    }
    if (!locked2) {
      image(locked, 273, 236);
    }
    if (!locked3) {
      image(locked, 480, 236);
    }
    if (!locked4) {
      image(locked, 690, 236);
    }
    if (!locked5) {
      image(locked, 895, 236);
    }
    if (!locked6) {
      image(locked, 1105, 236);
    }
    if (!locked7) {
      image(locked, 65, 528);
    }
    if (!locked8) {
      image(locked, 273, 528);
    }
    if (!locked9) {
      image(locked, 480, 528);
    }
    if (!locked10) {
      image(locked, 690, 528);
    }
    if (!locked11) {
      image(locked, 895, 528);
    }
    if (!locked12) {
      image(locked, 1105, 528);
    }
    if (showPainting1) {
      image (painting1, 320, 10, 600, 780);
    }
    if (showPainting2) {
      image (painting2, 320, 10, 600, 780);
    }
    if (showPainting3) {
      image (painting3, 320, 10, 600, 780);
    }
    if (showPainting4) {
      image (painting4, 320, 10, 600, 780);
    }
    if (showPainting5) {
      image(painting5, 320, 10, 600, 780);
    }
    if (showPainting6) {
      image (painting6, 320, 10, 600, 780);
    }
    if (showPainting7) {
      image (painting7, 320, 10, 600, 780);
    }
    if (showPainting8) {
      image (painting8, 320, 10, 600, 780);
    }
    if (showPainting9) {
      image (painting9, 320, 10, 600, 780);
    }
    if (showPainting10) {
      image(painting10, 320, 10, 600, 780);
    }
    if (showPainting11) {
      image(painting11, 320, 10, 600, 780);
    }
    if (showPainting12) {
      image(painting12, 320, 10, 600, 780);
    }

    fill(255, 255, 255);
    text("Go back", 100, 772);
    hoverMenu();
  }

  // Als de speler klikt op een portret: open het; als de speler ergens klikt behalve op het open portret: sluit het
  void keyCheck() {
    if (mouseX > 105 && mouseX < 213 && mouseY > 742 && mouseY < 777) {
      kamer = 23;
    }
    if (mouseX > 70 && mouseX < 177 && mouseY > 240 && mouseY < 400 && locked1) {
      showPainting1 = true;
    } else if (!(mouseX > 325 && mouseX < 922 && mouseY > 15 && mouseY < 791)) {
      showPainting1 = false;
    }
    if (mouseX > 277 && mouseX < 384 && mouseY > 241 && mouseY < 400 && locked2) {
      showPainting2 = true;
    } else if (!(mouseX > 325 && mouseX < 922 && mouseY > 15 && mouseY < 791)) {
      showPainting2 = false;
    }
    if (mouseX > 485 && mouseX < 592 && mouseY > 241 && mouseY < 400 && locked3) {
      showPainting3 = true;
    } else if (!(mouseX > 325 && mouseX < 922 && mouseY > 15 && mouseY < 791)) {
      showPainting3 = false;
    }
    if (mouseX > 696 && mouseX < 801 && mouseY > 241 && mouseY < 400 && locked4) {
      showPainting4 = true;
    } else if (!(mouseX > 325 && mouseX < 922 && mouseY > 15 && mouseY < 791)) {
      showPainting4 = false;
    }
    if (mouseX > 900 && mouseX < 1006 && mouseY > 241 && mouseY < 400 && locked5) {
      showPainting5 = true;
    } else if (!(mouseX > 325 && mouseX < 922 && mouseY > 15 && mouseY < 791)) {
      showPainting5 = false;
    }
    if (mouseX > 1108 && mouseX < 1217 && mouseY > 241 && mouseY < 400 && locked6) {
      showPainting6 = true;
    } else if (!(mouseX > 325 && mouseX < 922 && mouseY > 15 && mouseY < 791)) {
      showPainting6 = false;
    }
    if (mouseX > 70 && mouseX < 177 && mouseY > 533 && mouseY < 693 && locked7) {
      showPainting7 = true;
    } else if (!(mouseX > 325 && mouseX < 922 && mouseY > 15 && mouseY < 791)) {
      showPainting7 = false;
    }
    if (mouseX > 277 && mouseX < 384 && mouseY > 533 && mouseY < 693 && locked8) {
      showPainting8 = true;
    } else if (!(mouseX > 325 && mouseX < 922 && mouseY > 15 && mouseY < 791)) {
      showPainting8 = false;
    }
    if (mouseX > 485 && mouseX < 592 && mouseY > 533 && mouseY < 693 && locked9) {
      showPainting9 = true;
    } else if (!(mouseX > 325 && mouseX < 922 && mouseY > 15 && mouseY < 791)) {
      showPainting9 = false;
    }
    if (mouseX > 696 && mouseX < 801 && mouseY > 533 && mouseY < 693 && locked10) {
      showPainting10 = true;
    } else if (!(mouseX > 325 && mouseX < 922 && mouseY > 15 && mouseY < 791)) {
      showPainting10 = false;
    }
    if (mouseX > 900 && mouseX < 1006 && mouseY > 533 && mouseY < 693 && locked11) {
      showPainting11 = true;
    } else if (!(mouseX > 325 && mouseX < 922 && mouseY > 15 && mouseY < 791)) {
      showPainting11 = false;
    }
    if (mouseX > 1108 && mouseX < 1217 && mouseY > 533 && mouseY < 693 && locked12) {
      showPainting12 = true;
    } else if (!(mouseX > 325 && mouseX < 922 && mouseY > 15 && mouseY < 791)) {
      showPainting12 = false;
    }
  }
  
  void hoverMenu() {

    if (mouseX > 105 && mouseX < 213 && mouseY > 742 && mouseY < 777) {
      fill(138, 7, 7);
      text("Go back", 100, 772);
    }
  }
}