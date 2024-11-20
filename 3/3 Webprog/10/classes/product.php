<?php
include_once 'jsonstorage.php';

class Product
{
  public $id = null;
  public $name;
  public $category;
  public $price;

  public function __construct(string $name, string $category, float $price)
  {
    $this->name = $name;
    $this->category = $category;
    $this->price = $price;
  }

  public static function from_array(array $data): Product
  {
    $product = new Product(
      $data['name'] ?? '',
      $data['category'] ?? '',
      $data['price'] ?? 0.0
    );
    $product->id = $data['id'] ?? null;
    return $product;
  }

  public static function from_object(object $data): Product
  {
    return self::from_array((array) $data);
  }
}

class ProductRepo
{
  private $storage;

  public function __construct()
  {
    $this->storage = new JsonStorage('products.json');
  }

  public function convert(array $array): array
  {
    return array_map([Product::class, 'from_array'], $array);
  }

  public function all(): array
  {
    return $this->convert($this->storage->all());
  }

  public function add(Product $product): string
  {
    return $this->storage->insert($product);
  }

  public function getProductByCategory(string $category): array
  {
    return $this->convert($this->storage->filter(function ($product) use ($category) {
      return $product->category === $category;
    }));
  }
}
