<?php
require_once "jsonstorage.php";

class Post
{
  public $_id = null;
  public $title;
  public $content;
  public $author_name;
  public $created_date;

  public function __construct($title = null, $content = null, $author_name = null)
  {
    $this->title = $title;
    $this->content = $content;
    $this->author_name = $author_name;
    $this->created_date = date("Y.m.d H:i");
    // $this->created_date = new DateTime('now');
  }

  public static function from_array(array $arr): Post
  {
    $instance = new Post();
    $instance->_id = $arr['_id'] ?? null;
    $instance->title = $arr['title'] ?? null;
    $instance->content = $arr['content'] ?? null;
    $instance->author_name = $arr['author_name'] ?? null;
    $instance->created_date = $arr['created_date'] ?? null;
    return $instance;
  }

  public static function from_object(object $obj): Post
  {
    return self::from_array((array) $obj);
  }
}

class PostRepository
{
  private $storage;
  public function __construct()
  {
    $this->storage = new JsonStorage('data/posts.json');
  }
  private function convert(array $arr): array
  {
    return array_map([Post::class, 'from_object'], $arr);
  }
  public function all()
  {
    return $this->convert($this->storage->all());
  }
  public function add(Post $order): string
  {
    return $this->storage->insert($order);
  }
}
