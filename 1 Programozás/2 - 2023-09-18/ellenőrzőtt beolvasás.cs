// Ellenőrzött beolvasás

bool jo;

do
{
  Console.Write("n = ");
  jo = int.TryParse(Console.ReadLine(), out n);

  jo = jo && n > 1;

  if (!jo)
  {
    Console.WriteLine("Nem megfelelő bemenet.");
  }
} while (!jo);
