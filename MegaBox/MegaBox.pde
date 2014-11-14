import processing.opengl.*;

int boxSize = 100;
int padding = 0;
int megaBoxSizeFactor = 10;
int megaBoxSize = megaBoxSizeFactor * (boxSize + padding);
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
  sideOffset = width / 2 - megaBoxSize / 2;
  noStroke();
}

void draw(){
  background(100, 100, 150);

 int currentX = 0;
 int currentY = 0;
 float currentZ = 0;

 angle += speed;

 lights();

 cameraX = sin(mouseX * TWO_PI / 720) * megaBoxSize + width / 2;
 // Y rotation is a bit gnarley because the camera always faced the centre.
 cameraY = sin(mouseY * TWO_PI / 720) * megaBoxSize + height / 2;
 cameraZ = cos((mouseX + mouseY) * TWO_PI / 720) * megaBoxSize;

 camera(cameraX, cameraY, cameraZ, width / 2, height / 2, 0, 0, -1, 0);

 for (int i = 1; i < megaBoxSizeFactor; i ++) {
   for (int j = 1; j < megaBoxSizeFactor; j ++) {

     currentX = sideOffset + (i * (boxSize + padding));
     currentY = sideOffset + (j * (boxSize + padding));
     currentZ = sin(angle + (dist(width / 2, height / 2, currentX, currentY)) * 0.0099) * -boxSize;

     pushMatrix();
     translate(currentX, currentY, currentZ);
     fill(100, map(currentZ, 0, scalar, 0, 255), 200);
     box(boxSize);
     popMatrix();
   }
 }
}
