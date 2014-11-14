int totalCircles = 0;
float currentRadius = 0;
float maxRadius = 50;
float radiusEffector = 0;
float goldenRatio = (sqrt(5) + 1) / 2 - 1;
float maxSize = 20;
float minSize = 4;
float pulseRate = 10;
float destinationRadius = 0;
float stepSize = 0;
float angle = 0;
float x = 0;
float y = 0;
float size = 0;
float distanceRatio = 0;

void setup() {
  size(400, 400);
  fill(0);
  frameRate(60);
  smooth();
  println(goldenRatio);
}

void draw() {
  totalCircles ++;
  destinationRadius = 100 + maxRadius + cos(radiusEffector += 0.02) * maxRadius;

  stepSize = destinationRadius / totalCircles;
  noStroke();
  currentRadius = 0;
  background(150);

  for (int i = 1; i <= totalCircles; i++) {

    angle = i * goldenRatio;
    x = width / 2 + cos(angle) * currentRadius;
    y = height / 2 + sin(angle) * currentRadius;
    distanceRatio = norm(dist(200, 200, x, y), 0, 200);
    size = minSize + maxSize * distanceRatio;
    fill(170 * distanceRatio);
    // stroke(0 + 155 * distanceRatio);

    ellipse(x, y, size, size);
    currentRadius += stepSize;
  }
}
