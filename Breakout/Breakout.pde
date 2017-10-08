int xBola = 30;
int yBola = 40;
float veloY = 4;
float veloX = 8;
int xBarra = 0;
int raio = 10;
int barWidth = 100;
int barHeight = 20;

int xBonusRaio = 10;
int yBonusRaio = 280;
int xBonusColor = 520;
int yBonusColor = 20;
boolean bonusColor;
void setup(){
  size(800,600);
}

void draw(){
  background(0);
  fill(255);
  rect(xBonusRaio,yBonusRaio,10,10);
  fill(random(255),random(255),random(255));
  rect(xBonusColor,yBonusColor,10,10);
  if (!bonusColor)
  	fill(255);
  rect(xBarra,height-barHeight,barWidth,barHeight);
  ellipse(xBola,yBola,raio,raio);
  xBola+=veloX;
  yBola+=veloY;
  if ((xBola +raio/2 >= xBarra && xBola + raio/2 <= xBarra + barWidth) && (yBola + raio/2 >= height-barHeight &&  yBola + raio/2 <= height))
	veloY *= -1;
	if (xBola >= width -raio/2 || xBola <= raio/2)
		veloX *= -1;
  	if (yBola <= raio/2)
		veloY *= -1;
  	if (keyPressed){
		if (keyCode == RIGHT)
	   	xBarra += 12;
		else if (keyCode == LEFT)
	   	xBarra -= 12;
		if (xBarra >= width-barWidth)
			xBarra = width-barWidth;
		if (xBarra <= 0)
		xBarra = 0;
	}
	if((xBola >= xBonusRaio && xBola <= xBonusRaio + raio/2) && (yBola >= yBonusRaio && yBola <= yBonusRaio + raio/2))
  		raio += raio/8;
	if((xBola >= xBonusColor && xBola <= xBonusColor + raio/2) && (yBola >= yBonusColor && yBola <= yBonusColor + raio/2))
	  	bonusColor = true;
}

void keyPressed(){
  if (key == 'r'){
	xBola = 30;
	yBola = 30;
  }
}
