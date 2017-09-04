void setup(){
  int n = 12;
  int posx;
  background(33,33,33);
  stroke(33,33,33);
  size(600,360);
  fill(57,158,168);
  for (int i=0; i<n; i++){
    posx=(550-(i*50)); //<>//
    rect(posx,145,50,50);
  }
}