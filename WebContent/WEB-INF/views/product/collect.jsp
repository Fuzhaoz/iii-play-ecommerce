<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>aranoz</title>
  
</head>
<body>
	<jsp:include page="/WEB-INF/views/top.jsp" />


	<!-- breadcrumb start-->

	<!--================Category Product Area =================-->
	<section class="cat_product_area section_padding" style="height:1000px">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="left_sidebar_area">
						<aside class="left_widgets p_filter_widgets">
							<div class="l_w_title">
								<h3>iii商城</h3>
							</div>
							<div class="widgets_inner">
								<ul class="list">
									<li>
										<a id="a1" href="<c:url value="/product/allproducts"/>">全部商品</a>
										<span id="all"> </span>
									</li>
									<li>
										<a id="new" href="<c:url value="/product/newpd.do"/>">最新商品</a>
										<span>(5)</span>
									</li>

									<li>
										<a id="hot" href="<c:url value="/product/allhots"/>">熱銷專區</a>
										<span>(5)</span>
									</li>

								</ul>
							</div>
						</aside>

						<aside class="left_widgets p_filter_widgets">
							<div class="l_w_title">
								<h3>品牌館</h3>
							</div>
							<div class="widgets_inner">
								<ul class="list">
									<li>
										<a href="<c:url value="/product/category.do/羅技"/>">羅技Logitech</a>
										<span>(8)</span>
									</li>
									<li>
										<a href="<c:url value="/product/category.do/曜越"/>">曜越TTeSports</a>
										<span>(7)</span>
									</li>
									<li class="active">
										<a href="<c:url value="/product/category.do/雷蛇"/>">雷蛇Razer</a>
										<span>(6)</span>
									</li>

								</ul>

							</div>
						</aside>
						<aside class="left_widgets p_filter_widgets">
							<div class="l_w_title">
								<h3>商品分類</h3>
							</div>
							<div class="widgets_inner">
								<ul class="list">
									<li>
										<a href="<c:url value="/product/type.do/滑鼠"/>">滑鼠</a>
										<span>(7)</span>
									</li>
									<li>
										<a href="<c:url value="/product/type.do/鍵盤"/>">鍵盤</a>
										<span>(5)</span>
									</li>
									<li class="active">
										<a href="<c:url value="/product/type.do/耳機"/>">耳機</a>
										<span>(4)</span>
									</li>
									<li>
										<a href="<c:url value="/product/type.do/滑鼠墊"/>">滑鼠墊</a>
										<span>(5)</span>
									</li>

								</ul>
							</div>
						</aside>
						<aside class="left_widgets p_filter_widgets price_rangs_aside">
							<div class="l_w_title">
								<h3>Price Filter</h3>
							</div>
							<div class="widgets_inner">
								<div class="range_item">
									<!-- <div id="slider-range"></div> -->
									<input type="text" class="js-range-slider" value="" />
									<div class="d-flex">
										<div style="width: 60px" class="price_text">
											<p>Price :</p>
										</div>
										<div style="width: 100px;" class="price_value d-flex justify-content-center">
											<input type="text" size="20" class="js-input-from1" />
											<span>to</span>
											<input type="text" class="js-input-to2" />
										</div>
									</div>
								</div>
							</div>
						</aside>
					</div>

				</div>
				<div class="col-lg-9">
					
  <span> <img height='70px' width='70px'
	         src='${pageContext.request.contextPath}/member/getImage/${MemberBean.id}' > </span><font style="font-size:30px ;font-family:Microsoft JhengHei;">&nbsp ${MemberBean.id}的收藏</font>
					
					<div class="row align-items-center latest_product_inner" id="div">
					<c:if test="${empty colpd}">
					
					
							<div class="col-lg-4 col-sm-6">
								
								<div class="single_product_item"  id="div1">
								<div class="single_product_text">
					             <h2>尚無收藏</h2>
					</div>
					</div>
					</div>
			
					
					</c:if>
					</div>
					
					  <c:if test="${not empty colpd}"> 
					<div class="row align-items-center latest_product_inner" id="div">

						<c:forEach var="mem" varStatus="status" items="${colpd}">

							<div class="col-lg-4 col-sm-6">
								
								<div class="single_product_item"  id="div1">
							
							      
									<img class="detail1 src" id="${mem.pdBean.productId}" width='150' src="<c:url value="/product/Images.do/${mem.pdBean.productId}"/>" alt="">

									<div class="single_product_text">
										<h4 class="detail na" id="${mem.pdBean.productId}">${mem.pdBean.productName}</h4>
										<h3 class="zzz">$${mem.pdBean.price}</h3>
										<input type="button" class="btn_3" id="${mem.pdBean.productId}" value="加入購物車">
										<span>
											<img class="add_cart  add_cart1" width='30' id="${mem.pdBean.productId}" src="<c:url value="/img/Love-1.png"/>" alt="收藏">
										</span>
										<div id='pid' class="pid" style="display: none;">${mem.pdBean.productId}</div>
									</div>
								</div>
							</div>

						</c:forEach>


					</div>
	</c:if>
				</div>
			</div>
		</div>
		
	</section>

		<section class="product_list best_seller">
