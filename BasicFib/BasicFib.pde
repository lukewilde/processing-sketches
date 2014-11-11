int totalCircles = 0;
int i = 1;

void setup() {
  size(400, 400);
  fill(0);
  frameRate(10);
}

void draw() {
  println(fib(i++));
}

int fib(int x) {
  if (x <= 1) {
    return 1;
  }

  return fib(x - 2) + fib(x - 1);
}
