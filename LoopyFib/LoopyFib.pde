int totalCircles = 0;
float currentRadius = 0;
float maxRadius = 50;
float radiusEffector = 0;
float goldenRatio = (sqrt(5) + 1) / 2 - 1;
float maxSize = 20;
float minSize = 2;
float pulseRate = 10;
float destinationRadius = 0;
float stepSize = 0;
float angle = 0;
float x = 0;
float y = 0;
float size = 0;

void setup() {
  size(400, 400);
  fill(0);
  frameRate(60);
  smooth();
  println(goldenRatio);
}

void draw() {
  totalCircles ++;
  destinationRadius = 50 + maxRadius + cos(radiusEffector += 0.02) * maxRadius;

  stepSize = destinationRadius / totalCircles;

  currentRadius = 0;
  fill(150);
  stroke(50);
  background(204);

  for (int i = 1; i <= totalCircles; i++) {

  angle = i * goldenRatio;
  x = width / 2 + cos(angle) * currentRadius;
  y = height / 2 + sin(angle) * currentRadius;
  size = minSize + maxSize * norm(dist(200, 200, x, y), 0, 200);

    ellipse(x, y, size, size);
    currentRadius += stepSize;
  }
}
