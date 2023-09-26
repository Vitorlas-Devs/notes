
int ár = 0, százalék = 0;

while (!(0 < ár && 0 < százalék && százalék < 100))
{
	Console.Write("ár = ");
	ár = int.Parse(Console.ReadLine());

	Console.Write("százalék = ");
	százalék = int.Parse(Console.ReadLine());
}

int újár = ár * (100 - százalék) / 100;
Console.WriteLine($"Új ár: {újár}");





Console.ReadKey();
