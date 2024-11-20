<?php
include_once 'classes/product.php';
include_once 'classes/order.php';

$product_repo = new ProductRepo();
$order_repo = new OrderRepo();

if (count($_GET) > 0) {
  $products = $product_repo->getProductByCategory($_GET['category']);
} else {
  $products = $product_repo->all();
}

if (count($_POST) != 0 && !empty($_POST['name']) && !empty($_POST['address']) && !empty($_POST['products'])) {
  $order_repo->add(new Order($_POST['name'], $_POST['address'], $_POST['products']));
}
