//Blob b;
//float r = 0;
float r = 255;
float g = 255;
float b = 255;
PImage atlas1;
PVector pos = new PVector(0, 0, 0);//the position of the camera
PVector gridPos = new PVector(0, 0, 0);//the position of the grid (it moves with the camera to make it look infinite)



Blob [] blobs   = new Blob [5];
Blub [] blubs   = new Blub [5];


void setup() {
  size(597, 820, P3D);
  atlas1 = loadImage("atlas1.png");
  // b = new Blob(100, 100);

  for (int i = 0; i < blobs.length; i++) {
    blobs [i] = new Blob (random(width), random(height));
  }

  for (int i = 0; i < blubs.length; i++) {
    blubs [i] = new Blub (random(200, 400), random(200, 600));
  }
}

void draw() {
  colorMode(RGB);
  background(51);
  //background(h, s, b);
  loadPixels(); 
  for (int x= 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int index = x + y * width;
      float sum = 0; 
      for (Blob b : blobs) {
        float d = dist(x, y, b.pos.x, b.pos.y);
        sum += 400 * blobs[0].r / d;
      }
      pixels[index] = color (sum, 0, 255);
      stroke(sum, 0, 255);
      if ( x > 0 && x < 100 && y > 0 && y < 300) {
        float d = dist(x, y, width/2, height/2);
        sum += 300 * blobs[0].r / d;
      }
    }
  }
  updatePixels();

  for (Blob b : blobs) {
    b.update();
    //b.show();
  }

  loadPixels(); 
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int index = x + y * width;
      float sum = 0; 
      for (Blub b : blubs) {
        float d = dist(x, y, b.pos.x, b.pos.y);
        sum += 300 * blubs[0].r / d;
      }
      pixels[index] = color(random (0, 200), 0, sum); // auch ohne random schön
    }
    updatePixels();


    for (Blub b : blubs) {
      b.update();
      //b.show();
    }

    // ball(width/2, height/2, 0);
    //blobs.show();
  }
  //viereck(width/2, height/2); 
  stroke( 0, height, width - 29.8, height/4);
  ball(width/2, height/2-80, -150);
  Atlas(width/2+50, height/2+135, 0);
  stroke(255, 255, 255);
  strokeWeight(2);
gridv ( 0,-140, 900);
gridh ( 0,-300, 500);
//gridh ( 0,0, 0);

//for ( int i < 0; i > 3600

 // line( -2150, height, -4000, width+2150, height, -4000);
}


   /*float size = map ( mouseY, 0, 597, 0, 820); 
  line( 0, size, 0, 298, height/2, 100);
 line( 60, size, 298, height/2);
  line( 60*2, size, 298, height/2);
  line( 60*3, size, 298, height/2);
  line( 60*4, size, 298, height/2);
  line( 60*5, size, 298, height/2);
  line( 60*6, size, 298, height/2);
  line( 60*7, size, 298, height/2);
  line( 60*8, size, 298, height/2);
  line( 60*9, size, 298, height/2);
  line( width, size, 298, height/2);
}*/

void viereck(float x, float y) {
  float col = map (mouseX, 0, 597, 0, 255); 
  strokeWeight(2);
  stroke(col, 0, 255);
  //fill (col, 255, 0);
  rectMode(CENTER);
  rect(x, y, width/2, height/2);
}

void Atlas(int x, int y, int z) {
  pushMatrix();
  redraw();
  translate (x, y, z);
  imageMode(CENTER);
  scale(0.8);
  directionalLight(20, 20, 20, 0, -8, -8);
  image(atlas1, 0, 0);
  popMatrix();
}

void ball (float x, float y, float z) {
  pointLight(255, 0, 150, mouseX, mouseY, 64);
  pointLight(100, 0, 255, width - mouseX, height - mouseY, 64);
  noStroke();
  pushMatrix();
  translate(x, y, z);
  sphere(width * 0.25);
  popMatrix();
}
/* ambientLight(128, 128, 128);
 
 lightSpecular(255,255,255);
 directionalLight(128,128,128, 0, 1, -1);
 if(mousePressed);
 pushMatrix();
 translate(x, y, z);
 float r = 320;
 rotate (mouseY * 0.05);
 rotate (mouseX * 0.05);
 fill (r, 255, 255);
 int res = 90; 
 specular(0,0,255);
 shininess(10.0);
 ambient(255,0,0);
 sphereDetail(res);
 sphere(r/2);
 popMatrix();
 
 }*/



void blub(float s, float l ) {
  loadPixels(); 
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int index = x + y * width;
      float sum = 0; 
      for (Blub b : blubs) {
        float d = dist(s, l, b.pos.x, b.pos.y);
        sum += 200 * blubs[0].r / d;
      }
      pixels[index] = color(sum, 255, 255);
    }
  }
  updatePixels();
}


