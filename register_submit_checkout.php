<?php
require('connection.inc.php');
require('functions.inc.php');

if(isset($_POST["create"]))
{
	$name=get_safe_value($con,$_POST['name']);
	$email=get_safe_value($con,$_POST['email']);
	$mobile=get_safe_value($con,$_POST['mobile']);
	$password=get_safe_value($con,$_POST['password']);
	$check_user=mysqli_num_rows(mysqli_query($con,"select * from users where email='$email'"));
	if($check_user>0){
		echo "<script>window.alert('Email already present');</script>";
		echo "<script>window.location.href='checkout.php';</script>";
	}else{
		$added_on=date('Y-m-d h:i:s');
		mysqli_query($con,"insert into users(name,email,mobile,password,added_on) values('$name','$email','$mobile','$password','$added_on')");
		echo "<script>window.alert('Thank You for Registration');</script>";
		echo "<script>window.location.href='checkout.php';</script>";
	}

}
?>