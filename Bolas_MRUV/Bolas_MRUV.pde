float tAtual = 0;
float vInicialx = 10;
float vInicialy = 10;
float aAtual = 3;
float dAtualx;
float dAtualy;

void setup(){
  size(600,600);
  frameRate(10);
}

void draw(){
  background(255);
  mostraMundo(50);
  dAtualy = MRUV(vInicialy, aAtual, tAtual);
  dAtualx = MRU(vInicialx,tAtual);
  println("dx: "+ dAtualx + " dy: "+ dAtualy + " a: "+ aAtual);
  ellipse(dAtualx,dAtualy, 10, 10);
  tAtual++;
  if (dAtualx >= 600)
    aAtual = aAtual *-1;
  //if(dAtualx <= 0)
  //  aAtual = aAtual *-1;
  if(dAtualy >= height)
    aAtual = aAtual*-1;

}

float MRUV(float v, float a, float t){
float d;
d = (v * t + a * t * t / 2);
return(d);
}

float MRU (float t, float v){
  float d;
  d = v*t;
  return d;
}

void mostraMundo(int tamanho){
  fill(255);
  for (int i = 0; i<(width/tamanho); i++)
    for (int j = 0;j<(height/tamanho); j++)
      rect(i*tamanho,j*tamanho,tamanho,tamanho);
}
