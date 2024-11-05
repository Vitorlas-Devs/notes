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
    $num = 6;

    function fact($num)
    {
      if ($num == 0) {
        return 1;
      } else {
        return $num * fact($num - 1);
      }
    }

    echo $num . "! = " . fact($num);
    ?>
  </h1>
</body>

</html>
