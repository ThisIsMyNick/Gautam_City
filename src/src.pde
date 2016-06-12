int turn;
Circle[][] board= new Circle[6][7];

void setup()
{
  turn = 0;
  size(790,680);
  //instantiate each circle;
  for (int x = 0; x < 7; x++)
  {
    for (int y = 0; y < 6; y++)
    {
      board[y][x] = new Circle(x,y);
    }
  }
}

void draw()
{
  int winner = win();
  if (winner == 4)
  {
    background(0,0,0);
  }
  
  if (winner == 8)
  {
    background(255,255,255);
  }
  
  if(winner != 4 && winner != 8)
  {
    background(0,191,255);
    //draws each circle
    for (Circle[] a: board)
    {
      for (Circle b: a)
      {
        switch(b.colorNow){
          //circle is white
          case 0: 
            fill(255,255,255);
            break;
          //circle is red
          case 1: 
            fill(255,0,0);
            break;
          //circle is black
          case 2: 
            fill(0,0,0);
            break;
        }
        b.draw();
      }
    }
  }
}

void mouseClicked()
{
  //finds which column was clicked on
  int column = (mouseX - 10) / 110;
  
  //if every circle in the column in filled (not white), dont do anything
  if (board[0][column].colorNow != 0)
  {
    return;
  }
  
  //if there is at least one white circle in the column, fill it with red or black
  for (int x = 5; x >= 0; x--){
    if (board[x][column].colorNow == 0)
    {
      //change color to red
      if (turn%2 == 0)
      {
        board[x][column].colorNow = 1;
        turn++;
        return;
      }
      //change color to black
      if (turn%2 == 1)
      {
        board[x][column].colorNow = 2;
        turn++;
        return;
      }
    }
  }
}
  
  
int win(){
  //horizontal
  for (int a=0; a < 7; a++) 
  {
    for (int b=0; b < 3; b++) 
    {
      if(board[b][a].colorNow == board[b+1][a].colorNow && 
         board[b][a].colorNow == board[b+2][a].colorNow &&
         board[b][a].colorNow == board[b+3][a].colorNow)
      {
         return board[b][a].colorNow;
      }
    }
  }
 
 
  //vertical
  for (int a=0; a < 4; a++) 
  {
    for (int b=0; b < 6; b++) 
    {
      if(board[b][a].colorNow == board[b][a+1].colorNow && 
         board[b][a].colorNow == board[b][a+2].colorNow &&
         board[b][a].colorNow == board[b][a+3].colorNow)
      {
         return board[b][a].colorNow;
      }
    }
  }
 
 
  //diagonals (up-left to down-right
  for (int a=0; a < 4; a++) 
  {
    for (int b=0; b < 3; b++) 
    {
      if(board[b][a].colorNow == board[b+1][a+1].colorNow && 
         board[b][a].colorNow == board[b+2][a+2].colorNow &&
         board[b][a].colorNow == board[b+3][a+2].colorNow)
      {
         return board[b][a].colorNow;
      }
    }
  }
  
  
  //diagonals (up-right to down-left)
  for (int a=0; a < 4; a++) 
  {
    for (int b=3; b < 6; b++) 
    {
      if(board[b][a].colorNow == board[b-1][a+1].colorNow && 
         board[b][a].colorNow == board[b-2][a+2].colorNow &&
         board[b][a].colorNow == board[b-3][a+3].colorNow)
      {
         return board[b][a].colorNow;
      }
    }
  }
  return 0;
}

  
class Circle
{
  int xcor,ycor;
  color colorNow;
  
  Circle(int x,int y)
  {
    xcor = 65 + 110 * x;
    ycor = 65 + 110 * y;
    colorNow = 0;
  }
  
  void draw() 
  {
    ellipse(xcor,ycor,90,90);
  }
}