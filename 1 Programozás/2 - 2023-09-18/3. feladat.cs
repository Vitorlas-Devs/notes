// 1. deklarálás
int n, o;

// 2. beolvasás
Console.Write("n = ");
n = int.Parse(Console.ReadLine());

// 3. feldolgozás
o = 2;

if (n > 1)
{
  while (o <= n && n % o != 0)
  {
    o++;
  }

  if (o <= n && o > 1)
  {
    // 4. kiírás
    Console.WriteLine($"o = {o}");
  }
  else
  {
    Console.WriteLine("Nincs ilyen o.");
  }
}
else
{
  Console.WriteLine("Nem megfelelő bemenet.");
}