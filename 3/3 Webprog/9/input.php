<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>

<body>
  <?php
  if (isset($_GET['name'])) {
    $name = $_GET['name'];
  } else {
    $name = "";
  }
  ?>

  <form action="" method="get">
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" value="<?= htmlspecialchars($name) ?>">
    <input type="submit" value="Submit">
  </form>

  <h1>
    <?php
    if (!empty($name)) {
      echo "Hello, " . htmlspecialchars($name) . "!";
    }
    ?>
  </h1>
</body>

</html>
