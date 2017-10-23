float i = 0;
void setup(){
  size(800, 600);
  background(33,33,33);
  fill(57,158,168);
}

void draw(){
  background(0);
  interpolacao2D(0,0,700,500,100);
  text("Aperte qualquer tecla para reiniciar a animação", 20,20);
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

void keyPressed(){
    interpolacao2D(0,0,700,500,100);
}