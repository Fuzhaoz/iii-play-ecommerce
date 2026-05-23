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
          <form id="myform" method="post" action="<c:url value="/product/update.do"/>">
          <table class="table">
            <thead>
              <tr>
                <th scope="col">Product Image</th>
                <th scope="col">Product Name</th>
                <th scope="col">Price</th>
                  <th scope="col">Quantity</th>
                <th scope="col">Total</th>
               
              </tr>
            </thead>
            	
   	
            	
            	<c:forEach var="mem" varStatus="status" items="${oitem}">
            <tbody>                                                                                                                                                                                                                                                                   
              <tr>
           <td class="d-flex">
			<img  width='130' class="single_product_item" src="<c:url value="/product/Images.do/${mem.pdId.productId}"/>" alt="" />
		   
		   </td>    
       
      
                <td>
                  <div class="media">
                    
                    <div class="media-body">
                      <p>${mem.pdId.productName}</p>
                    </div>
                  </div>
             
                </td>
            
                <td>
                  <h5>${mem.pdId.price}</h5>
                </td>
              
                 <td>
                  <h5>${mem.quantity}</h5>
                </td>
                <td>
                  <h5 class="subtotal">${mem.total}</h5>
                </td>
         

               </c:forEach>
      <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>

      <td>
  <a  class="btn_1" href="<c:url value="/product/findorder1"/>">Previous page</a>
                </td>
      
      
      
      
      </tr>
     


               </tbody>          
          </table>
           </form>
		 
      </div>
      </div>
  </section>
  
  
  
  
			
</body>


	
	
	
</script>







</html>