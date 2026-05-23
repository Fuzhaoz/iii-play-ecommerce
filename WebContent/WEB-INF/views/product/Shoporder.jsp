<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
</head>
<body>
  <jsp:include page="/WEB-INF/views/top.jsp" />
  <section class="cart_area padding_top">
    <div class="container">
      <div class="cart_inner">
        <div class="table-responsive">
          <form id="myform" method="post"
            action="<c:url value="/product/update.do"/>">
            <table class="table">
              <thead>
                <tr>
                  <th scope="col">Product Image</th>
                  <th scope="col">Product Name</th>
                  <th scope="col">Unit Price</th>
                  <th scope="col">Quantity</th>
                  <th scope="col">Total</th>
                  <th scope="col">Delete</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="mem" varStatus="status"
                  items="${cart.orderItems}">
                  <tr>
                    <td class="d-flex"><img width='130'
                      class="single_product_item"
                      src="Images.do/${mem.product.productId}" alt="" />
                    </td>
                    <td>
                      <div class="media">
                        <div class="media-body">
                          <p id="pdn" class="pdd">${mem.product.productName}</p>
                        </div>
                      </div>
                    </td>
                    <td>
                      <h5>$${mem.product.price}</h5>
                    </td>
                    <td>
                      <div class="product_count">
                        <input id="${mem.product.productId}"
                          name="quantity" class="qt" value="${mem.num}"
                          min="0" max="20" type="number">
                          <span class="tt">stock :</span>
                          <span class="stock">${mem.product.stock}</span>
                      </div>
                    </td>
                    <td>
                      <h5 class="subtotal">$${mem.subtotal}</h5>
                    </td>
                    <td class="remove-pr"><a
                      href="${pageContext.request.contextPath}/product/remove.do/${mem.product.productId}"
                      id="${mem.product.productId}" class="btn_1 aaaa"
                      style="width: 120px">Delete</a></td>
                  </tr>
                </c:forEach>
              <tbody>
                <c:if test="${empty cart.orderItems }">
                  <tr class="bottom_button">
                    <td>
                      <div>
                        <a id="clear1" class="btn_1"
                          href="<c:url value="/product/CartServlet1.do"/>">Clear</a>
                      </div>
                    </td>
                    <td></td>
                    <td></td>
                    <td><h4>No Product</h4></td>
                    <td></td>
                    <td></td>
                  </tr>
                </c:if>
              </tbody>
              <c:if test="${not empty cart.orderItems}">
                <tr class="bottom_button">
                  <td>
                    <div>
                      <a id="clear1" class="btn_1"
                        href="<c:url value="/product/CartServlet1.do"/>">Clear
                        cart</a>
                    </div>
                  </td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
              </c:if>
              <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>
                  <h3>Total</h3>
                </td>
                <td>
                  <h3 id="total">$${cart.total}</h3>
                </td>
              </tr>
              </tbody>
            </table>
          </form>
          <div class="checkout_btn_inner float-right">
            <a class="btn_1"
              href="${pageContext.request.contextPath}/product/allproducts">Continue
              Shopping</a> <a class="btn_1 checkout_btn_1" id="save">Enter
              Shipping Info</a>
          </div>
        </div>
      </div>
    </div>
  </section>
</body>
<script>
	$(function() {
		$(".aaaa").click(function() {
			if (window.confirm('Delete?')) {
				;
				return true;
			} else {

				return false;
			}
		})
	});

	$(function() {
		$(".checkout_btn_1")
				.click(
						function() {
							const pdn = $(".pdd")
							const plength = pdn.length
							console.log(plength)
							if (plength > 0) {
								window.location.href = "${pageContext.request.contextPath}/product/saveorder"
							}
							else if (plength == 0) {

								var a = confirm('Your cart is empty. Do you want to continue shopping')
								if (a) {
									window.location.href = "${pageContext.request.contextPath}/product/allproducts"
								} else {
									return false;
								}

							}

						})
	});

	$(function() {
		$("#clear1").click(function() {
			if (window.confirm('Confirm?')) {
				;
				return true;
			} else {

				return false;
			}
		});
	})

$(function() {
  $(".qt").on("change", function(){
      const qtv = parseInt($(this).val());
      const ss = parseInt($(this).closest("td").find(".stock").text());
      console.log(qtv)
      console.log(ss)
      if(qtv>ss){
	       alert("Exceeds stock limit")
	      $(this).val(1)
	        }
	    })

});

	$(function() {

		$(".qt")
				.change(
						function() {
							const pid = this.id;
							const qtt = this.value;

							$
									.ajax({
										url : "${pageContext.request.contextPath}/product/ProductDetail.do/update.do",
										dataType : "json",
										async : true,
										data : {
											"quantity" : qtt,
											"pid" : pid,
										},
										type : "GET",
										success : function(req) {

											for (var i = 0; i < req.orderItems.length; i++) {
												sb = req.orderItems[i].subtotal
												$(".subtotal").eq(i).text(
														"$" + sb)
											}
											$("#total").text("$" + req.total);
										},
									});

						});
	})
</script>
</html>