boolean gameInput()
{
    //finds which column was clicked on
    int column = (mouseX - 10) / 110;

    //if every circle in the column in filled (not white), dont do anything
    if (board[0][column].colorNow != Info.WHITE)
    {
        return false;
    }
    int col;
    if (turn % 2 == 0) col = Info.RED;
    else col = Info.BLACK;
    placeTile(board, column, col);
    return true;
}

void placeTile(Circle[][] _board, int column, int col)
{
    for (int x = 5; x >= 0; --x)
    {
        if (getColor(_board, x, column) == Info.WHITE)
        {
            _board[x][column].colorNow = col;
            return;
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


int win(Circle[][] _board)
{
    //Horizontal
    for (int i = 0; i < 6; ++i)
    {
        for (int j = 0; j < 7-3; ++j)
        {
            if (getColor(_board, i,j) != Info.WHITE
                && getColor(_board, i,j) == getColor(_board, i,j+1)
                && getColor(_board, i,j) == getColor(_board, i,j+2)
                && getColor(_board, i,j) == getColor(_board, i,j+3))
                    return getColor(_board, i,j);
        }
    }

    //Vertical
    for (int i = 0; i < 6-3; ++i)
    {
        for (int j = 0; j < 7; ++j)
        {
            if (getColor(_board, i,j) != Info.WHITE
                && getColor(_board, i,j) == getColor(_board, i+1,j)
                && getColor(_board, i,j) == getColor(_board, i+2,j)
                && getColor(_board, i,j) == getColor(_board, i+3,j))
                    return getColor(_board, i,j);
        }
    }

    //Diagonals
    for (int i = 0; i < 6-3; ++i)
    {
        for (int j = 0; j < 7-3; ++j)
        {
            if (getColor(_board, i,j) != Info.WHITE
                && getColor(_board, i,j) == getColor(_board, i+1,j+1)
                && getColor(_board, i,j) == getColor(_board, i+2,j+2)
                && getColor(_board, i,j) == getColor(_board, i+3,j+3))
                    return getColor(_board, i,j);
        }
    }
    for (int i = 3; i < 6; ++i)
    {
        for (int j = 0; j < 7-3; ++j)
        {
            if (getColor(_board, i,j) != Info.WHITE
                && getColor(_board, i,j) == getColor(_board, i-1,j+1)
                && getColor(_board, i,j) == getColor(_board, i-2,j+2)
                && getColor(_board, i,j) == getColor(_board, i-3,j+3))
                    return getColor(_board, i,j);
        }
    }

    return Info.WHITE;
}
