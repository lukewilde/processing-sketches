import processing.opengl.*;

int boxSize = 100;
int padding = 0;
int megaSphereSizeFactor = 10;
int megaSphereSize = megaSphereSizeFactor * (boxSize + padding);
int sideOffset = 0;
float angle = 0;
float speed = 0.05;
int scalar = 60;
float rotation = 0;

float cameraX = 0;
float cameraZ = 0;
float cameraY = 0;

void setup() {
  size(800, 800, OPENGL);
  sideOffset = width / 2 - megaSphereSize / 2;
  noStroke();
}

void draw(){
  background(100, 100, 150);

  float currentX = 0;
  float currentY = 0;
  float currentZ = 0;

  angle += speed;

  lights();

  // cameraX = sin(mouseX * TWO_PI / 720) * megaSphereSize + width / 2;
  // // Y rotation is a bit gnarley because the camera always faced the centre.
  // cameraY = sin(mouseY * TWO_PI / 720) * megaSphereSize + height / 2;
  // cameraZ = cos((mouseX + mouseY) * TWO_PI / 720) * megaSphereSize;

  // camera(cameraX, cameraY, cameraZ, width / 2, height / 2, 0, 0, -1, 0);

  for (int i = 1; i < megaSphereSizeFactor; i ++) {

    int numberOfBoxes = floor(sin(i * TWO_PI / 360) * megaSphereSizeFactor);
    println(i * TWO_PI / 360);

    for (int j = 1; j < numberOfBoxes; j ++) {

      currentX = sin(j * TWO_PI / 360) * numberOfBoxes;
      currentY = j * (boxSize + padding);
      currentZ = cos(j * TWO_PI / 360) * numberOfBoxes;

      pushMatrix();
      translate(currentX, currentY, currentZ);
      fill(100, map(currentZ, 0, scalar, 0, 255), 200);
      sphere(boxSize);
      popMatrix();
    }
  }
}
