float i = 0;

void setup(){
  size(300, 300);
}

void draw(){
  background(0);
  interpolacao2D(0,0,290,290,100);
}

void MoveCaixa(int xInicial, int xFinal, int passos){
  if (i <= 1){
    rect(xInicial + i * (xFinal-xInicial), 200, 10, 10);
    i = i + (1.0 / passos);
  }
  else{
    rect(xInicial + i * (xFinal-xInicial), 200, 10, 10);
  }
}

void interpolacao2D(int xInicial, int yInicial, int xFinal, int yFinal, int passos){
  if (i <= 1){
      rect(xInicial + i * (xFinal-xInicial), yInicial + i * (yFinal-yInicial), 10, 10);
      i = i + (1.0 / passos);
  }
  else{
      rect(xInicial + i * (xFinal-xInicial), yInicial + i * (yFinal-yInicial), 10, 10);
  }
}
