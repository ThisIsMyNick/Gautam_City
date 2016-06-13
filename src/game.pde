void gameInput()
{
    //finds which column was clicked on
    int column = (mouseX - 10) / 110;

    //if every circle in the column in filled (not white), dont do anything
    if (board[0][column].colorNow != Info.WHITE)
    {
        return;
    }

    //if there is at least one white circle in the column, fill it with red or black
    for (int x = 5; x >= 0; x--){
        if (board[x][column].colorNow == Info.WHITE)
        {
            //change color to red
            if (turn%2 == 0)
            {
                board[x][column].colorNow = Info.RED;
                turn++;
                return;
            }
            //change color to black
            if (turn%2 == 1)
            {
                board[x][column].colorNow = Info.BLACK;
                turn++;
                return;
            }
        }
    }
}

void drawGame()
{
    background(0,191,255);
    for (Circle[] a: board)
    {
        for (Circle b: a)
        {
            switch(b.colorNow)
            {
                case Info.WHITE:
                    fill(255,255,255);
                    break;
                case Info.RED:
                    fill(255,0,0);
                    break;
                case Info.BLACK:
                    fill(0,0,0);
                    break;
            }
            b.draw();
        }
    }
}


void clearBoard()
{
    turn = 0;
    for (int i = 0; i < 6; ++i)
    {
        for (int j = 0; j < 7; ++j)
        {
            board[i][j].clear();
        }
    }
}


int win()
{
    //Horizontal
    for (int i = 0; i < 6; ++i)
    {
        for (int j = 0; j < 7-3; ++j)
        {
            if (getColor(i,j) != Info.WHITE
                && getColor(i,j) == getColor(i,j+1)
                && getColor(i,j) == getColor(i,j+2)
                && getColor(i,j) == getColor(i,j+3))
                    return getColor(i,j);
        }
    }

    //Vertical
    for (int i = 0; i < 6-3; ++i)
    {
        for (int j = 0; j < 7; ++j)
        {
            if (getColor(i,j) != Info.WHITE
                && getColor(i,j) == getColor(i+1,j)
                && getColor(i,j) == getColor(i+2,j)
                && getColor(i,j) == getColor(i+3,j))
                    return getColor(i,j);
        }
    }

    //Diagonals
    for (int i = 0; i < 6-3; ++i)
    {
        for (int j = 0; j < 7-3; ++j)
        {
            if (getColor(i,j) != Info.WHITE
                && getColor(i,j) == getColor(i+1,j+1)
                && getColor(i,j) == getColor(i+2,j+2)
                && getColor(i,j) == getColor(i+3,j+3))
                    return getColor(i,j);
        }
    }
    for (int i = 3; i < 6; ++i)
    {
        for (int j = 0; j < 7-3; ++j)
        {
            if (getColor(i,j) != Info.WHITE
                && getColor(i,j) == getColor(i-1,j+1)
                && getColor(i,j) == getColor(i-2,j+2)
                && getColor(i,j) == getColor(i-3,j+3))
                    return getColor(i,j);
        }
    }

    return Info.WHITE;
}
