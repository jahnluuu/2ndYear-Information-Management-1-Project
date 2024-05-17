<?php
session_start();
if (!(isset($_SESSION['authenticated'])) || !$_SESSION['authenticated']) {
    header("Location: login.php");
    exit();
}

if (isset($_GET['transactionID'])) {
    $transactionID = $_GET['transactionID'];

    $conn = mysqli_connect("localhost", "root", "", "patriciahappyshopping") or die("Error in connection: ");

    $sql = "DELETE FROM transaction WHERE transactionID = '$transactionID'";
    if (mysqli_query($conn, $sql)) {
        echo "Record deleted successfully";
    } else {
        echo "Error deleting record: " . mysqli_error($conn);
    }

    mysqli_close($conn);

   
    header("Location: display.php");
}
?>