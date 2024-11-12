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
    $addr = $_SERVER['REMOTE_ADDR'];
    $in_elte_domain =  str_starts_with($addr, "127.0.0.1");

    if ($in_elte_domain) {
      echo "You are in the ELTE domain";
    } else {
      echo "Nah uh";
    }
    ?>
  </h1>
</body>

</html>
