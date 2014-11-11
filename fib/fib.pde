int totalCircles = 0;
float currentRadius = 0;
float destinationRadius = 150;
float goldenRatio = (sqrt(5) + 1) / 2 - 1;

void setup() {
  size(400, 400);
  fill(0);
  frameRate(60);
}

void draw() {
  totalCircles ++;
  double stepSize = destinationRadius / totalCircles;
  currentRadius = 0;
  fill(0);
  background(204);

  for (int i = 1; i <= totalCircles; i++) {
    float angle = i * goldenRatio;
    float x = width / 2 + cos(angle) * currentRadius;
    float y = height / 2 + sin(angle) * currentRadius;

    ellipse(x, y, 1, 1);
    currentRadius += stepSize;
  }
}

int fib(int x) {
  if (x <= 1) {
    return 1;
  }

  return fib(x - 2) + fib(x - 1);
}
