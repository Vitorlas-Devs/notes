// 1. deklarálás
double x, y;
int sn;

// 2. beolvasás
Console.Write("x = ");
x = double.Parse(Console.ReadLine());

Console.Write("y = ");
y = double.Parse(Console.ReadLine());

// 3. feldolgozás
if (x >= 0) {
  if (y >= 0) sn = 1;
  else sn = 4;
} else {
  if (y >= 0) sn = 2;
  else sn = 3;
}

// 4. kiírás
Console.WriteLine($"sn = {sn}");
