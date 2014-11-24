import processing.opengl.*;

int boxSize = 100;
int padding = 0;
int megaSphereSizeFactor = 10;
int megaSphereSize = megaSphereSizeFactor * (boxSize + padding);
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

  // cameraX = sin(mouseX * TWO_PI / 720) * megaSphereSize + width / 2;
  // // Y rotation is a bit gnarley because the camera always faced the centre.
  // cameraY = sin(mouseY * TWO_PI / 720) * megaSphereSize + height / 2;
  // cameraZ = cos((mouseX + mouseY) * TWO_PI / 720) * (megaSphereSize * 2);

  camera(0, 0, 3200, width / 2, height / 2, 0, 0, -1, 0);

  drawGuideSphere();
}

public void drawGuideSphere() {
  pushMatrix();

  translate(width / 2, height / 2, 0);

  fill(255, 255, 255, 100);
  sphere(megaSphereSize);
  popMatrix();
}
