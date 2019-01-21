class Blub {
  PVector pos; //location
  float r;
  PVector vel  ; // velocity (Geschwindgkeit)

  Blub(float x, float y) {
    pos = new PVector(x, y);
    vel = PVector. random2D(); // Vector pointing in random direction
    vel.mult (random(5, 10)); // random speed
    r = random(20,50);
  }

  void update () { //update function
    pos.add(vel);

    if (pos.x < 20 || pos.x > width-20) {
      vel.x *= -1;
    }
    if (pos.y < 20 || pos.y > height-20) {
      vel.y *= -1;
    }
  }
}

class Blob {
  PVector pos; //location
  float r;
  PVector vel  ; // velocity (Geschwindgkeit)

  Blob(float x, float y) {
    pos = new PVector(x, y);
    vel = PVector. random2D(); // Vector pointing in random direction
    vel.mult (random(5, 10)); // random speed
    r = 50;
  }

  void update () { //update function
    pos.add(vel);

    if (pos.x < 0 || pos.x > width) {
      vel.x *= -1;
    }
    if (pos.y < 0 || pos.y > height) {
      vel.y *= -1;
    }
  }


  void show() {
    noFill();
    stroke(1);
    ellipse(width/2, height/2, r*2, r*2);
  }
}
