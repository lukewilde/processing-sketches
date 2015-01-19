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

  stroke(39, 169, 17);
  drawnCornerLines(getLinePoints(0, 0));
}

void drawnCornerLines(float[][] points) {
  for (int i = 0; i < points.length; i++) {
    println("x: " + points[i][0] + ", y: " + points[i][1]);
  }
}

float[][] getLinePoints(float sourceX, float sourceY) {
  sourceX = sourceX / size;
  sourceY = sourceY / size;
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
    return getPointsFor(sourceX, incrementor, sourceY, 0);
  } else {
    // modulate y
    return getPointsFor(sourceX, 0, sourceY, incrementor);
  }
}

float[][] getPointsFor(float startingX, float xIncrementor, float startingY, float yIncrementor) {

  float[][] points = new float[numberOfLines][2];
  float currentX = startingX;
  float currentY = startingY;

  for (int i = 0; i < numberOfLines; ++i) {
    points[i][0] = currentX += (startingX + xIncrementor);
    points[i][1] = currentY += (startingY + yIncrementor);
  }

  return points;
}
