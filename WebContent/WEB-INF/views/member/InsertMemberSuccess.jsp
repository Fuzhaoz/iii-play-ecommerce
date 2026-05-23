<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body style="background: #f2f2f2">
<jsp:include page="/WEB-INF/views/top.jsp" />
<section class="padding_top">
<div class="container" style="background:white;margin-top:30px">
<h1 style="text-align:center">您已成功加入會員 </h1>
<hr>
<h3>您的帳號為:${mb.id}</h3>
<h3>您的姓名為:${mb.name}</h3>
<h3>您的電子郵件為:${mb.email}</h3>

<div style="margin: auto; text-align:center;">
<input type="button" class="btn btn-primary" value="登入" onclick="location.href='login.do'">
</div>

</div>
</section>
</body>
</html>