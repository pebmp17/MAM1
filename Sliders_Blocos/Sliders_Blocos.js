var colunas = 0, linhas = 0;
var check = new Array(2);
var gui = new dat.GUI();

function setup(){
  createCanvas(400,450);
  check[0]=0; check[1]=0;
  background(33,33,33);
  noStroke();
}

function draw(){
  if (check[0] != linhas || check[1] != colunas){
    background(33,33,33);
    for(var i=0; i<round(colunas);i++)
      for(var j=0; j<round(linhas);j++)
        bloco(100*i, 100*j+50, 100);
    }
   check[0] = linhas;
   check[1] = colunas;
}

function circulo(x,y,r){
  fill(random(255),random(255),random(255));
  ellipse(x,y,r,r);
}

function bloco(x,y,t){
  fill(random(255),random(255),random(255));
  rect(x,y,t,t);
  circulo(x+t/2,y+t/2,(t));
  circulo(x+t/2,y+t/2,(t/2)+int(random(5,35)));
  circulo(x+t/2,y+t/2,(t/int(random(4,7))+int(random(5,20))));
}

window.onload = function() {
  gui.add(text,'linhas',0,4);
  gui.add(text,'colunas',0,4);
}
