<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>


</head>
<body>

<jsp:include page="/WEB-INF/views/top.jsp"/>
	

<section class="cart_area padding_top">
    <div class="container">
      <div class="cart_inner">
        <div class="table-responsive">
        <span> <img height='70px' width='70px'
	         src='${pageContext.request.contextPath}/member/getImage/${MemberBean.id}' > </span><font style="font-size:30px ;font-family:Microsoft JhengHei;"> &nbsp ${MemberBean.id}'s order</font>
          <table class="table">
            <thead>
              <tr>
                <th scope="col">Order Number</th>
                <th scope="col">Recipient</th>
                <th scope="col">Order Date</th>
                <th scope="col">Deliver Address</th>
              <th scope="col">Total Amount</th>
                <th scope="col">Deatils</th>
                <th scope="col">payment</th>
              </tr>
            </thead>
            	
   	
            	
            	<c:forEach var="mem" varStatus="status" items="${order}">
            <tbody>                                                                                                                                                                                                                                                                   
              <tr>
           <td class="d-flex">
		    <p>${mem.orderId}</p>
		   
		   </td>    
       
      
                <td>
                  <div class="media">
                    
                    <div class="media-body">
                      <p>${mem.name}</p>
                    </div>
                  </div>
             
                </td>
            
                <td>
                  <h5>${mem.orderDate}</h5>
                </td>
              
                 <td>
                  <h5>${mem.shippingAddress}</h5>
                </td>
                <td>
                  <h5 class="subtotal">$${mem.total}</h5>
                </td>           
                <td>
                <a  class="btn_1" id="odd" href="<c:url value="/product/findorder/${mem.orderId}"/>">Details</a></div>
                </td>
                <td>
                     <c:if test="${mem.state==1}" >
                     <a  class="btn_1" href="<c:url value="/backstage/pay/${mem.orderId }"/>">Pay</a>
                     </c:if>
                      <c:if test="${mem.state==2}" >
                     <h5 class="btn_11">Paid</h5>
                     </c:if>
                
                </td>
<!--                 <td class="remove-pr"> -->
<%--                 <a href="${pageContext.request.contextPath}/product/remove.do/${mem.pdId}" id="${mem.productId}" class="delete">結帳</a> --%>
			
<!-- 	            </td> -->
<!--               </tr> -->
               </c:forEach>

               </tbody>          
          </table>
          
		 
        </div>
      </div>
      </div>
  </section>
  
  
  
  
			
</body>

<script>
	

	
	
	
	
</script>







</html>