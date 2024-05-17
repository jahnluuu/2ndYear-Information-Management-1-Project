
<?php
	session_start();
	if(!(isset($_SESSION['authenticated'])) || !$_SESSION['authenticated']) {
        header("location: login.php");
        exit();
    }
	$con= mysqli_connect("localhost","root","","patriciahappyshopping") 
		or die("Error in connection");
 
	$sql ="select * from transaction";
		$result = mysqli_query($con,$sql);
		$count = mysqli_num_rows($result);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="display.css">
    <title>Transaction Details</title>
</head>
 
<body>
    <section>
        <table>
            <tr>
                <th>Transaction ID</th>
                <th>User ID</th>
                <th>Product ID</th>
                <th>Month</th>
                <th>Day</th>
                <th>Year</th>
                <th>Time</th>
                <th>Total Amount</th>
                <th>Payment Method</th>
                <th></th>
                <th></th>
            </tr>
            <?php 
                while($rows=mysqli_fetch_assoc($result))
                {
            ?>
            <tr>
                <td><?php echo $rows['transactionID'];?></td>
                <td><?php echo $rows['userID'];?></td>
                <td><?php echo $rows['prodID'];?></td>
                <td><?php echo $rows['Month'];?></td>
                <td><?php echo $rows['Day'];?></td>
                <td><?php echo $rows['Yr'];?></td>
                <td><?php echo $rows['Time'];?></td>
                <td><?php echo $rows['TotalAmount'];?></td>
                <td><?php echo $rows['paymentMethod'];?></td>
                <td><a href="update.php?transactionID=<?php echo $rows['transactionID']; ?>">Update</a></td>
                <td><a href="delete.php?transactionID=<?php echo $rows['transactionID']; ?>" onclick="return confirm('Are you sure you want to delete this record?');">Delete</a></td>
            </tr>
            <?php
                }
            ?>
        </table>
    </section>
</body>
 
</html>