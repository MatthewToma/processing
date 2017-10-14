//The diver moves with WASD and the shark moves with the arrow keys.
import ddf.minim.*;
AudioPlayer player;
Minim minim;//audio context
Sprite sprJelly;
Sprite sprFish;
Sprite sprOc, sprSH1, sprCur, sprSH2;
Sprite sprDiver, sprCur2, sprDiver2;
PImage imgGameover;
int nImg;
int nX, nY, i;
int nDx, nDy, i2;
int nJx, nJy;
int nPoints;
int nHealth = 500;
float fSpeed = 1.4;
float fSpeed2 = 1.01;
ArrayList<Sprite> alJelly = new ArrayList<Sprite>();
ArrayList<Sprite>alFish = new ArrayList<Sprite>();

void setup() {
  size(1000, 900);
  minim = new Minim(this);
  player = minim.loadFile("Jaws-theme-song.mp3", 2048);
  player.play();
  sprOc= new Sprite("pexels-photo.jpeg", "pexels-photo.jpeg", 0, 0, 1000, 1000);
  sprJelly = new Sprite("Jellyfish.png", "Jellyfish.png", 300, 600, 200, 200);
  alJelly.add(sprJelly);
  sprJelly = new Sprite("Jellyfish.png", "Jellyfish.png", 900, 10, 100, 100);
  alJelly.add(sprJelly);
  sprFish = new Sprite("2.png", "2.png", 800, 423, 40, 40);
  alFish.add(sprFish);
  sprFish = new Sprite("2.png", "2.png", 200, 635, 65, 65);
  alFish.add(sprFish);
  sprFish = new Sprite("2.png", "2.png", 350, 200, 30, 30);
  alFish.add(sprFish);
  sprFish = new Sprite("2.png", "2.png", 150, 134, 50, 50);
  alFish.add(sprFish);
  sprFish = new Sprite("2.png", "2.png", 550, 20, 20, 20);
  alFish.add(sprFish);
  sprSH1= new Sprite("Shark.png", "Shark2.png", 500, 500, 50, 50);
  sprCur=sprSH1;
  sprCur.update();
  sprCur.changestance(2);
  sprDiver= new Sprite("diver.png", "diver2.png", 500, 500, 100, 100);
  sprCur2=sprDiver;
  sprCur.update();
  sprCur2.changestance(2);
}

