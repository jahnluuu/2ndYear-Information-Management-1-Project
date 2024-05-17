<?php
    session_start();
    if(!(isset($_SESSION['authenticated'])) || !$_SESSION['authenticated']) {
        header("location: login.php");
        exit();
    }

    $conn = mysqli_connect("localhost", "root", "", "patriciahappyshopping") or die("Error in connection: ");
    if (isset($_POST['submit_button'])) {
        $transactionID = $_POST["transactionID"];
        $userID = $_POST["userID"];
        $prodID = $_POST["prodID"];
        $Month = $_POST["Month"];
        $Day = $_POST["Day"];
        $Yr = $_POST["Yr"];
        $Time = $_POST["Time"];
        $TotalAmount = $_POST["TotalAmount"];
        $paymentMethod = $_POST["paymentMethod"];

        $sql= "SELECT transactionID from transaction WHERE transactionID = '$transactionID'";
        $result = mysqli_query($conn, $sql);
        $count = mysqli_num_rows($result);

        $sql1= "SELECT usernameID from user WHERE usernameID = '$userID'";
        $result1 = mysqli_query($conn, $sql1);
        $count1 = mysqli_num_rows($result1);

        $sql2= "SELECT productID from products WHERE productID = '$prodID'";
        $result2 = mysqli_query($conn, $sql2);
        $count2 = mysqli_num_rows($result2);
        
        if($count >= 1){
            echo "Transaction ID already existing.";
        }
        else if($count1 < 1 && $count2 < 1){
            echo "User ID and Product ID does not exist.";
        }
        else if($count1 < 1){
            echo "User ID does not exist.";
        }
        else if($count2 < 1){
            echo "Product ID does not exist.";
        }
        else{
            $sql3 = "INSERT INTO transaction (transactionID, userID, prodID, Month, Day, Yr, Time, TotalAmount, paymentMethod) VALUES ('$transactionID', '$userID', '$prodID', '$Month', '$Day', '$Yr', '$Time', '$TotalAmount', '$paymentMethod')";
            mysqli_query($conn, $sql3);

            echo "New record created successfully";

            
        }

    }
    
?>
<br>
<br>
<a href="home.php">Home</a>