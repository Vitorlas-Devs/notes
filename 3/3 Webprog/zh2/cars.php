<?php
include_once 'car.php';
$repo = new CarRepo();
$gyarto = isset($_POST['gyarto']) ? $_POST['gyarto'] : '';
$cars = $gyarto ? $repo->filterByMaker($gyarto) : $repo->all();
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>

<body>
  <a href="/">Vissza</a><br><br>

  <form action="" method="post">
    <label for="gyarto">Gyártó:</label><br>
    <input type="text" id="gyarto" name="gyarto" value="<?= $gyarto ?>"><br><br>
    <input type="submit" value="Filter">
  </form>

  <table>
    <thead>
      <tr>
        <th>Renszám</th>
        <th>Szín</th>
        <th>Gyártó</th>
        <th>Év</th>
      </tr>
    </thead>
    <tbody>
      <?php foreach ($cars as $car) { ?>
        <tr>
          <td><?= $car->rendszam ?></td>
          <td><?= $car->szin ?></td>
          <td><?= $car->gyarto ?></td>
          <td><?= $car->ev ?></td>
        </tr>
      <?php } ?>
    </tbody>
  </table>
</body>

</html>
