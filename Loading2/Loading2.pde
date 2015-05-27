float a = 0;
int numberOfLines = 50;
int maxWidth = 800;
int maxHeight = 300;
float lineHeight = 80;
int padding = 20;
float inc = PI / 270;
float x = 0;
float y1 = 0;
float y2 = 0;
float[] smallRadix = new float[numberOfLines];
float[] wideRadix = new float[numberOfLines];

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
    y1 = 150 + sin(smallRadix[i]) * 50 + padding;
    y2 = 150 + sin(wideRadix[i]) * 120 + padding;
    line(x, y1, x, y2);
    smallRadix[i] += inc * ((i + 10) * 0.2);
    wideRadix[i] += inc * ((i + 15) * 0.2);
  }
}
