<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有會員</title>
<style>
.divleft {
	float: left
}

.table1 {  
	margin-left: 50px;
	display: inline;
}

.title {
	color: #blue;
	right: 50px;
	margin-left: 400px
}
</style>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>
</head>
<body>


	
	<!-- Right Panel -->
	<div id="right-panel" class="right-panel">
		<!-- Header-->
		<header id="header" class="header">
			<div class="top-left">
				<div class="navbar-header">
					<a class="navbar-brand h1">後台管理系統</a> 
					<a id="menuToggle" class="menutoggle"  style="text-align:left">
					<i class="fa fa-bars"></i></a>
				</div>
			</div>
			
			
		</header>


	<div class="content">
			<div class="animated fadeIn">
				<div class="row">

					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">會員列表</strong>
							</div>
			
							<div class="card-body">
								<table id="bootstrap-data-table"
									class="table table-striped table-bordered">
									<thead>
		<tr>

			<th  width='80'>編號</th>
			<th style="text-align: center" >帳號</th>
			<th style="text-align: center" width='80'>姓名</th>
			<th style="text-align: center" width='70' >年齡</th>
			<th style="text-align: center" >性別</th>
			<th style="text-align: center" >email</th>
			<th style="text-align: center" width='80' >註冊時間</th>

			<th style="text-align: center">狀態</th>
			<th style="text-align: center" >操作欄</th>
			<th style="text-align: center" width='90'>大頭貼</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${memberList}" var="member" varStatus='vs'>

			<tr>
				<td style="text-align: center">${member.pk}</td>
				<td style="text-align: center">${member.id}</td>
				<td style="text-align: center">${member.name}</td>
				<td style="text-align: center">${member.age}</td>
				<td style="text-align: center">${member.gender}</td>
				<td style="text-align: center">${member.email}</td>
				<td style="text-align: center">${fn:substring(member.registerTime,0,19)}</td>
				<c:if test="${member.status==1}">
					<td><a class="btn btn-primary">正常</a></td>
				</c:if>
				<c:if test="${member.status==2}">
					<td><a class="btn btn-warning">管理員</a></td>
				</c:if>
				<c:if test="${member.status==100}">
					<td><a class="btn btn-danger">停權</a></td>
				</c:if>
				<td><a class="btn btn-primary"
					href="<c:url value='/status/${member.id}'/>">變更狀態</a></td>

				<td><img height='85px' width='85px'
					src='${pageContext.request.contextPath}/member/getImage/${member.id}'
					alt='沒有圖片'></td>

			</tr>
		</c:forEach>
			</tbody>
			
	</table>
	<hr>
	
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	
	

</body>
</html>