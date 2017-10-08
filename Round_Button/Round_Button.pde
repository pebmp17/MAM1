boolean clickDetected = false;
int xBox,yBox,circleSize,boxWidth,boxHeight;

void setup(){
    size(800,600);
    xBox = width/2;
    yBox = height/2;
    boxWidth = width/4;
    boxHeight = height/4;
    circleSize = 60;
    rectMode(CENTER);
    noStroke();
}


void draw() {
    fill(255);
    ellipse(xBox-(boxWidth/2),yBox-(boxHeight/2),circleSize,circleSize);
    ellipse(xBox-(boxWidth/2),yBox+(boxHeight/2),circleSize,circleSize);
    ellipse(xBox+(boxWidth/2),yBox-(boxHeight/2),circleSize,circleSize);
    ellipse(xBox+(boxWidth/2),yBox+(boxHeight/2),circleSize,circleSize);
    rect(xBox,yBox,boxWidth+circleSize,boxHeight);
    rect(xBox,yBox,boxWidth,boxHeight+circleSize);


}

void mouseClicked(){
    if (((mouseX>xBox)&&(mouseX<xBox+boxWidth))&&((mouseY>yBox)&&(mouseY<yBox+boxHeight)))
        clickDetected = true;
    else{
        clickDetected = false;
    }
    println ("Clique Detectado: " + clickDetected);
}
