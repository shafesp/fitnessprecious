<?php 
require('top.php');
if(isset($_SESSION['USER_LOGIN']) && $_SESSION['USER_LOGIN']=='yes'){
	?>
	<script>
	window.location.href='index.php';
	</script>
	<?php
}
?>
<!-- Start Bradcaump area -->
        <div class="ht__bradcaump__area" style="background: rgba(0, 0, 0, 0) url(images/bg/4.png) no-repeat scroll center center / cover ;">
            <div class="ht__bradcaump__wrap">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="bradcaump__inner">
                                <nav class="bradcaump-inner">
                                  <a class="breadcrumb-item" href="index.php">Home</a>
                                  <span class="brd-separetor"><i class="zmdi zmdi-chevron-right"></i></span>
                                  <span class="breadcrumb-item active">Login/Register</span>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Bradcaump area -->
        
		<!-- Start Contact Area -->
        <section class="htc__contact__area ptb--100 bg__white">
            <div class="container">
                <div class="row">
					<div class="col-md-6">
						<div class="contact-form-wrap mt--60">
							<div class="col-xs-12">
								<div class="contact-title">
									<h2 class="title__line--6">Login</h2>
								</div>
							</div>
							<div class="col-xs-12">
								<form id="login-form" action="login_submit.php" method="post">
									<div class="single-contact-form">
										<div class="contact-box name">
											<input type="text" name="email" id="login_email" placeholder="Your Email*" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title="Email format should be abc@gmail.com" style="width:100%" required>
										</div>
										<span class="field_error" id="login_email_error"></span>
									</div>
									<div class="single-contact-form">
										<div class="contact-box name">
											<input type="password" name="password" id="login_password" placeholder="Your Password*" pattern=".{8,}" title="Must be more than 8 characters" style="width:100%" required>
										</div>
										<span class="field_error" id="login_password_error"></span>
									</div>
									
									<div class="contact-btn">
										<input type="submit" class="fv-btn" name="login" value="LOGIN">
									</div>
								</form>
								<div class="form-output login_msg">
									<p class="form-messege field_error"></p>
								</div>
							</div>
						</div> 
                
				</div>
				

					<div class="col-md-6">
						<div class="contact-form-wrap mt--60">
							<div class="col-xs-12">
								<div class="contact-title">
									<h2 class="title__line--6">Register</h2>
								</div>
							</div>
							<div class="col-xs-12">
								<form id="register-form" action="register_submit.php" method="post">
									<div class="single-contact-form">
										<div class="contact-box name">
											<input type="text" name="name" id="name" placeholder="Your Name*" style="width:100%" required>
										</div>
										<span class="field_error" id="name_error"></span>
									</div>
									<div class="single-contact-form">
										<div class="contact-box name">
											<input type="text" name="email" id="email" placeholder="Your Email*" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title="Email format should be abc@gmail.com" style="width:100%" required>
										</div>
										<span class="field_error" id="email_error"></span>
									</div>
									<div class="single-contact-form">
										<div class="contact-box name">
											<input type="text" name="mobile" id="mobile" placeholder="Your Mobile*" pattern=".{10}" title="Must contain 10 numbers" style="width:100%" required>
										</div>
										<span class="field_error" id="mobile_error"></span>
									</div>
									<div class="single-contact-form">
										<div class="contact-box name">
											<input type="password" name="password" id="password" placeholder="Your Password*" pattern=".{8,}" title="Must be more than 8 characters" style="width:100%" required>
										</div>
										<span class="field_error" id="password_error"></span>
									</div>
									
									<div class="contact-btn">
										<input type="submit" class="fv-btn" name="create" value="REGISTER" >
									</div>
								</form>
								<div class="form-output register_msg">
									<p class="form-messege field_error"></p>
								</div>
							</div>
						</div> 
                
				</div>
					
            </div>
        </section>
<?php require('footer.php')?>        