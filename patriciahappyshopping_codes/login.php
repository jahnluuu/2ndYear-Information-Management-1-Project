<html>
<body>
	<form method="post">
		<pre>
			Input username:<input type="text" name="txtUname">
			Input password:<input type="password" name="txtPwd">
			
			<input type="submit" name="btnLogin" value="Login"> 
		</pre>
	</form>
</body>
</html>

<?php
	session_start();
	$con= mysqli_connect("localhost","root","","patriciahappyshopping") 
		or die("Error in connection");
	echo "connected";
	if(isset($_POST['btnLogin'])){
		$uname=$_POST['txtUname'];
		$pwd=$_POST['txtPwd'];
		$sql ="select usernameID,passcode from user where usernameID='$uname'";
		$result = mysqli_query($con,$sql);
		$count = mysqli_num_rows($result);
		
		
		$row = mysqli_fetch_array($result);
		
		if($count== 0){
			echo "<script language='javascript'>
						alert('username not existing.');
				  </script>";
		}else if($row[1] != $pwd) {
			echo "<script language='javascript'>
						alert('Incorrect password');
				  </script>";
		}else{
			$_SESSION['usernameID']=$row[0];
			$_SESSION['authenticated'] = true;
			header("location: home.php");
		}
			
		
	}
		

?>