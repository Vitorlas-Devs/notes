#include <stdbool.h>
#include <stdio.h>
#include <string.h>

#define HEIGHT 6
#define WIDTH 7

void init();
void printTable();
bool submit(int player, char col);
bool evaluate();
int game(char game[]);

int table[HEIGHT][WIDTH];

int main()
{
    init();
    int result = game("ABDCAEEEEEEFFFAC");
    // printTable();

    if (result)
        printf("%s player wins.\n", result == 1 ? "First" : "Second");
    else
        printf("Draw.\n");

    return 0;
}

void init()
{
    for (int i = 0; i < HEIGHT; i++)
        for (int j = 0; j < WIDTH; j++)
            table[i][j] = 0;
}

void printTable()
{
    for (int i = 0; i < HEIGHT; i++)
    {
        for (int j = 0; j < WIDTH; j++)
            printf("%d ", table[i][j]);
        printf("\n");
    }
    printf("\n");
}

/* ### Returning values
 * `true`: Hibátlanul lefutott
 * `false`: A lépés illegális
 */
bool submit(int player, char col)
{
    if (col < 'A' || col > 'G')
    {
        fprintf(stderr, "Illegális oszlop!\n");
        return false;
    }

    for (int i = HEIGHT - 1; i >= 0; i--)
    {
        if (table[i][col - 'A'] == 0)
        {
            table[i][col - 'A'] = player;
            return true;
        }
    }

    fprintf(stderr, "Nincs hely az oszlopban!\n");
    return false;
}

/* ### Returning values
 * `false`: Még nem nyert senki (vagy döntetlen)
 * `true`: Game Over
 */
bool evaluate()
{
    for (int i = 0; i < HEIGHT; i++)
    {
        for (int j = 0; j < WIDTH - 2; j++)
        {
            if (table[i][j] != 0 &&
                table[i][j + 1] == table[i][j] &&
                table[i][j + 2] == table[i][j])
                return true;
        }
    }
    for (int i = 0; i < HEIGHT - 2; i++)
    {
        for (int j = 0; j < WIDTH; j++)
        {
            if (table[i][j] != 0 &&
                table[i + 1][j] == table[i][j] &&
                table[i + 2][j] == table[i][j])
                return true;
        }
    }
    return false;
}

/* ### Return values:
 * `0`: Draw
 * `1`: First player wins
 * `2`: Second player wins
 */
int game(char game[])
{
    for (int i = 0; i < (int)strlen(game); i++)
    {
        int currentPlayer = i % 2 + 1;
        submit(currentPlayer, game[i]);
        if (evaluate())
        {
            return currentPlayer;
        }
    }
    return 0;
}
