<?php
include_once 'product.php';

$repo = new ProductRepo();
$categories = ["Food", "Drink", "Snack"];
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>

<body>
  <ul>
    <?php
    foreach ($categories as $c) {
      echo "<li><a href='category.php?category=$c'>$c</a></li>";
    }
    ?>
  </ul>
</body>

</html>
