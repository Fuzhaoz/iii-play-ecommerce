<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
  content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>aranoz</title>
</head>
<body>
  <jsp:include page="/WEB-INF/views/top.jsp" />
  <form id="saveform" method="get"
    action="${pageContext.request.contextPath}/product/checkout">
    <section class="checkout_area padding_top">
      <div class="container">
        <div class="returning_customer">
          <div class="billing_details">
            <div class="row">
              <div class="col-lg-8">
                <h3>Receipt</h3>
                <div class="col-md-6 form-group p_star">
                  <input type="text" class="form-control" id="first"
                    name="name" value="${param.name}"
                    placeholder="Recipient (Required)"
                    onblur="checkName()" /> <font color='red'
                    id="first1" size='-1'></font>
                </div>
                <div class="col-md-6 form-group p_star">
                  <input type="text" class="form-control" id="number"
                    name="number" value="${param.number}"
                    placeholder="Phone number (Required)"
                    onblur="checknum()" /> <font color='red'
                    id="number1" size='-1'></font>
                </div>
                <div class="col-md-12 form-group">
                  <input type="text" class="form-control" id="street"
                    name="street" placeholder="Street (Required)"
                    value="${param.street}" onblur="combineAddress()" />
                </div>
                <!-- Address - City/Suburb -->
                <div class="col-md-12 form-group">
                  <input type="text" class="form-control" id="city"
                    name="city" placeholder="City/Suburb (Required)"
                    value="${param.city}" onblur="combineAddress()" />
                </div>
                <!-- Address - State Dropdown -->
                
                <div class="col-md-12 form-group">
                  <select class="form-control" id="state" name="state"
                    onchange="combineAddress()">
                    <option value="">Select State</option>
                    <option value="NSW">NSW</option>
                    <option value="VIC">VIC</option>
                    <option value="QLD">QLD</option>
                    <option value="WA">WA</option>
                    <option value="SA">SA</option>
                    <option value="TAS">TAS</option>
                    <option value="ACT">ACT</option>
                    <option value="NT">NT</option>
                    <option value="Others">Others</option>
                  </select> <font color='white' id="address1" size='-1'></font>
                </div>
              
                       
                <input type="hidden" id="address" name="address"
                  value="${param.address}" />
               
                <div class="col-md-12 form-group">
                  <input type="text" class="form-control" id="email"
                    name="email" placeholder="Email"
                    value="${param.email}" onblur="checkemail()" /> <font
                    color='red' id="email1" size='-1'></font>
                </div>
                <input type="button" class="btn_5" id="insert"
                  value="Auto Fill">
              </div>
              <div style="width: 1000px" class="col-lg-4">
                <div style="width: 530px" class="order_box">
                  <h2 style="border-bottom: none">Your order</h2>
                  <table class="table">
                    <thead>
                      <tr>
                        <th scope="col">Product</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Total</th>
                      </tr>
                    </thead>
                    <c:forEach var="item" varStatus="status"
                      items="${order.items}">
                      <tbody>
                        <tr>
                          <td>
                            <div class="media-body">
                              <span class="last">${item.pdId.productName}</span>
                            </div>
                          </td>
                          <td><span class="middle">x${item.quantity}</span>
                          </td>
                          <td><span class="last">$${item.total}</span>
                          </td>
                        </tr>
                    </c:forEach>
                    <tr>
                      <td></td>
                      <td style="font-size: 20px">Grand Total</td>
                      <td><span style="font-size: 20px">$${order.total}</span>
                      </td>
                    </tr>
                    <tr>
                      <td><input type="button" class="btn_3"
                        id="createorder" value="Create Order"></td>
                      <td>
                    </tr>
                    </tbody>
                  </table>
                  <div></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </form>
</body>
<script>
	$(function() {
		$("#insert")
				.click(
						function() {

							document.getElementById("first").value = "Tony"
							document.getElementById("number").value = "0422319859"
							document.getElementById("street").value = "Nipper 4 Street"
							document.getElementById("city").value = "Homebush"
							document.getElementById("email").value = "haozfuz@gmail.com"
						})
	})
</script>
<script>
	function checkName() {

		const spanName = $("#first1");
		const theName = $("#first");
		const theNameVal = theName.val();
		if (theNameVal == "") {
			spanName.text("Name is required")
		} else {
			spanName.text("")
		}

	}

	function checknum() {

		const spanName = $("#number1");
		const theName = $("#number");
		const theNameVal = theName.val();

		if (theNameVal == "") {
			spanName.text("Phone number is required")
		} else {
			spanName.text("")
		}
	}
  window.onload= function(){
    combineAddress();
	    };
	function combineAddress() {
		const street = $("#street").val().trim();
		const city = $("#city").val().trim();
		const state = $("#state").val();
		if (!street || !city || !state) {
			$("#address1").text("Please fill in complete address");
			$("#address").val(""); // 
			return false;
		}

		const fullAddress = street + " " + city + " " + state;
		console.log("fullAddress"+fullAddress);
		$("#address").val(fullAddress); 
		$("#address1").text(""); 
		return true;
	}
	function checkemail() {

		const email = $("#email");
		const emailVal = email.val();
		const emailMsg = $("#email1");

		//email regex
		const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

		if (!emailRegex.test(emailVal)) {
			emailMsg.text("Invalid email format");
		} else {
			emailMsg.text("");
		}

	}
</script>
<script>
	$(function() {
		$("#checkout").click(function() {
			var formobj = document.getElementById("saveform");
			var id = document.getElementById("first");
			var num = document.getElementById("number");
			var adr = document.getElementById("address");
			if (id.value == "" || num.value == "" || num.value == "") {
				alert("Please fill in all required informations");
			} else {
				var formobj = document.getElementById("saveform");

				formobj.submit();
			}

		});
	})

	$(function() {
		$("#createorder").click(function() {
			var formobj = document.getElementById("saveform");
			formobj.action = "<c:url value='/product/createorder'/>";
			//formobj.method="post";
			var id = document.getElementById("first");
			var num = document.getElementById("number");
			var adr = document.getElementById("address");
			if (id.value == "" || num.value == "" || num.value == "") {
				alert("Please fill in all required informations");
			} else {
				var formobj = document.getElementById("saveform");
				formobj.action = "<c:url value='/product/createorder'/>";
				formobj.submit();
			}
		});
	})
</script>
</html>
<!-- jquery plugins here-->
