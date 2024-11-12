<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <?php
  function validate($input)
  {
    if (!ctype_xdigit($input) || strlen($input) != 6) {
      return true;
    }
    return false;
  }

  $error = false;
  if (isset($_GET['color'])) {
    $color = validate($_GET['color']);
    if (!$error) {
      $color = $_GET['color'];
    }
  } else {
    $color = "fff";
  }
  ?>
</head>

<body style="background-color: #<?= htmlspecialchars($color) ?>">

  <form action="" method="get">
    <label for="color">Color:</label>
    <input type="text" id="color" name="color" value="<?= htmlspecialchars($color) ?>">
    <input type="submit" value="Submit">
  </form>

  <ul>
    <li><a href="?color=ff0000">Red</a></li>
    <li><a href="?color=00ff00">Green</json></li>
    <li><a href="?color=0000ff">Blue</a></li>
  </ul>

  <h1>
    <?php
    if (!$error) {
      echo "Color: " . htmlspecialchars($color);
    } else {
      echo "Invalid color: " . htmlspecialchars($color);
    }
    ?>
  </h1>
</body>

</html>
