// source: http://i.imgur.com/U5rGnZ2.jpg

int size = 400;
int numberOfLines = 10;

void setup() {
  size(size, size);
  background(0, 43, 55);
  frameRate(60);
}

void draw(){
  background(0, 43, 55);

  drawCornerLines(0, 0);
  drawCornerLines(1, 0);
  drawCornerLines(1, 1);
  drawCornerLines(0, 1);
  // exit();
}

void drawCornerLines(float sourceX, float sourceY) {

  stroke(39, 169, 17);

  sourceX *= size;
  sourceY *= size;

  float[][] lines = getLinesForCorner(sourceX, sourceY);

  for (int i = 0; i < lines.length; i++) {
    line(sourceX, sourceY, lines[i][0], lines[i][1]);
  }
}

float[][] getLinesForCorner(float sourceX, float sourceY) {
  float incrementor = size / numberOfLines;

  // x: 0, y: 0 = x+
  // x: 1, y: 0 = y+
  // x: 0, y: 1 = y-
  // x: 1, y: 1 = x-

  if (sourceY == 0) {
    // positive modulation
  } else {
    // negative modulation
    incrementor *= -1;
  }

  if (sourceX == sourceY) {
    // modulate x
    return getLines(sourceX, incrementor, sourceY, 0);
  } else {
    // modulate y
    return getLines(sourceX, 0, sourceY, incrementor);
  }
}

float[][] getLines(float startingX, float xIncrementor, float startingY, float yIncrementor) {

  float[][] points = new float[numberOfLines][2];
  float currentX = startingX;
  float currentY = startingY;

  for (int i = 0; i < numberOfLines; ++i) {
    points[i][0] = currentX += xIncrementor;
    points[i][1] = currentY += yIncrementor;

    if (points[i][0] == size) {
      points[i][0] = 0;
    } else if (points[i][0] == 0) {
      points[i][0] = 400;
    }

    if (points[i][1] == size) {
      points[i][1] = 0;
    } else if (points[i][1] == 0) {
      points[i][1] = 400;
    }
  }

  return points;
}
