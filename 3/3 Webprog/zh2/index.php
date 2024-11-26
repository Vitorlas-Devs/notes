<?php
include_once 'car.php';

$repo = new CarRepo();
$errors = array();

if (count($_POST) != 0) {
  $ev = intval($_POST['ev']);

  if (!empty($_POST['rendszam']) && !empty($_POST['szin']) && !empty($_POST['gyarto']) && !empty($ev)) {
    if ($ev >= 1000 && $ev <= 9999) {
      $repo->add(new Car($_POST['rendszam'], $_POST['szin'], $_POST['gyarto'], $ev));
    } else {
      array_push($errors, "Az évnek nem négyjegyű szám van megadva!");
    }
  } else {
    array_push($errors, "Nincs minden mező megadva!");
  }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>

<body>
  <a href="/cars.php">Autók</a><br><br>

  <ul style="color:red;list-style-type:none;">
    <?php
    foreach ($errors as $error) {
      echo "<li>$error</li><br>";
    }
    ?>
  </ul>

  <form action="" method="post">
    <label for="rendszam">Renszám:</label><br>
    <input type="text" id="rendszam" name="rendszam"><br><br>
    <label for="szin">Szín:</label><br>
    <input type="text" id="szin" name="szin"><br><br>
    <label for="gyarto">Gyártó:</label><br>
    <input type="text" id="gyarto" name="gyarto"><br><br>
    <label for="ev">ev:</label><br>
    <input type="number" id="ev" name="ev"><br><br>
    <button type="submit">Submit</button>
  </form>
</body>

</html>
