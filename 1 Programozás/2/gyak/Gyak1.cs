
float a = 0, b = 0;

while (!(a > 0 && b > 0))
{

	Console.Write("a = ");
	a = float.Parse(Console.ReadLine());

	Console.Write("b = ");
	b = float.Parse(Console.ReadLine());
}

float k = 2 * (a + b);
float t = a * b;
Console.WriteLine($"Kerület: {k}\nTerület: {t}");










Console.ReadKey();
