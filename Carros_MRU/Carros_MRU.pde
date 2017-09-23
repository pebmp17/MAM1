float tAtual = 0;
float vAtual = 10;
boolean continue = true;


float[] vCarros = new float[20];
float[] fCarros = new float[20][1][1];
float[] xCarros = new float [20];

void setup() {
  size(600,600);
  frameRate(1);
  for(int i = 0; i<20; i++){
    vCarros[i] = random(1,12);
    fcarros[i] = random (255);
    fCarros[i][0] = random(255);
    fCarros[i][0][0] = random(255);
  }
}

void draw(){
  mostraMundo(50);
  for (int i = 0; i<20; i++){
    xCarros[i] = MRU(vCarros[i],tAtual);
    if (xCarros>= width) continue = false;
    println(i);
    fill(fCarros[i],fCarros[0],fCarros[0]);
    rect (dAtual,i*30,20,20);
  }
  if (continue) tAtual++;
}

void mostraMundo(int tamanho){
  for (int i = 0; i<(width/tamanho); i++)
    for (int j = 0;j<(height/tamanho); j++)
      rect(i*tamanho,j*tamanho,tamanho,tamanho);
}

float MRU(float v, float t){
  float d;
  d = v*t;
  return (d);
}
