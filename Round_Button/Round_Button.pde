boolean clickDetected = false;
int xBox,yBox,circleSize,boxWidth,boxHeight;

void setup(){
    size(800,600);
    boxWidth = 300;
    boxHeight = 300;
    circleSize = 100;
    xBox = 200;
    yBox = 100;
    noStroke();
    textSize(28);
}


void draw() {
    background(180);
    fill(0);
    text("Click Detected: "+ clickDetected,width/10,height/10);
    fill(255);
    rectMode(CORNER);
    rect(xBox,yBox+(circleSize/2),boxWidth+circleSize,boxHeight);
    rect(xBox+(circleSize/2),yBox,boxWidth,boxHeight+circleSize);
    ellipse(xBox+(circleSize/2),yBox+(circleSize/2),circleSize,circleSize);
    ellipse(xBox+(circleSize/2)+boxWidth,yBox+(circleSize/2),circleSize,circleSize);
    ellipse(xBox+(circleSize/2),yBox+(circleSize/2)+boxHeight,circleSize,circleSize);
    ellipse(xBox+(circleSize/2)+boxWidth,yBox+(circleSize/2)+boxHeight,circleSize,circleSize);
    fill(0);
    rectMode(CENTER);
    rect(width/2,height/2,30,30);
}

void mouseClicked(){
    if((((((
    checkCollisionBox(xBox,yBox+(circleSize/2),boxWidth+circleSize,boxHeight))||
    checkCollisionBox(xBox+(circleSize/2),yBox,boxWidth,boxHeight+circleSize))||
    checkCollisionCircle(xBox+(circleSize/2),yBox+(circleSize/2),circleSize))||
    checkCollisionCircle(xBox+(circleSize/2)+boxWidth,yBox+(circleSize/2),circleSize))||
    checkCollisionCircle(xBox+(circleSize/2),yBox+(circleSize/2)+boxHeight,circleSize))||
    checkCollisionCircle(xBox+(circleSize/2)+boxWidth,yBox+(circleSize/2)+boxHeight,circleSize)){
        clickDetected = true;
        println(xBox,yBox);
        println(boxWidth+circleSize,boxHeight+circleSize);
    }
    else{
        clickDetected= false;
    }
    println ("Clique Detectado: " + clickDetected);
}

boolean checkCollisionBox(int xCaixa, int yCaixa, int largura, int altura)  {
  if ((mouseX >= xCaixa && mouseX <= xCaixa+largura &&
      mouseY >= yCaixa && mouseY <= yCaixa+altura))
    return true;
  else
    return false;
}

boolean checkCollisionCircle(int xCirculo, int yCirculo, int diametro) {
  if (sqrt(sq(xCirculo - mouseX) + sq(yCirculo - mouseY)) < diametro/2 )
    return true;
  else
    return false;
}
