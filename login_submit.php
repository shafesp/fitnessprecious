<?php
require('connection.inc.php');
require('functions.inc.php');

if(isset($_POST["login"]))
{
	$email=get_safe_value($con,$_POST['email']);
	$password=get_safe_value($con,$_POST['password']);

	$res=mysqli_query($con,"select * from users where email='$email' and password='$password'");
	$check_user=mysqli_num_rows($res);
	if($check_user>0){
		$row=mysqli_fetch_assoc($res);
		$_SESSION['USER_LOGIN']='yes';
		$_SESSION['USER_ID']=$row['id'];
		$_SESSION['USER_NAME']=$row['name'];
		$_SESSION['USER_EMAIL']=$row['email'];
		$_SESSION['USER_MOBILE']=$row['mobile'];
		echo "<script>window.alert('Login Successful');</script>";
		echo "<script>window.location.href='index.php';</script>";
	}else{
		echo "<script>window.alert('Invalid email/password');</script>";
		echo "<script>window.location.href='login.php';</script>";
	}
}
?>