<?php
session_start();
	if(!(isset($_SESSION['authenticated'])) || !$_SESSION['authenticated']) {
        header("location: login.php");
        exit();
    }
?>
<html>
<body>
	<form method="get">
		<pre>	
			<input type="submit" name="btnInsert" value="Insert"> 
			<input type="submit" name="btnDisplay" value="Display Record"> 
		</pre>
	</form>
</body>
</html>

<?php

	$con= mysqli_connect("localhost","root","","patriciahappyshopping") 
		or die("Error in connection");

	if(isset($_GET['btnInsert'])){
		header("location: transaction.html");
	}
	else if(isset($_GET['btnDisplay'])){
		header("location: display.php");
	}
		

?>