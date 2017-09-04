import controlP5.*;
ControlP5 gui, gui2;
int colunas = 0;
int linhas = 0;
int check[] = new int [2];


void circulo(int x,int y,int r){
  fill(random(255),random(255),random(255));
  ellipse(x,y,r,r);
}

void bloco(int x,int y, int t){
  fill(random(255),random(255),random(255));
  rect(x,y,t,t);
  circulo(x+t/2,y+t/2,t);
  circulo(x+t/2,y+t/2,t/2+t/5);
  circulo(x+t/2,y+t/2,t/3);
}

void setup(){
  size(600,600);
   gui = new ControlP5(this);
   gui.addSlider("linhas")
       .setRange(0,6)
       .setValue(linhas)
       .setPosition(20,20)
       .setSize(130,20);
   gui2 = new ControlP5(this);
   gui.addSlider("colunas")
       .setRange(0,6)
       .setValue(colunas)
       .setPosition(200,20)
       .setSize(130,20);
  check[0]=0; check[1]=0;
  background(33,33,33);

}

void draw(){
  if (check[0] != linhas || check[1] != colunas){
    background(33,33,33);
    for(int i=0; i<round(colunas);i++)
      for(int j=0; j<round(linhas);j++)
        bloco(100*i, 100*j, 100);
  }
   check[0] = linhas;
   check[1] = colunas;
}
