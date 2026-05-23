<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<script>
window.onload = function() {
	var alink = document.getElementById("accountCheck");
	var div = document.getElementById('result0c');
	alink.onclick = function() {
		var id = document.getElementById("id").value;
		if (!id) {
			div.innerHTML = "<font color='red' size='-1'>請輸入帳號...</font>";
			return;
		}
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "CheckMemberIdServlet", true);
		xhr.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		xhr.send("id=" + id);
		var message = "";
		xhr.onreadystatechange = function() {
			// 伺服器請求完成
			if (xhr.readyState == 4 && xhr.status == 200) {
				var result = JSON.parse(xhr.responseText);

				if (result== false) {
					message = "帳號可用";
				}  else {
					message = "帳號重複，請重新輸入帳號";
				}
				div.innerHTML = "<font color='red' size='-1'>" + message
						+ "</font>";
			}
		}
	}
}

</script>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>加入會員</title>
    <script
  src="https://code.jquery.com/jquery-3.5.0.js"
  integrity="sha256-r/AaFHrszJtwpe+tHyNi/XCfMxYpbsRg2Uqn0x3s2zc="
  crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body style="background: #f2f2f2" >
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
    <div class="container" >
    <br>
         <H1 style="text-align: center ">加入會員</H1>
        <form action="insertMember.do"  method='POST' enctype="multipart/form-data" >
            <div class="form-group row">
                <label for="id" class="col-sm-2 col-form-label">*帳號</label>
                <div class="col-sm-10">
                  <input type="text" name="id" class="form-control" id="id" placeholder="abc123456" value="${param.id}">
                  <font color='red' size='-1'>${error.id}</font>
                </div>
              </div>
              
              <div style='font-size: 10pt; '>
							<a href='#' id='accountCheck' style='font-size: 10pt;'>檢查帳號</a>
						<span id='result0c' style="height: 10px;"></span>
						</div>
					
            <div class="form-group row">
              <label for="password" class="col-sm-2 col-form-label">*密碼</label>
              
              <div class="col-sm-10">
                <input type="password" name="password" class="form-control" id="password" placeholder="Password" value="${param.password}" >
                <font color='red' size='-1'>${error.password}</font>
              </div>
            </div>
             <div class="form-group row">
              <label for="password" class="col-sm-2 col-form-label">*密碼確認</label>
              
              <div class="col-sm-10">
                <input type="password" name="checkPassword" class="form-control" id="checkPassword" placeholder="Password" value="" >
                <font color='red' size='-1'>${error.password}</font>
              </div>
            </div>
            
                      
              <div class="form-group row">
                <label for="name" class="col-sm-2 col-form-label">*姓名</label>
                <div class="col-sm-10">
                  <input type="text" name="name" class="form-control" id="name" placeholder="王曉明" value="${param.name}">
                  <font color='red' size='-1'>${error.name}</font>
                </div>
              </div>
              <div class="form-group row">
                <label for="picture" class="col-sm-2 col-form-label">大頭貼</label>
                <div class="col-sm-10">
                  <input type="file" name="picture" class="form-control" id="picture">
                  
                </div>
              </div>
              <div class="form-group row">
                <label for="email" class="col-sm-2 col-form-label">*E-mail</label>
                <div class="col-sm-10">
                  <input type="text" name="email" class="form-control" id="email" placeholder="email@example.com" value="${param.email}">
                  <font color='red' size='-1'>${error.email}</font>
                </div>
              </div>
              <div class="form-group row">
                <label for="age" class="col-sm-2 col-form-label">*年齡</label>
                
                <div class="col-sm-10">
                  <input type="text" name="age" class="form-control" id="age" placeholder="20" value="${param.age}">
                  <font color='red' size='-1'>${error.age}</font>
                </div>
              </div>
              <div class="form-group row">
                <label for="gender" class="col-sm-2 col-form-label">性別</label>
                <div class="col-sm-10">
                    <label>
                        <input type="radio" name="gender" value="male" checked>男
                    </label>
                    <label>
                        <input type="radio" name="gender" value="female">女
                    </label>
                </div>
              </div>
              <div class="form-group row">
                <label for="gender" class="col-sm-2 col-form-label">喜歡的遊戲</label>
                <div class="col-sm-10">
                    
                    <label>
                        <input type="checkbox" name="games" value="LOL" checked>英雄聯盟
                    </label>
                    <label>
                        <input type="checkbox" name="games" value="PUBG">絕地求生
                    </label>
                    <label>
                        <input type="checkbox" name="games" value="WOW">魔獸世界
                    </label>
                    <label>
                        <input type="checkbox" name="games" value="animal">動物森友會
                    </label>
                    <label>
                        <input type="checkbox" name="games" value="FG">鬥陣特攻
                    </label>
                    <label>
                        <input type="checkbox" name="games" value="LOLm">傳說對決
                    </label>
                
                    <input type="hidden" name="status"  value="1" >
                </div>
                <br>
                <br>
                <br>
                <div style="margin: auto;">
                <button type="submit" class="btn btn-primary">送出</button>

                <button type="reset" class="btn btn-danger">清除</button>
                <button type="button" id="insert" class="btn btn-primary">一鍵新增</button>
					<script type="text/javascript">
						document.getElementById("insert").onclick = test;

						function test() {
							document.getElementById("id").value = "sean406"
							document.getElementById("name").value = "陳大明"
							document.getElementById("password").value = "eeit113"
							document.getElementById("checkPassword").value = "eeit113"
								document.getElementById("email").value="sean406@outlook.com"
									document.getElementById("age").value="26"
						}
					</script>
                </div>

            </div>
            
          </form>
    </div>

    
</body>
</html>