<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-12">
					<div class="section_tittle text-center">
						<h2>
							      你可能會喜歡						
						</h2>
					</div>
				</div>
			</div>
			
		
			
			
			
			<div class="row align-items-center justify-content-between">
				<div class="col-lg-12">
				<c:if test="${empty like}">
            <h1>你還沒購買過任何商品，所以無法給予推薦!</h1>
            </c:if>
				<c:if test="${!empty like}">
					<div class="best_product_slider owl-carousel">
            
						<c:forEach var="mem" varStatus="status" items="${like}">

						
								<div class="single_product_item" id="div1">
							
									<img class="detail1 src" id="${mem.productId}"  style="width:150px ; height:150px " src="<c:url value="/product/Images.do/${mem.productId}"/>" alt="">

									<div class="single_product_text">
										<h4 class="detail na" id="${mem.productId}">${mem.productName}</h4>
										<h3 class="zzz">$${mem.price}</h3>

										<input type="button" class="btn_3" id="${mem.productId}" value="加入購物車">
                                        <span>
											<img class="add_cart  add_cart1"  style="width:30px ; height:30px ;display:inline;" id="${mem.productId}" src="<c:url value="/img/Love-1.png"/>" alt="收藏">
										</span>
									</div>

								
									</div>
							
						</c:forEach>
                  </div>
</c:if>
					</div>
				</div>
			</div>
			
			</section>
		 <footer class="footer_part">
    <div class="container">
      <div class="row justify-content-around">
        <div class="col-sm-6 col-lg-2">
          <div class="single_footer_part">
            <h4>Top Products</h4>
            <ul class="list-unstyled">
              <li><a href="">Managed Website</a></li>
              <li><a href="">Manage Reputation</a></li>
              <li><a href="">Power Tools</a></li>
              <li><a href="">Marketing Service</a></li>
            </ul>
          </div>
        </div>
        <div class="col-sm-6 col-lg-2">
          <div class="single_footer_part">
            <h4>Quick Links</h4>
            <ul class="list-unstyled">
              <li><a href="">Jobs</a></li>
              <li><a href="">Brand Assets</a></li>
              <li><a href="">Investor Relations</a></li>
              <li><a href="">Terms of Service</a></li>
            </ul>
          </div>
        </div>
        <div class="col-sm-6 col-lg-2">
          <div class="single_footer_part">
            <h4>Features</h4>
            <ul class="list-unstyled">
              <li><a href="">Jobs</a></li>
              <li><a href="">Brand Assets</a></li>
              <li><a href="">Investor Relations</a></li>
              <li><a href="">Terms of Service</a></li>
            </ul>
          </div>
        </div>
        <div class="col-sm-6 col-lg-2">
          <div class="single_footer_part">
            <h4>Resources</h4>
            <ul class="list-unstyled">
              <li><a href="">Guides</a></li>
              <li><a href="">Research</a></li>
              <li><a href="">Experts</a></li>
              <li><a href="">Agencies</a></li>
            </ul>
          </div>
        </div>
        <div class="col-sm-6 col-lg-4">
          <div class="single_footer_part">
            <h4>Newsletter</h4>
            <p>Heaven fruitful doesn't over lesser in days. Appear creeping
            </p>
            <div id="mc_embed_signup">
              <form target="_blank"
                action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
                method="get" class="subscribe_form relative mail_part">
                <input type="email" name="email" id="newsletter-form-email" placeholder="Email Address"
                  class="placeholder hide-on-focus" onfocus="this.placeholder = ''"
                  onblur="this.placeholder = ' Email Address '">
                <button type="submit" name="submit" id="newsletter-submit"
                  class="email_icon newsletter-submit button-contactForm">subscribe</button>
                <div class="mt-10 info"></div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="copyright_part">
      <div class="container">
        <div class="row">
          <div class="col-lg-8">
            <div class="copyright_text">
              <P><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="ti-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></P>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="footer_icon social_icon">
              <ul class="list-unstyled">
                <li><a href="#" class="single_social_icon"><i class="fab fa-facebook-f"></i></a></li>
                <li><a href="#" class="single_social_icon"><i class="fab fa-twitter"></i></a></li>
                <li><a href="#" class="single_social_icon"><i class="fas fa-globe"></i></a></li>
                <li><a href="#" class="single_social_icon"><i class="fab fa-behance"></i></a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </footer>



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
	<!-- custom js -->	
	<script src="${pageContext.request.contextPath}/js/theme.js"></script>
