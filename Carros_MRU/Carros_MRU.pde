float tAtual = 0;
float vAtual = 10;
int end = 0;


float[] vCarros = new float[20];
float[][] fCarros = new float[20][3];
float[] xCarros = new float [20];

void setup() {
  size(600,600);
  frameRate(10);
  for(int i = 0; i<20; i++){
    vCarros[i] = random(1,12);
    fCarros[i][0] = random(255);
    fCarros[i][1] = random(255);
    fCarros[i][2] = random(255);
  }
}

void draw(){
  int indVencedor = 255;
  mostraMundo(50);
  for (int i = 0; i<20; i++){
    xCarros[i] = MRU(vCarros[i],tAtual);
    if (xCarros[i]>= width-20){ end = 1; indVencedor = i;}
    fill(fCarros[i][0],fCarros[i][1],fCarros[i][2]);
    rect (xCarros[i],i*30,20,20);
  }
  saveFrame();
  if (end == 0){
     tAtual++;
  }
  else{
    noLoop();
    background(33,33,33);
    fill(57,158,168);
    textSize(30);
    text("O vencedor foi o carro " + indVencedor, width/2-200, height/2);
    //println ("O vencedor foi o carro " + indVencedor);
  }
}

void mostraMundo(int tamanho){
  fill(33,33,33);
  stroke(57,158,168);
  for (int i = 0; i<(width/tamanho); i++)
    for (int j = 0;j<(height/tamanho); j++)
      rect(i*tamanho,j*tamanho,tamanho,tamanho);
    fill(57,158,168);
    rect(width-20,0,20,height);
}

float MRU(float v, float t){
  float d;
  d = v*t;
  return (d);
}