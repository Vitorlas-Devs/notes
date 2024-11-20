<?php
include_once 'classes/order.php';
$repo = new OrderRepo();
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Orders</title>
</head>

<body>
  <table>
    <thead>
      <tr>
        <th>Name</th>
        <th>Address</th>
        <th>Product</th>
      </tr>
    </thead>
    <tbody>
      <?php foreach ($repo->all() as $order) { ?>
        <tr>
          <td><?= $order->name ?></td>
          <td><?= $order->address ?></td>
          <td><?= implode(', ', $order->products) ?></td>
        </tr>
      <?php } ?>
  </table>
</body>

</html>
