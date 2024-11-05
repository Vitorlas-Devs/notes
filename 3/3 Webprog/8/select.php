<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>

<body>
  <select>
    <?php
    $arr = array(
      1 => "Horror",
      2 => "Sci-fi",
      3 => "Comedy",
      4 => "Drama",
      5 => "Romantic",
      6 => "Action",
      7 => "Thriller",
      8 => "Anime",
      9 => "Documentary",
      10 => "Fantasy"
    );
    foreach ($arr as $key => $value) {
      echo "<option value='{$key}'>{$value}</option>";
    }
    ?>
  </select>
</body>

</html>
