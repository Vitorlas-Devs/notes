<?php
require_once "classes/auth.php";
require_once "classes/post.php";

session_start();

$auth = new Auth();
$repo = new PostRepository();
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
  <?php if ($auth->is_authenticated()): ?>
    <span>Bejelentkezve: <?= $_SESSION["user"]["username"] ?></span><br>
    <a href="createpost.php">Posztolás</a>
    <a href="logout.php">Kijelentkezés</a>
  <?php endif; ?>

  <br><br>

  <table>
    <thead>
      <tr>
        <th>Cím</th>
        <th>Tartalom</th>
        <th>Készítő</th>
        <th>Létrehozás dátuma</th>
      </tr>
    </thead>
    <tbody>
      <?php foreach ($repo->all() as $post) { ?>
        <tr>
          <td><?= $post->title ?></td>
          <td><?= $post->content ?></td>
          <td><?= $post->author_name ?></td>
          <td><?= $post->created_date ?></td>
        </tr>
      <?php } ?>
    </tbody>
  </table>
</body>

</html>
