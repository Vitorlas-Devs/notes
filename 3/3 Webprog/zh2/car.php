<?php
include_once 'jsonstorage.php';

class Car
{
  public $rendszam;
  public $szin;
  public $gyarto;
  public $ev;

  public function __construct(string $rendszam, string $szin, string $gyarto, int $ev)
  {
    $this->rendszam = $rendszam;
    $this->szin = $szin;
    $this->gyarto = $gyarto;
    $this->ev = $ev;
  }

  public static function from_array(array $data): Car
  {
    $car = new Car(
      $data['rendszam'] ?? '',
      $data['szin'] ?? '',
      $data['gyarto'] ?? '',
      $data['ev'] ?? 2024
    );
    return $car;
  }

  public static function from_object(object $data): Car
  {
    return self::from_array((array) $data);
  }
}

class CarRepo
{
  private $storage;

  public function __construct()
  {
    $this->storage = new JsonStorage('autok.json');
  }

  public function convert(array $array): array
  {
    return array_map([Car::class, 'from_array'], $array);
  }

  public function all(): array
  {
    return $this->convert($this->storage->all());
  }

  public function add(Car $Car): string
  {
    return $this->storage->insert($Car);
  }

  public function filterByMaker(string $gyarto)
  {
    $all = $this->all();
    return array_filter($all, function (Car $car) use ($gyarto) {
      return $car->gyarto === $gyarto;
    });
  }
}
