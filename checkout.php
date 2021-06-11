<?php 
require('top.php');
if(!isset($_SESSION['cart']) || count($_SESSION['cart'])==0){
	?>
	<script>
		window.location.href='index.php';
	</script>
	<?php
}


$cart_total=0;

if(isset($_POST['submit'])){
	$address=get_safe_value($con,$_POST['address']);
	$city=get_safe_value($con,$_POST['city']);
	$state=get_safe_value($con,$_POST['state']);
	$pincode=get_safe_value($con,$_POST['pincode']);
	$payment_type=get_safe_value($con,$_POST['payment_type']);
	$user_id=$_SESSION['USER_ID'];
	foreach($_SESSION['cart'] as $key=>$val){
		$productArr=get_product($con,'','',$key);
		$price=$productArr[0]['price'];
		$qty=$val['qty'];
		$cart_total=$cart_total+($price*$qty);
		
	}
	$total_price=$cart_total;
	$payment_status='pending';
	if($payment_type=='cod'){
		$payment_status='success';
	}
	$order_status='1';
	$added_on=date('Y-m-d h:i:s');
	
	
	mysqli_query($con,"insert into `order`(user_id,address,city,state,pincode,payment_type,payment_status,order_status,added_on,total_price) values('$user_id','$address','$city','$state','$pincode','$payment_type','$payment_status','$order_status','$added_on','$total_price')");
	
	$order_id=mysqli_insert_id($con);
	
	foreach($_SESSION['cart'] as $key=>$val){
		$productArr=get_product($con,'','',$key);
		$price=$productArr[0]['price'];
		$qty=$val['qty'];
		
		mysqli_query($con,"insert into `order_detail`(order_id,product_id,qty,price) values('$order_id','$key','$qty','$price')");
	}
	
	unset($_SESSION['cart'])
	?>
	<script>
		window.location.href='thank_you.php';
	</script>
	<?php
	
	
}
?>

