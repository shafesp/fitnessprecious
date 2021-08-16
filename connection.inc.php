<?php
session_start();
$con=mysqli_connect("remotemysql.com","dkJk4i7bcS","l0XRA3aDPC","dkJk4i7bcS");
define('SERVER_PATH',$_SERVER['DOCUMENT_ROOT'].'/php/ecom/');
define('SITE_PATH','https://fitness-precious.herokuapp.com/');

define('PRODUCT_IMAGE_SERVER_PATH',SERVER_PATH.'media/product/');
define('PRODUCT_IMAGE_SITE_PATH',SITE_PATH.'media/product/');
?>
