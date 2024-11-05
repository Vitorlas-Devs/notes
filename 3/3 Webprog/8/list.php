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
    $errors = ["Error 1", "Error 2", "Error 3", "Error 4", "Error 5", "Error 6", "Error 7", "Error 8", "Error 9", "Error 10"];
    for ($i = 0; $i < count($errors); $i++) {
      echo "<span>{$errors[$i]}</span>  ";
    }
    echo "<br>";
    foreach ($errors as $error) {
      echo "<span>$error</span>  ";
    }
    ?>
  </h1>
</body>

</html>
