import ddf.minim.*;

Minim minim;

AudioPlayer space;

PImage ufo;
PImage sterne;
PImage erde;
PImage applaus;
PImage alien;
PFont f;
int x;
float my;

float speed_y;
float speed_x;
float stern_x;
float stern_y;
float s ;


float spieler_x;
float spieler_y;
float ufo_x;
float ufo_y;
float ufo_speed_x;
float ufo_speed_y;

//applaus+alien
float ex, ey;
float skalierFaktor = 1;

int round;
float r =1/2;

float winkel = PI;

void setup() {
  //position_array = new float [blur_value][2];
  minim = new Minim(this);
  space = minim.loadFile("Space.mp3");
  stern_y = 0;
  float s = random (width);
  spieler_x = 100;
  spieler_y = 0;
  ufo_x = width/2+400;
  ufo_y = height/2;
  ufo_speed_x = -8;
  ufo_speed_y = 0;
  round = 0;
  ex = 0;
  ey = 350;
  skalierFaktor = 1;
  erde = loadImage("erde.png");
  ufo = loadImage("Ufo-02.png");
  sterne = loadImage("sterne.png");
  applaus = loadImage("applaus.png");
  alien = loadImage("alien.png");
  f = createFont("Arial", 28, true);
  size(1200, 700);
  rectMode(CENTER);
  mouseX = 1100;
}

void draw() {
  background(0);
  himmel (0, 0);
  rect(spieler_x, spieler_y, 20, 100);
  ufo (ufo_x, ufo_y); 
  skalierFaktor = skalierFaktor + 0.1;
  space.play();
  planet1(0,height/2);

  // Blur-Effekt
  /* for(int i = (blur_value -1); i > 0; i--){
   fill(255, 255, 255, 255/(i*2));
   position_array[i][0] = position_array[i-1][0];
   position_array[i][1] = position_array[i-1][1];
   ufo (position_array[i][0], position_array[i][1], 10, 10);
   }
   position_array[0][0] = ufo_x;
   position_array[0][1] = ufo_y;
   fill(0, 100, 0, 255);*/

  // Pong  
  if (keyPressed) {
    if (keyCode == DOWN) {
      if (spieler_y < 650) {
        spieler_y = spieler_y + 8;
      }
    }
  }
  if (keyCode == UP) {
    if (spieler_y > 50) {
      spieler_y = spieler_y - 8;
    }
  }

  // Ufo
  ufo_x = ufo_x + ufo_speed_x;
  ufo_y = ufo_y + ufo_speed_y;

  if (ufo_x < 165) {
    if (ufo_y < (spieler_y + 55) && ufo_y > (spieler_y - 55)) {
      ufo_speed_x = (- ufo_speed_x) + 3;
      ufo_speed_y = ufo_speed_y - ( spieler_y - ufo_y) * 0.2; // absprung winkel
      round = round + 1;
    } else {
      ufo_x = width/2; // runde nicht geschafft 
      ufo_y = height/2;
      ufo_speed_x = -8;
      ufo_speed_y = 0;
      round = 0;
    }
  } 
   
  if (ufo_y > 695 || ufo_y < 5) {
    ufo_speed_y = -ufo_speed_y;
  }
  if (ufo_x > 1155) {
    ufo_speed_x = -ufo_speed_x;
  }
 
   
/*  if ((round + 1) && ( ufo_y > 200)) {
    applaus (0,0);
  }
  
  if ((round < 1) && ( ufo_y > 200)) {
    alien (0,0);
  }*/
    
  if (round > 0){
    spieler2 (1100, mouseY);
    
   if ((mouseY < 50)) {
    mouseY = 50;
  }
  if ((mouseY > 650)) {
    mouseY = 650;
  }
   if (ufo_x > 965) {
   if (ufo_y < (mouseY + 65) && ufo_y > (mouseY - 65)) {
     ufo_speed_x = (- ufo_speed_x) * 1.2;
     ufo_speed_y = ufo_speed_y - ( mouseY - ufo_y) * 0.2; 
      spieler_x = spieler_x + 8;
  } 
 }
} 
   
if (round > 1){
  stern_y = stern_y + 3; 
      stern(random ( width), stern_y); 
       stern(random ( width)+100, stern_y); 
        stern(random ( width)+200, stern_y); 
        stern(random ( width)+300, stern_y);    
          stern(random ( width)+700, stern_y); 
            stern(random ( width)+900, stern_y); 
   }
   
  
 /*    my = mouseY* 0.1;
  spieler3 (900, mouseY*0.1);
    
   if ((mouseY < 50)) {
    mouseY = 50;
  }
  if ((mouseY > 650)) {
    mouseY = 650;
  }
   if (ufo_x > 865) {
   if (ufo_y < (mouseY + 65) && ufo_y > (mouseY - 65)) {
     ufo_speed_x = (- ufo_speed_x) * 2;
     ufo_speed_y = ufo_speed_y - ( mouseY - ufo_y) * 0.2; 
  } 
 }
}*/ 
 

  strokeWeight(2);
  stroke(255,255, 255);
  fill(0,0, 0);
  ellipse(width/2+350, 639, 200, 50 );
    image(applaus, width/2+250, 639);
  textFont(f, 28);
  fill(255,255, 255);
  text("Round: " + round, width/2+300, height/2+300);

    
}


void ufo(float ufo_x, float ufo_y) {
  pushMatrix();
  translate(ufo_x, ufo_y);
  scale(0.4);
  rotate(radians(360*r));
  image(ufo, 0, 0);
  popMatrix();
}

void himmel(int x, int y) {
  strokeWeight(1);
  stroke(255, 255, 255);
  noFill();
  ellipse (0, height/2, 700, 700); 
  ellipse (0, height/2, 450, 450); 
  ellipse (0, height/2, 350, 350); 
  ellipse (0, height/2, 280, 280); 
  image(erde, 0, height/2);
  pushMatrix();
  translate (width/2, height/2);
  imageMode(CENTER);
  scale(0.5);
  image (sterne, x, y);
  popMatrix();
}

void planet1 ( int ex, int ey){
  pushMatrix();
   translate(0, height/2);
        rotate ( radians(winkel+-r));
        strokeWeight(1);
        stroke(255, 255, 255);
        noFill();
        ellipse(ex, ey, 50, 50);
        popMatrix();
        
         winkel = winkel + 0.004;
       r+= 1;
}

void anzeige(int x, int y) {
  textFont(f, 28);
  fill(255,255, 255);
  text("Round: " + round, x, y);
}




//alien
void alien (float ex, float ey) { 
  pushMatrix();
  translate (width/2, height/2);
  skalierFaktor = skalierFaktor + 0.1;
  imageMode(CENTER);
  scale(skalierFaktor);
  image(alien, ex, ey);
  if ((skalierFaktor > 3)) {
    skalierFaktor = 0 ;
  }
  popMatrix() ;
}

//spieler2

void spieler2 (int mx, int my) {
    imageMode(CENTER);
    fill( 255, 40, 30);
    image(alien, 1100, mouseY);
}

 /* void spieler3 (float mx, float my) {
    imageMode(CENTER);
    fill( 255, 40, 30);
    my = mouseY  0.1;
    image(alien, 900, my);
}*/

void stern (float stern_x, float stern_y){
  fill(255,255,255);
  noStroke();
ellipse (stern_x, stern_y, 3, 3);
}
