<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-lg-9">
					
  <span> <img height='70px' width='70px'
	         src='${pageContext.request.contextPath}/member/getImage/${MemberBean.id}' > </span><font style="font-size:30px ;font-family:Microsoft JhengHei;">&nbsp ${MemberBean.id}'s Wishlists</font>
					
					<div class="row align-items-center latest_product_inner" id="div">
					<c:if test="${empty memberList}">
					
					
							<div class="col-lg-4 col-sm-6">
								
								<div class="single_product_item"  id="div1">
								<div class="single_product_text">
					             <h2>No items saved</h2>
					</div>
					</div>
					</div>
			
					
					</c:if>
					</div>
					
					  <c:if test="${not empty memberList}"> 
					<div class="row align-items-center latest_product_inner" id="div">

						<c:forEach var="mem" varStatus="status" items="${memberList}">

							<div class="col-lg-4 col-sm-6">
								
								<div class="single_product_item"  id="div1">
							
							      
									<img class="detail1 src" id="${mem.pdBean.productId}" width='150' src="<c:url value="/product/Images.do/${mem.pdBean.productId}"/>" alt="">

									<div class="single_product_text">
										<h4 class="detail na" id="${mem.pdBean.productId}">${mem.pdBean.productName}</h4>
										<h3 class="zzz">$${mem.pdBean.price}</h3>
										<input type="button" class="btn_3" id="${mem.pdBean.productId}" value="Add to cart">
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
