<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="zxx">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id"
	content="684766344068-k68l406h041ql6qcfbeq7v312gv82ou6.apps.googleusercontent.com">

<script src="https://apis.google.com/js/platform.js" async defer></script>
<script>function onSignIn(googleUser) {
  var profile = googleUser.getBasicProfile();
  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
  console.log('Name: ' + profile.getName());
  console.log('Image URL: ' + profile.getImageUrl());
  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
  var id_token = googleUser.getAuthResponse().id_token;
  var xhr = new XMLHttpRequest();
  xhr.open('POST', "googleSign", true);
  xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
  xhr.onload = function() {
    console.log('Signed in as: ' + xhr.responseText);
  };
  xhr.send('idtoken=' + id_token);
  
	location.href="<c:url value='/'/>"
}
</script>
<title>iiiPlay Login</title>
<script src="https://www.google.com/recaptcha/api.js"></script>
<link rel="icon" href="img/favicon.png">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- animate CSS -->
<link rel="stylesheet" href="css/animate.css">
<!-- owl carousel CSS -->
<link rel="stylesheet" href="css/owl.carousel.min.css">
<!-- font awesome CSS -->
<link rel="stylesheet" href="css/all.css">
<!-- flaticon CSS -->
<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/themify-icons.css">
<!-- font awesome CSS -->
<link rel="stylesheet" href="css/magnific-popup.css">
<!-- swiper CSS -->
<link rel="stylesheet" href="css/slick.css">
<!-- style CSS -->
<link rel="stylesheet" href="css/style.css">
</head>

<body>
	<!--::header part start::-->
	<jsp:include page="/WEB-INF/views/top.jsp" />
	<!-- Header part end-->


	

	<!--================login_part Area =================-->
	<section class="login_part padding_top">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 col-md-6">
					<div class="login_part_text text-center">
						<div class="login_part_text_iner">
							<h2>First time here? Welcome to our website</h2>
							<a href="register" class="btn_3">Join as member</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="login_part_form">
						<div class="login_part_form_iner">
							<h3>
								Welcome ! <br> Log in now
							</h3>
							<form class="row contact_form" action="checkLogin.do"
								method="post" novalidate="novalidate">
								<div class="col-md-12 form-group p_star">
									<input type="text" class="form-control" id="name" name="id"
										value="${sessionScope.user}" placeholder="UserID">
								</div>
								<div class="col-md-12 form-group p_star">
									<input type="password" class="form-control" id="password"
										name="password" value="${sessionScope.password}" placeholder="Password">
								</div>
								<div class="g-recaptcha"
									data-sitekey="6Lf19vgUAAAAAGHjPZkTQ2OPJJ2NHEKfteHdELf4"></div>

								<div class="col-md-12 form-group">
									<div class="creat_account d-flex align-items-center">

										<input type="checkbox" id="rm" name="rm">
										<label for="f-option">Remember me</label>
									</div>
									
									<script>
										
										if(${sessionScope.rememberMe}!=null){
											document.getElementById("rm").checked=true;
											}


									</script>
									<br>
								
									<div>
										<span class="txt3" style="color: red">${error.LoginError}</span><br>
										<span class="txt3" style="color: red">${error.robot}</span><br>
									</div>
									<button type="submit" value="submit" class="btn_3">
										Log in</button>
									<a class="lost_pass" href="forget">Forget password?</a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================login_part end =================-->

	<!--::footer_part start::-->

	<!--::footer_part end::-->

	<!-- jquery plugins here-->
	<!-- jquery -->
	<script src="js/jquery-1.12.1.min.js"></script>
	<!-- popper js -->
	<script src="js/popper.min.js"></script>
	<!-- bootstrap js -->
	<script src="js/bootstrap.min.js"></script>
	<!-- easing js -->
	<script src="js/jquery.magnific-popup.js"></script>
	<!-- swiper js -->
	<script src="js/swiper.min.js"></script>
	<!-- swiper js -->
	<script src="js/masonry.pkgd.js"></script>
	<!-- particles js -->
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<!-- slick js -->
	<script src="js/slick.min.js"></script>
	<script src="js/jquery.counterup.min.js"></script>
	<script src="js/waypoints.min.js"></script>
	<script src="js/contact.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.form.js"></script>
	<script src="js/jquery.validate.min.js"></script>
	<script src="js/mail-script.js"></script>
	<script src="js/stellar.js"></script>
	<script src="js/price_rangs.js"></script>
	<!-- custom js -->
	<script src="js/custom.js"></script>
</body>

</html>