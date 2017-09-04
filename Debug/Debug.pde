int n = 12;
int i=0, posx;
void setup(){
  background(33,33,33);
  stroke(33,33,33);
  size(600,360);
  fill(57,158,168);
  frameRate(4);
}

void draw(){
  if (i<n){
    posx =550-(i*50);
    rect(posx,145,50,50);
    i++;
  }
  else{
    background(33,33,33);
    i = 0;
  }
}
