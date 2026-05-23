<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach var="mem" varStatus="status" items="${memberList}">
  <div class="col-lg-4 col-sm-6">
    <div class="single_product_item" id="div1">
      <c:choose>
        <c:when test="${tag == 'new'}">
          <img id="tag_img" style='position: absolute; right: 20%;'
            width='60' src="<c:url value="/img/NEW.png"/>" alt="new">
        </c:when>
        <c:when test="${tag == 'hot'}">
          <img id="tag_img" style='position: absolute; right: 20%;'
            width='60' src="<c:url value='/img/HOT.png'/>" alt="hot" />
        </c:when>
      </c:choose>
      <img class="detail1 src" id="${mem.productId}" width="150"
        src="<c:url value='/product/Images.do/${mem.productId}'/>" />
      <div class="single_product_text">
        <h4 class="detail_name" id="${mem.productId}">${mem.productName}</h4>
        <h3 class="zzz">$${mem.price}</h3>
        <c:if test="${mem.stock >0}">
        <input type="button" class="btn_3" id="${mem.productId}"
          value="Add to Cart"/> 
          <span> <img
          class="add_cart add_cart1" width="30" id="${mem.productId}"
          src="<c:url value='/img/Love-1.png'/>" />
        </span>
          </c:if>
          <c:if test="${mem.stock == 0}">
             <h4 style="font-size: 16px;">Sold out</h4>
              </c:if>
        <div id='pid' class='pid' style="display: none;">${mem.productId}</div>
      </div>
    </div>
  </div>
</c:forEach>
