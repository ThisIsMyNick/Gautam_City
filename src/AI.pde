int bestColumn = 0;

int InvalidMove = 1337;

int minimax(Circle[][] _board, int col, int level)
{
    int winner = win(_board);
    if (winner == Info.RED)
        return -10;
    if (winner == Info.BLACK)
        return 10;

    if (level == 0) return 0;
    if (freeColumns(_board) == 0) return 0;

    Circle[][][] moves = new Circle[7][6][7];
    int[] scores = new int[7];

    for (int column = 0; column < 7; ++column)
    {
        Circle[][] tmp = deepCopy(_board);
        if (getColor(tmp, 0, column) == Info.WHITE)
        {
            placeTile(tmp, column, col);
            moves[column] = tmp;
            scores[column] = minimax(tmp, nextColor(col), level-1);
        } else
        {
            moves[column] = null;
            scores[column] = InvalidMove;
        }
    }

    //AI always goes 2nd, thus is always black
    if (col == Info.BLACK)
    {
        int index = maxIndex(scores);
        bestColumn = index;
        return scores[index];
    }
    else
    {
        int index = minIndex(scores);
        bestColumn = index;
        return scores[index];
    }
}

Circle[][] deepCopy(Circle[][] _board)
{
    Circle[][] _new = new Circle[6][7];
    for (int i = 0; i < 6; ++i)
    {
        for (int j = 0; j < 7; ++j)
        {
            Circle tmp = _board[i][j];
            _new[i][j] = new Circle(tmp.xcor, tmp.ycor, tmp.colorNow);
        }
    }
    return _new;
}

int nextColor(int col)
{
    if (col == Info.RED)
        return Info.BLACK;
    return Info.RED;
}

int maxIndex(int[] l)
{
    int maxVal = -1000;
    int maxIndex = -1;
    for (int i = 0; i < l.length; ++i)
    {
        if (l[i] == InvalidMove) continue;
        if (l[i] > maxVal)
        {
            maxVal = l[i];
            maxIndex = i;
        }
    }
    return maxIndex;
}
int minIndex(int[] l)
{
    int minVal = 1000;
    int minIndex = -1;
    for (int i = 0; i < l.length; ++i)
    {
        if (l[i] == InvalidMove) continue;
        if (l[i] < minVal)
        {
            minVal = l[i];
            minIndex = i;
        }
    }
    return minIndex;
}

int freeColumns(Circle[][] _board)
{
    int s = 0;
    for (int x = 0; x < 7; ++x)
    {
        if (getColor(_board, 0, x) == Info.WHITE)
            s += 1;
    }
    return s;
}
