<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

<!-- font awesome CSS -->

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

	<!-- banner part start-->
	


	<section class="banner_part">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-12">
					<div class="banner_slider owl-carousel">
						<c:forEach var="random" items="${random3Board}">
						
						<div class="single_banner_slider">
							<div class="row">
								<div class="col-lg-5 col-md-8">
									<div class="banner_text">
										<div class="banner_text_iner">
											<h1>${random.boardName}</h1>

											<a href="<c:url value='/forum/showAofB/${random.boardId}'/>" class="btn_2">進入討論區</a>
										</div>
									</div>
								</div>
								<div class="banner_img d-none d-lg-block">
									<img style="width:706px; height:353px;" src="<c:url value='/forum/loadImg/${random.boardId}'/>" alt="">
								</div>
							</div>
						</div>
						
						</c:forEach>
					</div>
					<div class="slider-counter"></div>
				</div>
			</div>
		</div>
	</section>

	<!-- banner part start-->
	<!-- product_list start-->
	
	
	
	
	<section class="product_list best_seller">
		
		<br>
	<br>
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-12">
					<div class="section_tittle text-center">
						<h2>
							Hot
						
						</h2>
					</div>
				</div>
			</div>
			<div class="row align-items-center justify-content-between">
				<div class="col-lg-12">
					<div class="best_product_slider owl-carousel">
            
						<c:forEach var="mem" varStatus="status" items="${memberList}">

						
								<div class="single_product_item" id="div1">
								<img id="hott" style='position:absolute ;right:20%;width:70px ; height:26.11px  '  src="<c:url value="/img/HOT.png"/>" alt="收藏">
									<img class="detail1 src" id="${mem.productId}" style="width:150px ; height:150px "  src="<c:url value="/product/Images.do/${mem.productId}"/>" alt="">

									<div class="single_product_text">
										<h4 class="detail na" id="${mem.productId}">${mem.productName}</h4>
										<h3 class="zzz">$${mem.price}</h3>

										<input type="button" class="btn_3" id="${mem.productId}" value="加入購物車">

									</div>

								
									</div>
							
						</c:forEach>
                  </div>

					</div>
				</div>
			</div>
		
	</section>
   
	<!-- product_list part start-->


	<jsp:include page="/WEB-INF/views/top.jsp" />
</body>
</html>