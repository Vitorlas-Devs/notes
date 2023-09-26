// 1. feladat
var db = 0;
var n = 0;
var napimin = new int[100];

n = int.Parse(Console.ReadLine());

if (n < 1 || n > 100)
{
	Console.WriteLine("Hibás adat!");
	return;
}

for (var i = 0; i < n; i++)
{
	if (napimin[i] <= 0)
	{
		db++;
	}
}

Console.WriteLine("#");
Console.WriteLine(db);

Console.WriteLine("#");

Console.WriteLine("#");

Console.WriteLine("#");
