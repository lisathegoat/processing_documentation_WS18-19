
import processing.pdf.*;
import peasy.*;

PFont mapFont;
//PShape baseMap;
PImage baseMap;
PShape globe;
Table table;
PeasyCam cam;
float angle;
float r;
float u;
float v;
float z;
int myCount = 0;
float mySize =1;
float mass;
float theta;
float phi;


int currentYear = 1600;

void setup() {
  size ( 1200, 600, OPENGL);
  cam = new PeasyCam(this, 100); 
  table = loadTable ("data/MeteorStrikesDataSet.csv", "header");
  //baseMap = loadShape("WorldMap.svg");
  baseMap = loadImage("WorldMap-01.png");
  globe = createShape (SPHERE, 100);
  globe.setTexture(baseMap);

  // mapFont = createFont("Futura-Bold", 12);
}


void draw() {

  background(0, 0, 0);
  smooth();
  if (frameCount % 2 == 0) {
    currentYear ++;
  }
  println(currentYear);


  imageMode(CENTER);
  //beginShape();
  //texture(baseMap);
  //vertx( x,y,z,  u,v);
  shape(globe);
  for (TableRow row : table.rows()) {

    String name = row.getString("place");
    float mass = row.getFloat("mass_g");
    float reclat = row.getFloat("latitude");
    float reclong = row.getFloat("longitude");
    int year = row.getInt("year");
    // float recdate = row.getFloat("datetime");

    float mapX = map(reclong, -180, 180, 0, width);
    float mapY = map(reclat, 90, -90, 0, height);
    float mapMass = map (mass, 0, 5000000, 3.0, 8.0); 
    float mapZ =  r* cos(mapY) * sin (mapX);
    r = 100;
    theta = 2*PI*u;
    phi = PI*(0.5);
    u = r* cos(mapY * theta) * sin(mapX * phi);
    v = r* sin(mapY* phi);
    z = r* cos(mapY*theta) * cos (mapX*phi);
  

    if (year < currentYear) {
        stroke (255, 0, 0, 80);
        strokeWeight (mapMass*2);
        point(u,v, z+5);
        
        stroke (255, 0, 0);
        strokeWeight (1);
        line (u, v, z+5, u, v + mapMass, z+5);
      
    }

    //   for (Meteo m : allMeteors) {
    //  m.display();
    //  }
  }
  cam.beginHUD();
  text("Year: " + currentYear,  1100, 50, 0);
  cam.endHUD();

}
