
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
  content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>iiiPlay</title>
<link rel="icon" href="<c:url value='/img/favicon.png'/>">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css'/>">
<!-- animate CSS -->
<link rel="stylesheet" href="<c:url value='/css/animate.css'/>">
<link rel="stylesheet" href="<c:url value='/css/lightslider.min.css'/>">
<!-- owl carousel CSS -->
<link rel="stylesheet" href="<c:url value='/css/nice-select.css'/>">
<link rel="stylesheet" href="<c:url value='/css/owl.carousel.min.css'/>">
<link rel="stylesheet" href="<c:url value='/css/all.css'/>">
<!-- flaticon CSS -->
<link rel="stylesheet" href="<c:url value='/css/flaticon.css'/>">
<link rel="stylesheet" href="<c:url value='/css/themify-icons.css'/>">
<!-- font awesome CSS -->
<link rel="stylesheet" href="<c:url value='/css/magnific-popup.css'/>">
<!-- swiper CSS -->
<link rel="stylesheet" href="<c:url value='/css/slick.css'/>">
<!-- style CSS -->
<link rel="stylesheet" href="<c:url value='/css/price_rangs.css'/>">
<link rel="stylesheet" href="<c:url value='/css/style.css'/>">
<link rel="stylesheet" href="<c:url value='/css/owl.carousel.min.css'/>">
</head>
<body>
  <!--::header part start::-->
  <header class="main_menu home_menu">
    <div class="container">
      <div class="row align-items-center">
        <div class="col-lg-12">
          <nav class="navbar navbar-expand-lg navbar-light">
            <a class="navbar-brand" href="<c:url value='/'/>"> <img
              src="<c:url value='/img/logo.png'/>" alt="logo">
            </a>
            <button class="navbar-toggler" type="button"
              data-toggle="collapse"
              data-target="#navbarSupportedContent"
              aria-controls="navbarSupportedContent"
              aria-expanded="false" aria-label="Toggle navigation">
              <span class="menu_icon"><i class="fas fa-bars"></i></span>
            </button>
            <div class="collapse navbar-collapse main-menu-item"
              id="navbarSupportedContent">
              <ul class="navbar-nav">
                
                <li class="nav-item dropdown"><a
                  class="nav-link dropdown-toggle" href="blog.html"
                  id="navbarDropdown_1" role="button"
                  data-toggle="dropdown" aria-haspopup="true"
                  aria-expanded="false"> Online Shop </a>
                  <div class="dropdown-menu"
                    aria-labelledby="navbarDropdown_1">
                    <a class="dropdown-item"
                      href="${pageContext.request.contextPath}/product/allproducts">
                      Go shopping!</a> <a class="dropdown-item"
                      href="${pageContext.request.contextPath}/product/Cart.do">
                      MY cart </a>
                  </div></li>              
                <c:if test="${empty MemberBean}">
                  <c:if test="${empty googleUser}">
                    <li class="nav-item"><a class="nav-link"
                      href="<c:url value='/login.do'/>">Login/Register</a></li>
                  </c:if>
                </c:if>
                <c:if test="${!empty MemberBean}">
                  <li class="nav-item dropdown"><a
                    class="nav-link dropdown-toggle" href="login.do"
                    id="navbarDropdown_2" role="button"
                    data-toggle="dropdown" aria-haspopup="true"
                    aria-expanded="false"> ${MemberBean.id},Hello! </a>
                    <div class="dropdown-menu"
                      aria-labelledby="navbarDropdown_2">
                        <a class="dropdown-item"
                        href="${pageContext.request.contextPath}/product/findorder1">
                        My orders</a> <a class="dropdown-item" id="wishlists"
                        href="">
                        Wishlists</a>
                    </div></li>
                  <li class="nav-item"><a class="nav-link"
                    href="<c:url value='/logOut'/>">Log out</a></li>

                </c:if>
                <c:if test="${!empty googleUser}">
                  <li class="nav-item dropdown"><a
                    class="nav-link dropdown-toggle" href="login.do"
                    id="navbarDropdown_2" role="button"
                    data-toggle="dropdown" aria-haspopup="true"
                    aria-expanded="false"> ${googleUser.name},Hello!
                  </a>
                    </li>
                  <li class="nav-item"><a class="nav-link"
                    href="<c:url value='/googleLogOut'/>"
                    onclick="signOut();">Log out</a></li>
                </c:if>
                <li class="nav-item" style="height: 100px"><a
                  class="nav-link" style="height: 100px"
                  href="${pageContext.request.contextPath}/product/Cart.do"><img
                    class="" style="position: absolute; top: 20px"
                    height=50px width='50' id="${mem.productId}"
                    src="<c:url value="/img/shopcar.png"/>">
                    <span id="cartcount" class="cart-count-badge">0</span></a>
                </li>
              </ul>
            </div>
            <div class="hearer_icon d-flex"></div>
          </nav>
        </div>
      </div>
    </div>
  </header>
  <!-- Header part end-->
  <script>
 
			function signOut() {
				console.log('User signed out????.')
				var auth2 = gapi.auth2.getAuthInstance();
				auth2.signOut().then(function() {
					console.log('User signed out.');
				});
				auth2.disconnect();
			}
		</script>
    <script>
      function signOut() {
        console.log('User signed out????.')
        var auth2 = gapi.auth2.getAuthInstance();
        auth2.signOut().then(function() {
          console.log('User signed out.');
        });
        auth2.disconnect();
      }
    </script>
  <!-- jquery plugins here-->
  <script src="<c:url value='/js/jquery-1.12.1.min.js'/>"></script>
  <!-- popper js -->
  <script src="<c:url value='/js/popper.min.js'/>"></script>
  <!-- bootstrap js -->
  <script src="<c:url value='/js/bootstrap.min.js'/>"></script>
  <!-- easing js -->
  <script src="<c:url value='/js/jquery.magnific-popup.js'/>"></script>
  <!-- swiper js -->
  <script src="${pageContext.request.contextPath}/js/lightslider.min.js"></script>
  <script src="<c:url value='/js/swiper.min.js'/>"></script>
  <!-- swiper js -->
  <script src="<c:url value='/js/masonry.pkgd.js'/>"></script>
  <!-- particles js -->
  <script src="<c:url value='/js/owl.carousel.min.js'/>"></script>
  <script src="<c:url value='/js/jquery.nice-select.min.js'/>"></script>
  <!-- slick js -->
  <script src="<c:url value='/js/slick.min.js'/>"></script>
  <script src="${pageContext.request.contextPath}/js/swiper.jquery.js"></script>
  <script src="<c:url value='/js/jquery.counterup.min.js'/>"></script>
  <script src="<c:url value='/js/waypoints.min.js'/>"></script>
  <script src="<c:url value='/js/contact.js'/>"></script>
  <script src="<c:url value='/js/jquery.ajaxchimp.min.js'/>"></script>
  <script src="<c:url value='/js/jquery.form.js'/>"></script>
  <script src="<c:url value='/js/jquery.validate.min.js'/>"></script>
  <script src="<c:url value='/js/mail-script.js'/>"></script>
  <script src="${pageContext.request.contextPath}/js/stellar.js"></script>
  <script src="${pageContext.request.contextPath}/js/price_rangs.js"></script>
  <script> const contextPath="${pageContext.request.contextPath}"</script>
  <script src="<c:url value='/js/cartCount.js'/>"></script>
  <!-- custom js -->
  <script src="${pageContext.request.contextPath}/js/theme.js"></script>
  <script src="<c:url value='/js/custom.js'/>"></script>
</body>
</html>