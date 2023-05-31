<?php
$con = new mysqli('localhost', 'root', '', 'fleet_manage');


?>
<table border="1">
    <tr>
        <th>name</th>
        <th>details</th>
        <th>stock</th>
        <th>status</th>
    </tr>
    <?php
    $data = $con->query("SELECT id,name,details,status FROM parts");
    while ($d = $data->fetch_assoc()) {
        $a = $con->query("SELECT SUM(qty) AS qty FROM `parts_stock_out` WHERE parts_id=" . $d['id'])->fetch_assoc();

        $b = $con->query("SELECT SUM(qty) AS qty FROM `parts_in_maintenance` WHERE parts_id=" . $d['id'])->fetch_assoc();
        $c = $con->query("SELECT qty FROM `parts_stock_in` WHERE parts_id=" . $d['id'])->fetch_assoc();

        $stock = $c['qty'] - $a['qty'] - $b['qty'];
    ?>
        <tr>
            <td><?php echo $d['name'] ?></td>
            <td><?php echo $d['details'] ?></td>
            <td><?php echo $stock ?></td>
            <td><?php echo $d['status'] ?></td>
        </tr>
    <?php
    }
    ?>
</table>