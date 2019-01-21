int mx, my;

void setup() {
size(400,500);
strokeWeight(0);
background(0,50,0);
colorMode(RGB);
}
 
 void draw() {
background(0);
  
auge (20, 40);
pupille (20, 40);
auge (70, 40);
pupille (70, 40);

auge (150, 40);
pupille (150, 40);
auge (200, 40);
pupille (200, 40);

auge (270, 40);
pupille (270, 40);
auge (320, 40);
pupille (320, 40);

auge (20, 40);
pupille (20, 40);
auge (70, 40);
pupille (70, 40);

// reihe 2
auge (20,90);
pupille (20, 90);
auge (70, 90);
pupille (70, 90);

auge (150, 90);
pupille (150, 90);
auge (200, 90);
pupille (200, 90);

auge (270, 90);
pupille (270, 90);
auge (320, 90);
pupille (320, 90);

// reihe 3
auge (20,140);
pupille (20, 140);
auge (70, 140);
pupille (70, 140);

auge (150, 140);
pupille (150, 140);
auge (200, 140);
pupille (200, 140);

auge (270, 140);
pupille (270, 140);
auge (320, 140);
pupille (320, 140);

// reihe 4
auge (20,190);
pupille (20, 190);
auge (70, 190);
pupille (70, 190);

auge (150, 190);
pupille (150, 190);
auge (200, 190);
pupille (200, 190);

auge (270, 190);
pupille (270, 190);
auge (320, 190);
pupille (320, 190);

// reihe 5
auge (20,240);
pupille (20, 240);
auge (70, 240);
pupille (70, 240);

auge (150, 240);
pupille (150, 240);
auge (200, 240);
pupille (200, 240);

auge (270, 240);
pupille (270, 240);
auge (320, 240);
pupille (320, 240);

// reihe 6
auge (20,290);
pupille (20, 290);
auge (70, 290);
pupille (70, 290);

auge (150, 290);
pupille (150, 290);
auge (200, 290);
pupille (200, 290);

auge (270, 290);
pupille (270, 290);
auge (320, 290);
pupille (320, 290);

// reihe 7
auge (20,340);
Red (20, 340);
auge (70, 340);
Red (70, 340);

auge (150, 340);
pupille (150, 340);
auge (200, 340);
pupille (200, 340);

auge (270, 340);
pupille (270, 340);
auge (320, 340);
pupille (320, 340);

// reihe 8
auge (20,390);
pupille (20, 390);
auge (70, 390);
pupille (70, 390);

auge (150, 390);
pupille (150, 390);
auge (200, 390);
pupille (200, 390);

auge (270, 390);
pupille (270, 390);
auge (320, 390);
pupille (320, 390);

// reihe 9
auge (20,440);
pupille (20, 440);
auge (70, 440);
pupille (70, 440);

auge (150, 440);
pupille (150, 440);
auge (200, 440);
pupille (200, 440);

auge (270, 440);
pupille (270, 440);
auge (320, 440);
pupille (320, 440);

// reihe 10
auge (20,490);
pupille (20, 490);
auge (70, 490);
pupille (70, 490);

auge (150, 490);
pupille (150, 490);
auge (200, 490);
pupille (200, 490);

auge (270, 490);
pupille (270, 490);
auge (320, 490);
pupille (320, 490);
 }

 void auge(int x, int y) {
   
   fill(255);
beginShape ();
curveVertex (x, y); // Linie a, Punkt 1
curveVertex (x, y);
curveVertex (x+10, y-8);
curveVertex(x+20, y-10);  // Linie a, Punkt 2
curveVertex (x+30, y-8); 
curveVertex (x+40, y); 
curveVertex (x+40, y); 
endShape ();

beginShape ();
curveVertex (x+40, y); 
curveVertex (x+40, y); 
curveVertex (x+30, y+8); 
curveVertex (x+20, y+10);
curveVertex (x+10, y+8); 
curveVertex(x, y); 
curveVertex(x, y); 
endShape ();
 }
 
 void maus(){
if (mousePressed) ;
 println("Blink");
 fill(228,21,18);
 }
 
 void pupille ( int x, int y){
   fill(255,255,255,0);
mx=mouseX+x+40;
my=mouseY-y;
fill(0);
noStroke();
ellipse(x+mx/14,y+my/30,17,17);
}

void Red ( int x, int y){

fill(228,21,18);
noStroke();
ellipse(x+20,y,17,17);
 
}

/*void mousePressed(int y, int x) {
  if (mouseButton == LEFT) ;
  int y = (y/2);
  }  */
   
