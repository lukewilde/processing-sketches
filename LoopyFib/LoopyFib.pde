int totalCircles = 0;
float currentRadius = 0;
float maxRadius = 50;
float radiusEffector = 0;
float goldenRatio = (sqrt(5) + 1) / 2 - 1;
float maxSize = 20;
float minSize = 5;
float pulseRate = 10;

void setup() {
  size(400, 400);
  fill(0);
  frameRate(60);
  smooth();
}

void draw() {
  totalCircles ++;
  float destinationRadius = 50 + maxRadius + cos(radiusEffector += 0.02) * maxRadius;

  float stepSize = destinationRadius / totalCircles;

  currentRadius = 0;
  fill(150);
  stroke(50);
  background(204);

  for (int i = 1; i <= totalCircles; i++) {

    float angle = i * goldenRatio;
    float x = width / 2 + cos(angle) * currentRadius;
    float y = height / 2 + sin(angle) * currentRadius;
    float size = minSize + maxSize * norm(dist(200, 200, x, y), 0, 200);

    ellipse(x, y, size, size);
    currentRadius += stepSize;
  }
}
