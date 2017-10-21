float vInicialx = 30;
float vInicialy = 50;
float aAtual =  10;

float dAtualx=0;
float dAtualy=0;

float tAtual = 0;
float[] pos  = new float[2];

void setup(){
  size(800,600);
  frameRate(10);
}

void draw(){
  background(255);
  mostraMundo(50);
  pos = lancamento(vInicialx,vInicialy,aAtual,tAtual);
  dAtualx += pos[0]/60;
  dAtualy += pos[1]/60;
  if (dAtualy < 0) {
    tAtual = 0;
    vInicialx = vInicialx/2;
    vInicialy = vInicialy/2;
    dAtualy = -dAtualy;
  }
  if (dAtualy > 600) {
    tAtual = 0;
    vInicialx = vInicialx/2;
    vInicialy = vInicialy/2;
    dAtualy = -dAtualy;
  }
  println("dx: "+ dAtualx + " dy: "+ dAtualy + " a: "+ aAtual + " tAtual: "+tAtual);
  ellipse(dAtualx,dAtualy, 10, 10);
  tAtual++;
}

float[] lancamento(float vx, float vy, float a, float t){
  float[] result = new float[2];
  result[0] = MRU(vx,t);
  result[1] = MRUV(vy,a,t);
  return(result);
}

float MRUV(float v, float a, float t){
    float d;
    d = (v * t + a * t * t / 2);
    return(d);
}

float MRU (float t, float v){
  float d;
  d = v*t;
  return(d);
}

void mostraMundo(int tamanho){
  fill(255);
  for (int i = 0; i<(width/tamanho); i++)
    for (int j = 0;j<(height/tamanho); j++)
      rect(i*tamanho,j*tamanho,tamanho,tamanho);
}
