<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>會員中心</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"
	integrity="sha256-r/AaFHrszJtwpe+tHyNi/XCfMxYpbsRg2Uqn0x3s2zc="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">



</head>
<body style="background: #f2f2f2">
	<jsp:include page="/WEB-INF/views/top.jsp" />
	    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item">
                            <h2></h2>
                            <p> <span></span> </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
		<div class="container">
			<br>
			<H1 style="text-align: center">Google會員基本資料</H1>
			<form>
				
				
				
					<div class="form-group row">
						<label for="picture" class="col-sm-2 col-form-label">大頭貼</label>
						<div class="col-sm-10">
							<img width='300' src="${googlePicture}">
						</div>
					</div>
					
				


				

				

				<div class="form-group row">
					<label for="name" class="col-sm-2 col-form-label">姓名</label>
					<div class="col-sm-10">
						<input type="text" name="name" class="form-control" id="name"
							value="${googleUser.name}${param.name}" disabled> 
					</div>
				</div>

				<div class="form-group row">
					<label for="email" class="col-sm-2 col-form-label">E-mail</label>
					<div class="col-sm-10">
						<input type="text" name="email" class="form-control" id="email"
							value="${googleUser.email}" disabled>
						<font color='red' size='-1'>${error.email}</font>
					</div>
				</div>
			
	
				
				
					<div style="margin: auto;">
                
                <input type="button" value="返回首頁" class="btn btn-primary" onclick="location.href='<c:url value='/'/>'  "  >

                
                
                </div>


			</form>
		</div>


</body>
</html>