// source: http://i.imgur.com/U5rGnZ2.jpg

int width = 400;
int height = 400;
int numberOfDivisionLines = 10;

void setup() {
  size(width, height);
  background(0, 43, 55);
  frameRate(60);
}

void draw(){
  background(0, 43, 55);

  stroke(39, 169, 17);
}

void drawnCornerLines(int x, int y) {

}

void getRangeOfPoints(int sourceX, int sourceY) {
  int[] points = new int[length];

  sourceX = sourceX / width;
  sourceY = sourceY / height;

  // x: 0, y: 0 = x+
  // x: 1, y: 0 = y+
  // x: 0, y: 1 = y-
  // x: 1, y: 1 = x-



  for (int i = 0; i < numberOfDivisionLines; ++i) {
    if (x === y) {
      // modulate x
    } else {
      // modulate y
    }

    if (y === 0) {
      // positive modulation
    } else {
      // negative modulation
    }
  }
}