void draw() {
  sprOc.update();
  for ( i = 0; i<alFish.size(); i++) {
    Sprite sprFish = (Sprite) alFish.get(i);
    sprFish.update();
    for ( i2 = 0; i2<alJelly.size(); i2++) {
      Sprite sprJelly = (Sprite) alJelly.get(i2);
      sprJelly.update();
      nDx += random(-fSpeed, fSpeed);
      nDy += random(-fSpeed, fSpeed);
      sprFish.update();
      nJx += random(-fSpeed2, fSpeed2);
      nJy += random(-fSpeed2, fSpeed2);
      sprJelly.update();
      sprJelly.updateDir(nJx, nJy);
      if (sprJelly.nX<0) {
        sprJelly.updateDir(5, 0);
      }
      if (sprJelly.nX>width-sprJelly.nW) {
        sprJelly.updateDir(-5, 0);
      }
      if (sprJelly.nY<0) {
        sprJelly.updateDir(0, 5);
      }
      if (sprJelly.nY>height-sprJelly.nH) {
        sprJelly.updateDir(0, -5);
      }
    }
    sprFish.update();
    sprFish.updateDir(nDx, nDy);
    if (sprFish.nX<0) {
      sprFish.updateDir(5, 0);
    }
    if (sprFish.nX>width-sprFish.nW) {
      sprFish.updateDir(-5, 0);
    }
    if (sprFish.nY<0) {
      sprFish.updateDir(0, 5);
    }
    if (sprFish.nY>height-sprFish.nH) {
      sprFish.updateDir(0, -5);
    }
  }
  sprCur.update();
  if (sprCur.nX<0) {
    sprCur.updateDir(0, 0);
  }
  if (sprCur.nX>width-sprCur.nW) {
    sprCur.updateDir(0, 0);
  }
  if (sprCur.nY<0) {
    sprCur.updateDir(0, 0);
  }
  if (sprCur.nY>height-sprCur.nH) {
    sprCur.updateDir(0, 0);
  }
  for (i = 0; i<alFish.size(); i++) {
    Sprite sprFish = (Sprite) alFish.get(i);
    sprFish.update();
    if ( isHit(sprSH1, sprFish)) {
      sprFish.updateDir(100000, 100000);
      sprFish = new Sprite("2.png", "2.png", nJy, nJx, 40, 40);
      alFish.add(sprFish);
      nPoints ++;
    }
  }
  for (i = 0; i<alJelly.size(); i++) {
    Sprite sprJelly = (Sprite) alJelly.get(i);
    sprJelly.update();
    if ( isHit(sprSH1, sprJelly)) {
      //sprSb.updateDir(0, -5);
      sprSH1.updateDir(0, 0);
      nHealth --;
    }
  }

  sprCur2.update();
  if (sprCur2.nX<0) {
    sprCur2.updateDir(0, 0);
  }
  if (sprCur2.nX>width-sprCur2.nW) {
    sprCur2.updateDir(0, 0);
  }
  if (sprCur2.nY<0) {
    sprCur2.updateDir(0, 0);
  }
  if (sprCur2.nY>height-sprCur2.nH) {
    sprCur2.updateDir(0, 0);
  }
  sprCur.update();
  if (sprCur.nX<0) {
    sprCur.updateDir(0, 0);
  }
  if (sprCur.nX>width-sprCur.nW) {
    sprCur.updateDir(0, 0);
  }
  if (sprCur.nY<0) {
    sprCur.updateDir(0, 0);
  }
  if (sprCur.nY>height-sprCur.nH) {
    sprCur.updateDir(0, 0);
  }
  sprCur2.update();
  if (sprCur2.nX<0) {
    sprCur2.updateDir(0, 0);
  }
  if (sprCur2.nX>width-sprCur2.nW) {
    sprCur2.updateDir(0, 0);
  }
  if (sprCur2.nY<0) {
    sprCur2.updateDir(0, 0);
  }
  if (sprCur2.nY>height-sprCur2.nH) {
    sprCur2.updateDir(0, 0);
  }
  textSize(30);
  text(nHealth, 450, 50);
  text("HEALTH", 300, 50);
  text(nPoints, 750, 50);
  text("POINTS", 600, 50);
}
void keyPressed() {
  if (keyCode == LEFT) {
    sprCur.changestance(2);
    sprCur.updateDir(-2, 0);
  }
  if (keyCode == RIGHT) {
    sprCur.changestance(1);
    sprCur.updateDir(2, 0);
  }   
  if (keyCode == DOWN) {
    sprCur.updateDir(0, 2);
  }
  if (keyCode == UP) {
    sprCur.updateDir(0, -2);
  }
  if (key == 'q') {
    sprCur.updateDir(0, 0);
  }
  if (key == 'a') {
    sprCur2.changestance(1);
    sprCur2.updateDir(-2, 0);
  }
  if (key == 'd') {
    sprCur2.changestance(2);
    sprCur2.updateDir(2, 0);
  }   
  if (key == 's') {
    sprCur2.updateDir(0, 2);
  }
  if (key == 'w') {
    sprCur2.updateDir(0, -2);
  }
}


void stop() {
  player.close();
  minim.stop();
  super.stop();
}

boolean isHit(Sprite one, Sprite two) { 
  int nH1, nW1, nH2, nW2, nX1, nY1, nX2, nY2;
  nX1 = one.nX;
  nY1 = one.nY; 
  nX2 = two.nX;
  nY2 = two.nY;
  nH1 = one.img.height;
  nW1 = one.img.width;
  nH2 = two.img.height;
  nW2 = two.img.width;
  if (
    ( ( (nX1 < nX2) && (nX1+nW1 > nX2) ) ||
    ( (nX1 > nX2) && (nX1 < nX2+nW2) ) )
    &&
    ( ( (nY1 < nY2) && (nY1+nH1 > nY2) ) ||
    ( (nY1 > nY2) && (nY1 < nY2+nH2) ) )
    )
    return (true) ;
  else
    return(false) ;
}