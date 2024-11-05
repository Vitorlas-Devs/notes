<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>

<body>
  <h1>
    <?php
    for ($i = 0; $i < 10; $i++) {
      $size = 15 + $i;
      echo "<span style='font-size: {$size}px;'>Hello, World! {$size}</span><br>";
    }
    ?>
  </h1>
</body>

</html>
