float tAtual = 0;
float vInicialx = 10;
float vInicialy = 30;
float aAtual = - 10;
float dAtualx;
float dAtualy;
float[] pos  = new float[2];
void setup(){
  size(600,600);
  frameRate(10);
}

void draw(){
  background(255);
  mostraMundo(50);
  pos = lancamento(vInicialx,vInicialy,aAtual,tAtual);
  println("dx: "+ dAtualx + " dy: "+ dAtualy + " a: "+ aAtual);
  ellipse(pos[0],pos[1], 10, 10);
  tAtual++;
  if (pos[0] <0) pos[0] = 0;
  if (pos[1] <0) pos[1] = 0;
}

float MRUV(float v, float a, float t){
  float d;
  d = (v*t + a*t*t/ 2);
  return(d);
}

float MRU (float t, float v){
  float d;
  d = v*t;
  return(d);
}

float[] lancamento(float vx, float vy, float a, float t){
  float[] result = new float[2];
  result[0] = MRU(vx,t);
  result[1] = MRUV(vy,a,t);
  return(result);
}

void mostraMundo(int tamanho){
  fill(255);
  for (int i = 0; i<(width/tamanho); i++)
    for (int j = 0;j<(height/tamanho); j++)
      rect(i*tamanho,j*tamanho,tamanho,tamanho);
}
