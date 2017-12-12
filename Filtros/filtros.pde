PImage img[] = new PImage[6];
int i;
void setup() {
  size(800, 800);
  img[0] = loadImage("original.jpg");
  for (int i = 1; i<=5; i++) {
    img[i] = loadImage("originalToMod.png");
  }
  img[2] = aplicarRuido(img[2], 400);
  img[3] = aplicarRuido(img[3], 800);
  img[4] = aplicarRuido(img[4], 800);
  img[5] = aplicarRuido(img[5], 800);
  img[3] = paintItGrey(img[3]);
  img[4] = paintItRed(img[4]);
  img[5] = paintItYellow(img[5]);
}

void draw() {
  background(18);
  if (i<100) {
    showOriginal();
  } else if ((i>=100)&&(i<320)) {
    showResults();
  } else {
    i=0;
  }
  i++;
  println(i);
}

PImage aplicarRuido(PImage entrada, int quantidade) {
  int i = 0;
  PImage saida = entrada;
  while (i<quantidade) {
    int r, g, b, x, y;
    r = round(random(0, 255));
    g = round(random(0, 255));
    b = round(random(0, 255));
    x = round(random(0, 400));
    y = round(random(0, 400));
    saida.set(x, y, color(r, g, b));
    i++;
  }
  return saida;
}

PImage paintItGrey(PImage entrada) {
  PImage saida = entrada;
  float r;
  for (int x= 0; x<400; x++) {
    for (int y = 0; y<400; y++) {
      r = red(saida.get(x, y));
      saida.set(x, y, color(r,r,r));
    }
  }
  return saida;
}

PImage paintItRed(PImage entrada) {
  PImage saida = entrada;
  float r;
  for (int x= 0; x<400; x++) {
    for (int y = 0; y<400; y++) {
      r = red(saida.get(x, y));
      saida.set(x, y, color(r, 0, 0));
    }
  }
  return saida;
}

PImage paintItYellow(PImage entrada) {
  PImage saida = entrada;
  float r;
  for (int x= 0; x<400; x++) {
    for (int y = 0; y<400; y++) {
      r = red(saida.get(x, y));
      saida.set(x, y, color(r, r, 0));
    }
  }
  return saida;
}

void showOriginal() {
  image(img[0], 80, 80);
}

void showResults() {
  image(img[2], 0, 0);
  image(img[3], 400, 0);
  image(img[4], 0, 400);
  image(img[5], 400, 400);
}