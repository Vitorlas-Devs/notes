#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// A tábla magassága és szélessége
#define HEIGHT 6
#define WIDTH 7

// A játékosokat reprezentáló számok
#define EMPTY 0
#define FIRST 1
#define SECOND 2

// A tábla egy kétdimenziós tömb
int table[HEIGHT][WIDTH];

// A tábla inicializálása
void init()
{
  // Minden mezőt üresre állítunk
  for (int i = 0; i < HEIGHT; i++)
  {
    for (int j = 0; j < WIDTH; j++)
    {
      table[i][j] = EMPTY;
    }
  }
}

// A tábla kiírása a képernyőre
void printTable()
{
  // A felső sorban az oszlopok betűit írjuk ki
  printf("  A B C D E F G\n");
  // A többi sorban a tábla értékeit írjuk ki
  for (int i = 0; i < HEIGHT; i++)
  {
    printf("%d ", i + 1); // A sor számát is kiírjuk
    for (int j = 0; j < WIDTH; j++)
    {
      // Az üres mezőket .-al, az első játékos korongjait X-el, a második játékos korongjait O-val jelöljük
      switch (table[i][j])
      {
      case EMPTY:
        printf(". ");
        break;
      case FIRST:
        printf("X ");
        break;
      case SECOND:
        printf("O ");
        break;
      }
    }
    printf("\n"); // Új sor a következő sorhoz
  }
}

// Egy lépés végrehajtása
// A paraméterek: a játékos, aki dob, és az oszlop, amibe dob
// A visszatérési érték: igaz, ha a lépés legális volt, hamis, ha nem
int submit(int player, char column)
{
  // Ellenőrizzük, hogy a megadott oszlop létezik-e
  if (column < 'A' || column > 'G')
  {
    printf("Invalid column: %c\n", column); // Hibaüzenet, ha nem
    return 0;                               // Hamisat adunk vissza
  }
  // Meghatározzuk az oszlop indexét a tömbben
  int index = column - 'A';
  // Megkeressük a legmélyebb szabad helyet az oszlopban
  int row = -1; // Ha nem találunk, akkor -1 marad
  for (int i = HEIGHT - 1; i >= 0; i--)
  {
    if (table[i][index] == EMPTY)
    {
      row = i; // Ha találunk, akkor megjegyezzük a sor indexét
      break;
    }
  }
  // Ellenőrizzük, hogy van-e szabad hely az oszlopban
  if (row == -1)
  {
    printf("No free space in column: %c\n", column); // Hibaüzenet, ha nincs
    return 0;                                        // Hamisat adunk vissza
  }
  // Ha van szabad hely, akkor elhelyezzük a játékos korongját a táblán
  table[row][index] = player;
  return 1; // Igazat adunk vissza
}

// A játék állapotának kiértékelése
// A paraméter: a játékos, aki utoljára dobott
// A visszatérési érték: igaz, ha a játékos nyert, hamis, ha nem
int evaluate(int player)
{
  // Végigmegyünk a tábla minden mezőjén
  for (int i = 0; i < HEIGHT; i++)
  {
    for (int j = 0; j < WIDTH; j++)
    {
      // Ha a mező nem az adott játékosé, akkor tovább lépünk
      if (table[i][j] != player)
      {
        continue;
      }
      // Ellenkező esetben megvizsgáljuk, hogy van-e három azonos színű korong vízszintesen vagy függőlegesen egymás mellett vagy alatt
      // Ehhez négy irányt kell ellenőriznünk: jobbra, le, jobbra le, és balra le
      // Minden irányhoz két változót használunk: di és dj, amik a sor és az oszlop indexének változását jelölik az adott irányban
      // Például a jobbra irányhoz di = 0, dj = 1, mert a sor indexe nem változik, az oszlop indexe pedig eggyel nő
      // A le irányhoz di = 1, dj = 0, mert a sor indexe eggyel nő, az oszlop indexe pedig nem változik
      // A többi irányhoz hasonlóan
      int directions[4][2] = {{0, 1}, {1, 0}, {1, 1}, {1, -1}};
      // Végigmegyünk a négy irányon
      for (int k = 0; k < 4; k++)
      {
        // Kiválasztjuk az aktuális irányt
        int di = directions[k][0];
        int dj = directions[k][1];
        // Megszámoljuk, hogy hány azonos színű korong van egymás mellett vagy alatt az adott irányban
        // Kezdetben ez 1, mert a kiinduló mezőt is beleszámítjuk
        int count = 1;
        // Nézzük meg a következő mezőt az adott irányban
        int ni = i + di;
        int nj = j + dj;
        // Amíg nem lépünk ki a tábláról, és az aktuális mező is az adott játékosé, növeljük a számlálót
        while (ni >= 0 && ni < HEIGHT && nj >= 0 && nj < WIDTH && table[ni][nj] == player)
        {
          count++;
          // Lépjünk tovább a következő mezőre
          ni += di;
          nj += dj;
        }
        // Ha a számláló legalább 3, akkor a játékos nyert
        if (count >= 3)
        {
          return 1; // Igazat adunk vissza
        }
      }
    }
  }
  // Ha egyik irányban sem találtunk három azonos színű korongot, akkor a játékos nem nyert
  return 0; // Hamisat adunk vissza
}

// A játék lejátszása
// A paraméter: a dobási sorrendet tartalmazó string
void game(char *sequence)
{
  // A játék kezdetekor inicializáljuk a táblát
  init();
  // A kezdő játékos az 1-es
  int player = FIRST;
  // A játékmenetet a string karakterei határozzák meg
  for (int i = 0; i < strlen(sequence); i++)
  {
    // A következő lépés az aktuális karakter
    char column = sequence[i];
    // Végrehajtjuk a lépést, és ellenőrizzük, hogy legális volt-e
    int valid = submit(player, column);
    // Ha nem volt legális, akkor átugorjuk a lépést, és nem váltunk játékost
    if (!valid)
    {
      continue;
    }
    // Ha legális volt, akkor kiírjuk a tábla aktuális állapotát
    printf("%d\n", i + 1);
    printTable();
    // Megvizsgáljuk, hogy nyert-e az aktuális játékos
    int win = evaluate(player);
    // Ha igen, akkor kiírjuk az eredményt, és befejezzük a játékot
    if (win == 1)
    {
      printf("Player %d won\n", player);
      return;
    }
    // Ha nem, akkor váltunk játékost
    if (player == FIRST)
    {
      player = SECOND;
    }
    else
    {
      player = FIRST;
    }
  }
  // Ha a játék végére értünk, akkor kiírjuk, hogy döntetlen
  printf("Draw\n");
}

// A program belépési pontja
int main()
{
  // A játékmenetet tartalmazó string
  // char* sequence = "ABDCAGEEE";
  char* sequence = "ABDCAEEEEEEFFFAC";
  // char* sequence = "ABDCAEEEEEEFFG";
  // char *sequence = "AAAAAAABBBBBBBCCCCCCCDDDDDDDEEEEEEEFFFFFFFGGGGGG"; // contains errors but still works

  // A játék lejátszása
  game(sequence);
  return 0;
}
