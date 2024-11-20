<head>
  <title>Products</title>
</head>


<body>
  <h1><?= $_GET['category'] ?? 'All' ?> Products</h1>

  <form action="" method="post">
    <?php
    include_once 'product.php';

    $i = 0;
    foreach ($products as $p) {
      echo "<input id='product$i' type='checkbox' name='products[]' value='$p->id'>";
      echo "<label for='product$i'>$p->name</label><br>";
      $i++;
    }
    ?>
    <br><br>
    <label for="name">Name:</label><br>
    <input type="text" id="name" name="name"><br><br>
    <label for="address">Address:</label><br>
    <input type="text" id="address" name="address"><br><br>
    <button type="submit">Order</button>
  </form>
