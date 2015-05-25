float a = 0;
int numberOfLines = 25;
int maxWidth = 800;
int maxHeight = 300;
float lineHeight = 80;
int padding = 20;
float inc = PI / 180;
float x = 0;
float y1 = 0;
float y2 = 0;
float[] radix = new float[numberOfLines];

void setup() {
  size(maxWidth + padding * 2, maxHeight + padding * 2);
  background(0, 43, 55);
  frameRate(60);
}

void draw(){
  background(0, 43, 55);

  stroke(39, 169, 17);

  for (int i = 1; i <= numberOfLines -1; i++) {

    x = padding + maxWidth / numberOfLines * i;
    y1 = sin(radix[i]) * (height / 3) + height / 3  + lineHeight / 3;
    y2 = y1 + lineHeight;
    line(x, y1, x, y2);
    radix[i] += inc * ((i + 10) * 0.4);
  }
}
