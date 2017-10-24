void setup(){
  size(600,600);
  noStroke();
  background(33,33,33);
  mostrarBandeiraRectDefault(100,100,300);
  saveFrame();
  //rectMode(CENTER);
  //mostrarBandeiraRectCenter(300,300,300);
  //ellipseMode(CORNER);
  //mostrarBandeiraEllipseCorner(150,150,300);
}

void mostrarBandeiraRectDefault(int xCorner, int yCorner,int altura){
  float unit = altura/14;
  fill(0,255,0);
  rect(xCorner+0,yCorner+0,unit*20,altura);
  fill(255,255,0);
  quad(xCorner+0+1.7*unit,yCorner+altura/2,xCorner+unit*10,yCorner+0+1.7*unit,xCorner+unit*20-1.7*unit,yCorner+altura/2,xCorner+unit*10,yCorner+altura-1.7*unit);
  fill(0,0,255);
  ellipse(xCorner+unit*10,yCorner+altura/2,unit*7,unit*7);
}


void mostrarBandeiraRectCenter(int xCenter, int yCenter,int altura){
  float unit = altura/14;
  fill(0,255,0);
  rect(xCenter,yCenter,unit*20,altura);
  fill(255,255,0);
  quad(xCenter-unit*10,yCenter,xCenter,yCenter-altura/2,xCenter+unit*10,yCenter,xCenter,yCenter+altura/2);
  fill(0,0,255);
  ellipse(xCenter,yCenter,unit*7,unit*7);
}

void mostrarBandeiraEllipseCorner(int xCorner, int yCorner,int altura){
  float unit = altura/14;
  fill(0,255,0);
  rect(xCorner+0,yCorner+0,unit*20,altura);
  fill(255,255,0);
  quad(xCorner+0,yCorner+altura/2,xCorner+unit*10,yCorner+0,xCorner+unit*20,yCorner+altura/2,xCorner+unit*10,yCorner+altura);
  fill(0,0,255);
  ellipse(xCorner+unit*10-3.5*unit,(yCorner+altura/2)-unit*3.5,unit*7,unit*7);
}