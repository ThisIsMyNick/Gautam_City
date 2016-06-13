int DIFFICULTY = 4; //i would make buttons for this but meh. beyond 6, too slow.

class Info
{
    static final int WHITE = 0;
    static final int RED = 1;
    static final int BLACK = 2;
}

class State
{
    static final int MENU = 0;
    static final int PVP = 1;
    static final int AI = 2;
    static final int END = 3;
}

int GameState;
int turn;
int lastWinner = Info.WHITE;
Circle[][] board = new Circle[6][7];

void setup()
{
    turn = 0;
    size(790,680);
    for (int x = 0; x < 7; x++)
    {
        for (int y = 0; y < 6; y++)
        {
            board[y][x] = new Circle(x,y);
        }
    }
    GameState = State.MENU;
}

void draw()
{
    if (GameState == State.MENU)
    {
        drawMenu();
    } else if (GameState == State.PVP || GameState == State.AI)
    {
        drawGame();
    }
}

void mouseClicked()
{
    if (GameState == State.MENU)
    {
        menuInput();
    } else if (GameState == State.END)
    {
        GameState = State.MENU;
        clearBoard();
    } else if (GameState == State.PVP)
    {
        gameInput();
        drawGame();
        checkWinner(board);
        turn++;
    } else if (GameState == State.AI)
    {
        if (!gameInput())
        {
            return;
        }
        drawGame();
        if (checkWinner(board))
            return;
        minimax(board, Info.BLACK, DIFFICULTY);
        placeTile(board, bestColumn, Info.BLACK);
        drawGame();
        checkWinner(board);
    }
}

boolean checkWinner(Circle[][] _board)
{
    int winner = win(_board);
    if (winner == Info.WHITE)
        return false;
    lastWinner = winner;
    GameState = State.END;
    return true;
}

int getColor(Circle[][] _board, int x, int y)
{
    return _board[x][y].colorNow;
}

class Circle
{
    int xcor,ycor;
    int colorNow;

    Circle(int x,int y)
    {
        xcor = 65 + 110 * x;
        ycor = 65 + 110 * y;
        colorNow = Info.WHITE;
    }
    //below used for copying only
    Circle(int x, int y, int col)
    {
        xcor = x;
        ycor = y;
        colorNow = col;
    }
    void draw()
    {
        ellipse(xcor,ycor,90,90);
    }
    void clear()
    {
        colorNow = Info.WHITE;
    }
}
