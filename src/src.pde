PImage board;

void setup()
{
    size(640,480);
    board = loadImage("../Connect4Board.png");
}

void draw()
{
    image(img,0,0);
}
