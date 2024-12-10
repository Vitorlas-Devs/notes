<?php
require_once "classes/post.php";
require_once "classes/auth.php";

session_start();
$auth = new Auth();

if (!$auth->is_authenticated()) {
  header('Location: login.php');
  die();
}

$repo = new PostRepository();

function is_empty($input, $key)
{
  return !(isset($input[$key]) && trim($input[$key]) !== "");
}

function validate($input, &$errors)
{
  if (is_empty($input, "title") || is_empty($input, "content")) {
    $errors[] = "Az összes mező kitöltése kötelező";
  }

  return !(bool) $errors;
}

$errors = [];
if (count($_POST) != 0) {
  if (validate($_POST, $errors)) {
    $repo->add(new Post($_POST["title"], $_POST["content"], $_SESSION["user"]["username"]));
    header('Location: index.php');
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
  <?php if ($errors) { ?>
    <ul>
      <?php foreach ($errors as $error) { ?>
        <li><?= $error ?></li>
      <?php } ?>
    </ul>
  <?php } ?>

  <form action="" method="post">
    <label for="title">Cím: </label>
    <input id="title" name="title" type="text"><br>
    <label for="content">Tartalom: </label>
    <textarea id="content" name="content" type="text"></textarea><br>
    <button type="submit">Létrehoz</button>
  </form>

  <a href="index.php">Összes poszt</a>
</body>

</html>