void gridv( int x, int y, int z ){
  pushMatrix();
  translate (x, y, z);
float swift = map (mouseY , 0, 597, 820, 0);
  strokeWeight(0.8);
      line( 0, swift , 0, 298, height/1.5, -900);
      line( 0, swift -50, 0, 298, height/1.5, -900);
  line( 0, swift -100, 0, 298, height/1.5, -900);
  line( 0, swift -150, 0, 298, height/1.5, -900);
  line( 0, swift -200, 0, 298, height/1.5, -900);
  line(0, swift -250, 0, 298, height/1.5, -900);
  line( 0, swift -300, 0, 298, height/1.5, -900);
  line( 0, swift -350, 0, 298, height/1.5, -900);
  line( 0, swift -400, 0, 298, height/1.5, -900);
  line(0, swift -450, 0, 298, height/1.5, -900);
  line( 0, swift -500, 0, 298, height/1.5, -900);
  line( 0, swift -200, 0, 298, height/1.5, -900);
   
   line( 50, swift , 0, 298, height/1.5, -900);
   line( 100, swift , 0, 298, height/1.5, -900);
   line( 150, swift , 0, 298, height/1.5, -900);
   line( 200, swift , 0, 298, height/1.5, -900);
   line( 250,swift , 0, 298, height/1.5, -900);
   line( 300, swift , 0, 298, height/1.5, -900);
   line( 350, swift , 0, 298, height/1.5, -900);
   line( 400, swift , 0, 298, height/1.5, -900);
   line( 450, swift , 0, 298, height/1.5, -900);
   line( 500, swift , 0, 298, height/1.5, -900);
   line( 550, swift , 0, 298, height/1.5, -900);
   line( 600, swift , 0, 298, height/1.5, -900);

  line( width, swift -50, 0, 298, height/1.5, -900);
  line( width, swift -100, 0, 298, height/1.5, -900);
  line( width, swift -150, 0, 298, height/1.5, -900);
  line( width, swift -200, 0, 298, height/1.5, -900);
  line( width, swift -250, 0, 298, height/1.5, -900);
  line( width, swift -300, 0, 298, height/1.5, -900);
  line( width, swift -350, 0, 298, height/1.5, -900);
  line( width, swift -400, 0, 298, height/1.5, -900);
  line( width, swift -450, 0, 298, height/1.5, -900);
  line( width, swift -500, 0, 298, height/1.5, -900);
  line( width, swift -200, 0, 298, height/1.5, -900);
  popMatrix();
}

void gridh( int x, int y, int z ){
  pushMatrix();
  translate (x, y, z);
  strokeWeight(0.8);
float swift = map (mouseY , 597, 0, 820, 0);
      line( 0, swift , 0, 298, height/1.5, -900);
      line( 0, swift -50, 0, 298, height/1.5, -900);
  line( 0, swift -100, 0, 298, height/1.5, -900);
  line( 0, swift -150, 0, 298, height/1.5, -900);
  line( 0, swift -200, 0, 298, height/1.5, -900);
  line(0, swift -250, 0, 298, height/1.5, -900);
  line( 0, swift -300, 0, 298, height/1.5, -900);
  line( 0, swift -350, 0, 298, height/1.5, -900);
  line( 0, swift -400, 0, 298, height/1.5, -900);
  line(0, swift -450, 0, 298, height/1.5, -900);
  line( 0, swift -500, 0, 298, height/1.5, -900);
  line( 0, swift -200, 0, 298, height/1.5, -900);
   
   line( 50, swift , 0, 298, height/1.5, -900);
   line( 100, swift , 0, 298, height/1.5, -900);
   line( 150, swift , 0, 298, height/1.5, -900);
   line( 200, swift , 0, 298, height/1.5, -900);
   line( 250,swift , 0, 298, height/1.5, -900);
   line( 300, swift , 0, 298, height/1.5, -900);
   line( 350, swift , 0, 298, height/1.5, -900);
   line( 400, swift , 0, 298, height/1.5, -900);
   line( 450, swift , 0, 298, height/1.5, -900);
   line( 500, swift , 0, 298, height/1.5, -900);
   line( 550, swift , 0, 298, height/1.5, -900);
   line( 600, swift , 0, 298, height/1.5, -900);

  line( width, swift -50, 0, 298, height/1.5, -900);
  line( width, swift -100, 0, 298, height/1.5, -900);
  line( width, swift -150, 0, 298, height/1.5, -900);
  line( width, swift -200, 0, 298, height/1.5, -900);
  line( width, swift -250, 0, 298, height/1.5, -900);
  line( width, swift -300, 0, 298, height/1.5, -900);
  line( width, swift -350, 0, 298, height/1.5, -900);
  line( width, swift -400, 0, 298, height/1.5, -900);
  line( width, swift -450, 0, 298, height/1.5, -900);
  line( width, swift -500, 0, 298, height/1.5, -900);
  line( width, swift -200, 0, 298, height/1.5, -900);
  popMatrix();
}
