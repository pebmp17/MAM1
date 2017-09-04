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
  circulo(x+t/2,y+t/2,(t));
  circulo(x+t/2,y+t/2,(t/2)+int(random(5,35)));
  circulo(x+t/2,y+t/2,(t/int(random(4,7))+int(random(5,20))));
}

void setup(){
  size(400,450);
   gui = new ControlP5(this);
   gui.addSlider("linhas")
       .setRange(0,4)
       .setValue(linhas)
       .setPosition(20,15)
       .setSize(130,20)
       .setColorLabel(color(57,158,168));
   gui2 = new ControlP5(this);
   gui.addSlider("colunas")
       .setRange(0,4)
       .setValue(colunas)
       .setPosition(220,15)
       .setSize(130,20)
       .setColorLabel(color(57,158,168));
  check[0]=0; check[1]=0;
  background(33,33,33);
  noStroke();
}

void draw(){
  if (check[0] != linhas || check[1] != colunas){
    background(33,33,33);
    for(int i=0; i<round(colunas);i++)
      for(int j=0; j<round(linhas);j++)
        bloco(100*i, 100*j+50, 100);
  }
   check[0] = linhas;
   check[1] = colunas;
}