<script src="<c:url value='/js/custom.js'/>"></script>


	<script>

		//進入詳情
		$(function() {
			$(".detail")
					.click(
							function() {

								var pid = this.id;
								window.location.href = "<c:url value="/product/ProductDetail.do/"/>"
										+ pid;

							});
		})
		//進入詳情
		$(function() {
			$(".detail1")
					.click(
							function() {

								var pid = this.id;
								window.location.href = "<c:url value="/product/ProductDetail.do/"/>"
										+ pid;

							});
		})
	</script>


	<script>
		//加入購物車
		$(function() {
			$(".btn_3")
					.click(
							function() {
								var pid = this.id;
								if (window.confirm('確定加入購物車?')) {
									;

									$.ajax({
												url : "<c:url value='/product/ProductDetail.do/Cart.do'/>", //請求的url地址
												dataType : "json", //返回格式為json
												async : true, //請求是否非同步，預設為非同步，這也是ajax重要特性
												data : {
													"quantity" : 1,
													"pid" : pid
												}, //引數值
												type : "GET", //請求方式
												success : function(req) {

												},
												complete : function() {
													//請求完成的處理
												},
												error : function() {
													console.log("出錯了!")
												}
											});

								} else {

									return false;
								}

							})
		})

		$(window).load(function() {
			var pdId = document.getElementsByClassName("pid");
			var love = document.getElementsByClassName("add_cart");

			for (i = 0; i < pdId.length; i++) {
				var pid = pdId[i].innerHTML

				$.ajax({
					type : "GET",
					url : "<c:url value='/product/checkcol'/>",
					async : false,
					contentType : "application/json",
					dataType : "json",
					data : {
						"pdId" : pid,
					},
					success : function(req) {
					
						if (req == 1) {
						
							love[i].src = "<c:url value='/img/love-2.png'/>"

						} else {
							
							love[i].src = "<c:url value='/img/Love-1.png'/>"
						}

					}
				});
			}
		})

		$(function() {

			$(".add_cart").click(function() {
				
					if (this.src.indexOf("<c:url value='/img/love-2.png'/>")!=-1) {
                    console.log("取消"+this.src)
                    		
					var pid = this.id;

					if (window.confirm('確定取消收藏?')) {
						this.src="<c:url value='/img/Love-1.png'/>"
						$.ajax({
							url : "<c:url value = '/product/deletcol'/>", //請求的url地址
							dataType : "json", //返回格式為json
							async : true, //請求是否非同步，預設為非同步，這也是ajax重要特性
							data : {
								"pid" : pid
							}, //引數值
							type : "Get", //請求方式
							success : function(req) {
                           
							window.location.href = "${pageContext.request.contextPath}/product/colpd"
								
							},
							complete : function() {
								//請求完成的處理
							},
							error : function() {
								console.log("出錯了!")
							}
						});

					} else {

						return false;
					}
					
				} else if(this.src.indexOf("<c:url value='/img/love-3.png'/>")!=-1){
					console.log("收藏"+this.src)
					var pid = this.id;
					
					if (window.confirm('確定要收藏嗎?')) {
						;
						this.src = "<c:url value='/img/love-2.png'/>"
						$.ajax({
							url : "<c:url value='/product/addcol'/>", //請求的url地址
							dataType : "json", //返回格式為json
							async : true, //請求是否非同步，預設為非同步，這也是ajax重要特性
							type : "Get",
							data : {
								"pdId" : pid
							}, //引數值
							//請求方式
							success : function(req) {

							},
							complete : function() {
								//請求完成的處理
							},
							error : function() {
								console.log("出錯了!")
							}
						});
					} else {

						return false;
					}



					}
			})

		})

           //登入時顯示收藏
		window.onload = function() {
			$.ajax({
				url : "<c:url value='/product/showallcount'/>", //請求的url地址
				dataType : "json", //返回格式為json
				async : true, //請求是否非同步，預設為非同步，這也是ajax重要特性
				type : "GET", //請求方式
				success : function(req) {

					sub = document.getElementById("all");
					sub1 = document.getElementById("all1");
					sub.innerHTML = "(" + req + ")"
					sub1.innerHTML = "(" + req + ")"
				},
				complete : function() {
					//請求完成的處理
				},
				error : function() {
					console.log("出錯了!")
				}
			});

		}


		    //收藏鍵效果
			let list=document.querySelectorAll(".add_cart")

			 for(i=0;i<list.length;i++){
			 list[i].onmouseover=mouseOver; //事件繫結  重要 加 ()立即執行
			 list[i].onmouseout=mouseOut;
			}

			 let a=document.querySelectorAll(".add_cart")

			         function mouseOver() {
                       
			           this.class="aaa"
			            if(this.class=="aaa"){
			            	
				 if(this.src.indexOf("<c:url value='/img/love-2.png'/>")!=-1){
					
					 }else if(this.src.indexOf("<c:url value='/img/Love-1.png'/>")!=-1)
					{   
			             this.src="<c:url value='/img/love-3.png'/>"
			            	 console.log(this.src)
			         }

			             }
			 }
			         function mouseOut() {
			            this.class="add_cart"
			            if(this.class=="add_cart"){

		                     if(this.src.indexOf("<c:url value='/img/love-3.png'/>")!=-1){

		                    	 this.src="<c:url value='/img/Love-1.png'/>"
		                         }

			         }

			         }
	</script>
</body>

</html>








<!-- jquery plugins here-->