<div class="ht__bradcaump__area" style="background: rgba(0, 0, 0, 0) url(images/bg/4.png) no-repeat scroll center center / cover ;">
            <div class="ht__bradcaump__wrap">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="bradcaump__inner">
                                <nav class="bradcaump-inner">
                                  <a class="breadcrumb-item" href="index.php">Home</a>
                                  <span class="brd-separetor"><i class="zmdi zmdi-chevron-right"></i></span>
                                  <span class="breadcrumb-item active">checkout</span>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Bradcaump area -->
        <!-- cart-main-area start -->
        <div class="checkout-wrap ptb--100">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <div class="checkout__inner">
                            <div class="accordion-list">
                                <div class="accordion">
                                    
									<?php 
									$accordion_class='accordion__title';
									if(!isset($_SESSION['USER_LOGIN'])){
									$accordion_class='accordion__hide';
									?>
									<div class="accordion__title">
                                        Checkout Method
                                    </div>
                                    <div class="accordion__body">
                                        <div class="accordion__body__form">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="checkout-method__login">
                                                        <form id="login-form" action="login_submit_checkout.php" method="post">
                                                            <h5 class="checkout-method__title">Login</h5>
                                                            <div class="single-input">
                                                                <input type="text" name="email" id="login_email" placeholder="Your Email*" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title="Email format should be abc@gmail.com" style="width:100%" required>
																<span class="field_error" id="login_email_error"></span>
                                                            </div>
															
                                                            <div class="single-input">
                                                                <input type="password" name="password" id="login_password" placeholder="Your Password*" pattern=".{8,}" title="Must be more than 8 characters" style="width:100%" required>
																<span class="field_error" id="login_password_error"></span>
                                                            </div>
															
                                                            <p class="require">* Required fields</p>
                                                            <div class="dark-btn">
																<input type="submit" class="fv-btn" name="login" value="LOGIN">
															</div>
															<div class="form-output login_msg">
																<p class="form-messege field_error"></p>
															</div>
                                                        </form>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="checkout-method__login">
                                                        <form id="register-form" action="register_submit_checkout.php" method="post">
                                                            <h5 class="checkout-method__title">Register</h5>
                                                            <div class="single-input">
                                                                <input type="text" name="name" id="name" placeholder="Your Name*" style="width:100%" required>
																<span class="field_error" id="name_error"></span>
                                                            </div>
															<div class="single-input">
                                                                <input type="text" name="email" id="email" placeholder="Your Email*" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title="Email format should be abc@gmail.com" style="width:100%" required>
																<span class="field_error" id="email_error"></span>
                                                            </div>
															
                                                            <div class="single-input">
                                                                <input type="text" name="mobile" id="mobile" placeholder="Your Mobile*" pattern=".{10}" title="Must contain 10 numbers" style="width:100%" required>
																<span class="field_error" id="mobile_error"></span>
                                                            </div>
															<div class="single-input">
                                                                <input type="password" name="password" id="password" placeholder="Your Password*" pattern=".{8,}" title="Must be more than 8 characters" style="width:100%" required>
																<span class="field_error" id="password_error"></span>
                                                            </div>
                                                            <div class="dark-btn">
										<input type="submit" class="fv-btn" name="create" value="REGISTER" >
									</div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
									<?php } ?>
                                    <div class="<?php echo $accordion_class?>">
                                        Address Information
                                    </div>
									<form method="post">
										<div class="accordion__body">
											<div class="bilinfo">
												
													<div class="row">
														<div class="col-md-12">
															<div class="single-input">
																<input type="text" name="address" placeholder="Street Address" required>
															</div>
														</div>
														<div class="col-md-6">
															<div class="single-input">
																<input type="text" name="city" placeholder="City" required>
															</div>
														</div>
														<div class="col-md-6">
															<div class="single-input">
																<select name="state" placeholder="state" class="form-control" required>
																	<option value="Andhra Pradesh">Andhra Pradesh</option>
																	<option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
																	<option value="Arunachal Pradesh">Arunachal Pradesh</option>
																	<option value="Assam">Assam</option>
																	<option value="Bihar">Bihar</option>
																	<option value="Chandigarh">Chandigarh</option>
																	<option value="Chhattisgarh">Chhattisgarh</option>
																	<option value="Dadar and Nagar Haveli">Dadar and Nagar Haveli</option>
																	<option value="Daman and Diu">Daman and Diu</option>
																	<option value="Delhi">Delhi</option>
																	<option value="Lakshadweep">Lakshadweep</option>
																	<option value="Puducherry">Puducherry</option>
																	<option value="Goa">Goa</option>
																	<option value="Gujarat">Gujarat</option>
																	<option value="Haryana">Haryana</option>
																	<option value="Himachal Pradesh">Himachal Pradesh</option>
																	<option value="Jammu and Kashmir">Jammu and Kashmir</option>
																	<option value="Jharkhand">Jharkhand</option>
																	<option value="Karnataka">Karnataka</option>
																	<option value="Kerala">Kerala</option>
																	<option value="Madhya Pradesh">Madhya Pradesh</option>
																	<option value="Maharashtra">Maharashtra</option>
																	<option value="Manipur">Manipur</option>
																	<option value="Meghalaya">Meghalaya</option>
																	<option value="Mizoram">Mizoram</option>
																	<option value="Nagaland">Nagaland</option>
																	<option value="Odisha">Odisha</option>
																	<option value="Punjab">Punjab</option>
																	<option value="Rajasthan">Rajasthan</option>
																	<option value="Sikkim">Sikkim</option>
																	<option value="Tamil Nadu">Tamil Nadu</option>
																	<option value="Telangana">Telangana</option>
																	<option value="Tripura">Tripura</option>
																	<option value="Uttar Pradesh">Uttar Pradesh</option>
																	<option value="Uttarakhand">Uttarakhand</option>
																	<option value="West Bengal">West Bengal</option>
																	</select>
															</div>
														</div>
														<div class="col-md-6">
															<div class="single-input">
																<input type="text" name="pincode" placeholder="Postcode/ zip" required>
															</div>
														</div>
														
													</div>
												
											</div>
										</div>
										<div class="<?php echo $accordion_class?>">
											payment information
										</div>
										<div class="accordion__body">
											<div class="paymentinfo">
												<div class="single-method">
													COD <input type="radio" name="payment_type" value="COD" required/>
													&nbsp;&nbsp;PayU <input type="radio" name="payment_type" value="payu" required/>
												</div>
												<div class="single-method">
												  
												</div>
											</div>
										</div>
										 <input type="submit" name="submit" class="fv-btn"/>
									</form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="order-details">
                            <h5 class="order-details__title">Your Order</h5>
                            <div class="order-details__item">
                                <?php
								$cart_total=0;
								foreach($_SESSION['cart'] as $key=>$val){
								$productArr=get_product($con,'','',$key);
								$pname=$productArr[0]['name'];
								$mrp=$productArr[0]['mrp'];
								$price=$productArr[0]['price'];
								$image=$productArr[0]['image'];
								$qty=$val['qty'];
								$cart_total=$cart_total+($price*$qty);
								?>
								<div class="single-item">
                                    <div class="single-item__thumb">
                                        <img src="<?php echo PRODUCT_IMAGE_SITE_PATH.$image?>"  />
                                    </div>
                                    <div class="single-item__content">
                                        <a href="#"><?php echo $pname?></a>
                                        <span class="price">₹<?php echo $price?> x <?php echo $qty?></span>
                                    </div>
                                    <div class="single-item__remove">
                                        <a href="javascript:void(0)" onclick="manage_cart('<?php echo $key?>','remove')"><i class="icon-trash icons"></i></a>
                                    </div>
                                </div>
								<?php } ?>
                            </div>
                            <div class="ordre-details__total">
                                <h5>Order total</h5>
                                <span class="price">₹<?php echo $cart_total?></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        						
<?php require('footer.php')?>        