import processing.opengl.*;

int sphereSize = 100;
int padding = 0;
int numberOfSpheresAtEquator = 10;
int megaSphereSize = numberOfSpheresAtEquator * (sphereSize + padding);
float angle = 0;
float speed = 0.05;
int scalar = 60;
float rotation = 0;

float cameraX = 0;
float cameraZ = 0;
float cameraY = 0;

void setup() {
  size(800, 800, OPENGL);
  noStroke();
}

void draw(){
  background(106, 106, 106);

  float currentX = 0;
  float currentY = 0;
  float currentZ = 0;

  angle += speed;

  lights();

  cameraX = sin(mouseX * TWO_PI / 720) * megaSphereSize + width / 2;
  // Y rotation is a bit gnarley because the camera always faced the centre.
  cameraY = sin(mouseY * TWO_PI / 720) * megaSphereSize + height / 2;
  cameraZ = cos((mouseX + mouseY) * TWO_PI / 720) * (megaSphereSize * 2);

  //camera(0, 0, 3200, 0, 0, 0, 0, -1, 0);
  camera(cameraX, cameraY, cameraZ, width / 2, height / 2, 0, 0, -1, 0);

  // drawGuideSphere();
  drawMegaSphere();
}

void drawMegaSphere() {

  float currentRadius = 0;
  float verticalPadding = megaSphereSize / numberOfSpheresAtEquator;
  float radiusAngle = 0;
  float radiusInc = TWO_PI / numberOfSpheresAtEquator;

  for (int i = 1; i <= numberOfSpheresAtEquator; i++) {
    drawSphereLayer(currentRadius, i * verticalPadding);
    currentRadius = sin(radiusAngle) * megaSphereSize;
    println(currentRadius);
    radiusAngle += radiusInc;
  }
}

public void drawSphereLayer(float radius, float y) {

  float angle = 0;
  float currentZOffset = 0;
  float currentXOffset = 0;

  for (int i = 1; i <= numberOfSpheresAtEquator; i ++) {
    currentZOffset = sin(angle) * radius;
    currentXOffset = cos(angle) * radius;
    pushMatrix();

    translate(currentXOffset, y, currentZOffset);

    fill(255, 0, 0);
    box(sphereSize);
    popMatrix();

    angle += TWO_PI / radius;
  }
}

public void drawGuideSphere() {
  pushMatrix();

  translate(0, 0, 0);

  fill(255, 255, 255, 100);
  sphere(megaSphereSize);
  popMatrix();
}
