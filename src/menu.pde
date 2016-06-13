void menuInput()
{
    if (250 <= mouseX && mouseX <= 550)
    {
        if (200 <= mouseY && mouseY <= 250)
        {
            GameState = State.AI;
        }
        if (300 <= mouseY && mouseY <= 350)
        {
            GameState = State.PVP;
        }
    }
}

void drawMenu()
{
    background(0);
    textSize(32);

    fill(255,255,255);
    printWinner();
    text("Pick a gamemode!", 250.0, 100.0);
    rect(250.0, 200.0, 300.0, 50.0);
    rect(250.0, 300.0, 300.0, 50.0);

    fill(100,100,100);
    text("1 Player", 325.0, 205.0, 300.0, 50.0);
    text("2 Players", 320.0, 305.0, 300.0, 50.0);
}

void printWinner()
{
    if (lastWinner == Info.WHITE)
        return;
    if (lastWinner == Info.RED)
        text("Red won", 330, 50);
    if (lastWinner == Info.BLACK)
        text("Black won", 320, 50);
}
