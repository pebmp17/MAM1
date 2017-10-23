PImage imgWood, imgStone;
int[][] mapa = { {1, 1, 1, 1, 1, 1, 1, 0},
                 {0, 0, 0, 0, 0, 0, 1, 0},
                 {0, 1, 1, 1, 1, 0, 1, 0},
                 {0, 1, 0, 0, 1, 0, 1, 0},
                 {0, 1, 0, 1, 1, 0, 1, 0},
                 {0, 1, 0, 0, 0, 0, 1, 0},
                 {0, 1, 1, 1, 1, 1, 1, 0},
                 {0, 0, 0, 0, 0, 0, 0, 0} };

void setup() {
    size(800, 600);
    imgWood = loadImage("tileWood.png");
    imgStone = loadImage("tileStone.png");
    mostraMapa();
}

void mostraMapa() {
    for(int i=0; i<8; i++){
        for(int j=0; j<8; j++){
            switch(mapa[j][i]){
                case 0:
                    image(imgWood,(350-i*31 + j*31), (i*15 + j*15)+300);
                    break;
                case 1:
                    image(imgStone,(350-i*31 + j*31), (i*15 + j*15)+300);
                    break;
            }
        }
    }
}