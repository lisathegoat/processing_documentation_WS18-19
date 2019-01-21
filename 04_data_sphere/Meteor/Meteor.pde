class Meteo {

  float x;
  float y;
  float z;
  float r = 100;

  int year;
  float mass;
  String name;

  Meteo(float _x, float _y, float _z, float _mass, int _year, String _name) {

    x = r* cos(y) * sin(x);
    y = r* sin(y);
    z = r * cos(y) * cos(x);
    mass = _mass;
    year = _year;
    name = _name;
  }

  void run() {

    if (year < currentYear) {
      display();
    }
  }

  void display() {
    strokeWeight(mass);
    stroke(255, 0, 0);
    point(x, y, z);

    strokeWeight(1);
    line( x, y, z, x, y, z+ (mass*2));
  }
}
