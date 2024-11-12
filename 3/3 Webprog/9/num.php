<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <?php
  function validate(&$input, &$data, &$errors)
  {
    $data["a"] = null;
    $data["b"] = null;

    if (empty($input["a"]) || empty($input["b"])) {
      $errors = "Az értékek megadása kötelező!";
    } else if (!is_numeric($input["a"]) || !is_numeric($input["b"])) {
      $errors = "Számokat kell megadni!";
    } else if ($input["a"] == 0) {
      $errors = "Az 'a' nem lehet 0!";
    } else {
      $data["a"] = (int)$input["a"];
      $data["b"] = (int)$input["b"];
    }

    return !(bool)$errors;
  }

  $errors = [];
  $data = [];
  $input = $_GET;

  if (count($_GET) !== 0) {
    if (validate($input, $data, $errors)) {
      $a = $data["a"];
      $b = $data["b"];

      $x = -$b / $a;
    }
  }
  ?>
</head>

<body>
  <?php if ($errors) : ?>
    <ul>
      <?php foreach ($errors as $error) : ?>
        <li><?= $error ?></li>
      <?php endforeach; ?>
    </ul>
  <?php endif; ?>

  <form action="" method="get">
    <label for="a">a:</label>
    <input type="text" id="a" name="a" value="<?= htmlspecialchars($input["a"] ?? "") ?>">
    <label for="b">b:</label>
    <input type="text" id="b" name="b" value="<?= htmlspecialchars($input["b"] ?? "") ?>">
    <input type="submit" value="Submit">
  </form>

  <?php if (isset($x)) : ?>
    <h1>x = <?= $x ?></h1>
  <?php endif; ?>
</body>

</html>
