<?php
require_once "classes/auth.php";

session_start();
$auth = new Auth();

function is_empty($input, $key)
{
  return !(isset($input[$key]) && trim($input[$key]) !== "");
}

function validate($input, &$errors, $auth)
{

  if (is_empty($input, "username")) {
    $errors[] = "Felhasználónév megadása kötelező";
  }
  if (is_empty($input, "password")) {
    $errors[] = "Jelszó megadása kötelező";
  }
  if (count($errors) == 0) {
    if ($auth->user_exists($input['username'])) {
      $errors[] = "Felhasználónév már foglalt";
    }
  }

  return !(bool) $errors;
}

$errors = [];
if (count($_POST) != 0) {
  if (validate($_POST, $errors, $auth)) {
    $auth->register($_POST);
    header('Location: login.php');
    exit();
  }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>

<body>
  <h2>Regisztráció</h2>
  <?php if ($errors) { ?>
    <ul>
      <?php foreach ($errors as $error) { ?>
        <li><?= $error ?></li>
      <?php } ?>
    </ul>
  <?php } ?>
  <form action="" method="post">
    <label for="username">Felhasználó: </label>
    <input id="username" name="username" type="text"><br>
    <label for="password">Jelszó: </label>
    <input id="password" name="password" type="password"><br>
    <input type="submit" value="Regisztráció">
  </form>
  <a href="login.php">Bejelentkezés</a>
</body>


</html>
