PImage img; //<>//
int num = 8, espacamento;
PImage pieces[] = new PImage[9];

void setup() {
  size(800, 800);
  img = loadImage("imagem.jpg");
  espacamento = width/num;
  for (int i = 0; i<num; i++) {
    pieces[i] = new PImage(espacamento, height);
  }
  for (int x = 0; x<espacamento; x++) {
    for (int y =0; y<800; y++) {
      for (int ind=0; ind<num; ind++) {
        color c = img.get(x+(espacamento*ind), y);
        pieces[ind].set(x, y, c);
      }
    }
  }
}

int posXpieces[] =  new int [num];
int resetTimer =0;
void draw() {
  background(120);
  for (int i=0; i<num; i++) {
    image(pieces[i], posXpieces[i]+(i*espacamento), 0);
    if(i%2==0){
          posXpieces[i]+=2;
    }
    else{
           posXpieces[i]-=2;
    }
  }
  if(resetTimer<405){
    resetTimer++;
  }
  else{
   resetTimer=0;
   for(int i = 0; i<num; i++){
    posXpieces[i] = 0;
   }
  }
}
float i;
void interpolacao2D(int xInicial, int yInicial, int xFinal, int yFinal, int passos) {
  if (i <= 1) {
    rect(xInicial + i * (xFinal-xInicial), yInicial + i * (yFinal-yInicial), 15, 15);
    i = i + (1.0 / passos);
  } else {
    rect(xInicial + i * (xFinal-xInicial), yInicial + i * (yFinal-yInicial), 15, 15);
  }
}