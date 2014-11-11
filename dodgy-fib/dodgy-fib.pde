// Example 07-15 from "Getting Started with Processing"
// by Reas & Fry. O'Reilly / Make 2010

float angle = 0.0;
float offset = 200;
float scalar = 2;
float speed = 0.2;
int colorValue = 0;

void setup() {
  size(400, 400);
  fill(0);
  background(205);
  smooth();
  frameRate(60);

  float x = 0;
  float y = 0;
  int i = 0;
  int radius = 0;
  fill(colorValue);
  background(205);

  while(x < width) {
    radius = fib(i);
    x = offset + cos(angle) * scalar;
    y = offset + sin(angle) * scalar;
    ellipse(x, y, radius, radius);
    angle += speed;
    scalar += speed;
    i++;
  }

  colorValue += 20;
  speed += 0.001;
  angle = 0;
  scalar = 2;
}

int fib(int x) {
  if (x <= 1) {
    return 1;
  }

  return fib(x - 2) + fib(x - 1);
}
