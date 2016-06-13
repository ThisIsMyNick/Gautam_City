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
    } else if (GameState == State.PVP || GameState == State.AI)
    {
        gameInput();
        drawGame();
        int winner = win();
        if (winner != Info.WHITE)
        {
            lastWinner = winner;
            GameState = State.END;
        }
    }
}

int getColor(int x, int y)
{
    return board[x][y].colorNow;
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
    void draw()
    {
        ellipse(xcor,ycor,90,90);
    }
    void clear()
    {
        colorNow = Info.WHITE;
    }
}
