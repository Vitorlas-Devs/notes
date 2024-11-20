<?php
include_once 'jsonstorage.php';

class Order
{
  public $id = null;
  public $name;
  public $address;
  public $products;

  public function __construct(string $name, string $address, array $products)
  {
    $this->name = $name;
    $this->address = $address;
    $this->products = $products;
  }

  public static function from_array(array $data): Order
  {
    $order = new Order(
      $data['name'] ?? '',
      $data['address'] ?? '',
      $data['products'] ?? []
    );
    $order->id = $data['id'];
    return $order;
  }

  public static function from_object(object $data): Order
  {
    return self::from_array((array) $data);
  }
}

class OrderRepo
{
  private $storage;

  public function __construct()
  {
    $this->storage = new JsonStorage('orders.json');
  }

  public function convert(array $array): array
  {
    return array_map([Order::class, 'from_array'], $array);
  }

  public function all(): array
  {
    return $this->convert($this->storage->all());
  }

  public function add(Order $order): string
  {
    return $this->storage->insert($order);
  }
}
