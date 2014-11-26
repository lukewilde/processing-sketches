float a = 0;
int numberOfCircles = 36;
float inc = TWO_PI / numberOfCircles;
float x = 0;
float y = 0;
int radius = 180;

void setup() {
  size(400, 400);
  background(150);
}


void draw(){
  a = 0;
  background(150);

  for (int i = 0; i < numberOfCircles; i++) {

    x = sin(a) * radius + width / 2;
    y = cos(a) * radius + height / 2;
    ellipse(x, y, 10, 10);
    a = a + inc;
  }
}
