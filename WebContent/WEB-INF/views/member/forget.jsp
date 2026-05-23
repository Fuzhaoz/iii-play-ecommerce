<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Reset Password</title>
    <link rel="stylesheet" href="/css/style.css" >
    <script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="/js/jquery.validate.min.js"></script>
</head>
<body>
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
    <div align="center">
        <h2>重設您的密碼</h2>
        <p>
       請輸入您註冊時填寫的帳號與信箱
        </p>
         
        <form id="resetForm" action="sendEmail" method="post">
            <table>
                  <tr>
                    
                    <td>帳號:</td>
                    <td><input type="text" name="id" id="id" size="20"></td>
                </tr>
                <tr>
                    
                    <td>Email:</td>
                    <td><input type="text" name="email" id="email" size="20"></td>
                </tr>
                <tr>
                <br>
                    <td colspan="2" align="center">
                    <br>
                        <button type="submit">寄送郵件</button>
                    </td>
                </tr>    
            </table>
        </form>
    </div>

  
     
<script type="text/javascript">
 
    $(document).ready(function() {
        $("#resetForm").validate({
            rules: {
                email: {
                    required: true,
                    email: true
                }      
            },
             
            messages: {
                email: {
                    required: "Please enter email",
                    email: "Please enter a valid email address"
                }
            }
        });
 
    });
</script>
</body>
</html>