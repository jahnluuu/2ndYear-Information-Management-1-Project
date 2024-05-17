<?php
session_start();
if (!(isset($_SESSION['authenticated'])) || !$_SESSION['authenticated']) {
    header("Location: login.php");
    exit();
}

$conn = mysqli_connect("localhost", "root", "", "patriciahappyshopping") or die("Error in connection: ");

if (isset($_GET['transactionID'])) {
    $transactionID = $_GET['transactionID'];

    $sql = "SELECT * FROM transaction WHERE transactionID = '$transactionID'";
    $result = mysqli_query($conn, $sql);

    if (mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_assoc($result);
    } else {
        echo "No record found";
        exit();
    }
}

if (isset($_POST['update_button'])) {
    $transactionID = $_POST["transactionID"];
    $userID = $_POST["userID"];
    $prodID = $_POST["prodID"];
    $Month = $_POST["Month"];
    $Day = $_POST["Day"];
    $Yr = $_POST["Yr"];
    $Time = $_POST["Time"];
    $TotalAmount = $_POST["TotalAmount"];
    $paymentMethod = $_POST["paymentMethod"];

    $sql = "UPDATE transaction SET userID='$userID', prodID='$prodID', Month='$Month', Day='$Day', Yr='$Yr', Time='$Time', TotalAmount='$TotalAmount', paymentMethod='$paymentMethod' WHERE transactionID='$transactionID'";

    if (mysqli_query($conn, $sql)) {
        echo "Record updated successfully";
        header("Location: display.php");
    } 
}

mysqli_close($conn);
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="display.css">
    <title>Update Transaction</title>
</head>
<body>
    <form action="update.php?transactionID=<?php echo $row['transactionID']; ?>" method="post">
        <input type="hidden" name="transactionID" value="<?php echo $row['transactionID']; ?>">
        <label for="userID">User ID: </label><br>
        <input type="text" id="userID" name="userID" value="<?php echo $row['userID']; ?>"><br>
        <label for="prodID">Product ID: </label><br>
        <input type="text" id="prodID" name="prodID" value="<?php echo $row['prodID']; ?>"><br>
        <label for="Month">Month: </label><br>
        <input type="text" id="Month" name="Month" value="<?php echo $row['Month']; ?>"><br>
        <label for="Day">Day: </label><br>
        <input type="text" id="Day" name="Day" value="<?php echo $row['Day']; ?>"><br>
        <label for="Yr">Year: </label><br>
        <input type="text" id="Yr" name="Yr" value="<?php echo $row['Yr']; ?>"><br>
        <label for="Time">Time: </label><br>
        <input type="text" id="Time" name="Time" value="<?php echo $row['Time']; ?>"><br>
        <label for="TotalAmount">Total Amount: </label><br>
        <input type="text" id="TotalAmount" name="TotalAmount" value="<?php echo $row['TotalAmount']; ?>"><br>
        <label for="paymentMethod">Payment Method: </label><br>
        <select id="paymentMethod" name="paymentMethod">
            <option value="COD" <?php if ($row['paymentMethod'] == 'COD') echo 'selected'; ?>>Cash on Delivery</option>
            <option value="onlineBanking" <?php if ($row['paymentMethod'] == 'onlineBanking') echo 'selected'; ?>>Online Banking</option>
            <option value="eWallet" <?php if ($row['paymentMethod'] == 'eWallet') echo 'selected'; ?>>E-Wallet</option>
        </select><br><br>
        <input type="submit" name="update_button" value="Update">
    </form>
    <br>
    <br>
    <a href="display.php">Back to Transactions</a>
</body>
</html>