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

<script>
	window.onload = checkbox;
	function checkbox() {
		if ("${MemberBean.gender}" == "male") {
			document.getElementById("genderMale").checked = true;
			var str = "${MemberBean.games}"
			if (str.indexOf("LOL") != -1) {
				document.getElementById("gameLOL").checked = true;
			}
			if (str.indexOf("PUBG") != -1) {
				document.getElementById("gamePUBG").checked = true;
			}
			if (str.indexOf("FG") != -1) {
				document.getElementById("gameFG").checked = true;
			}
			if (str.indexOf("animal") != -1) {
				document.getElementById("gameAnimal").checked = true;
			}
			if (str.indexOf("WOW") != -1) {
				document.getElementById("gameWOW").checked = true;
			}
			if (str.indexOf("LOLm") != -1) {
				document.getElementById("gameLOLm").checked = true;
			}
		}
		if ("${MemberBean.gender}" == "female") {
			document.getElementById("genderFemale").checked = true;
			var str = "${MemberBean.games}"
				if (str.indexOf("LOL") != -1) {
					document.getElementById("gameLOL").checked = true;
				}
				if (str.indexOf("PUBG") != -1) {
					document.getElementById("gamePUBG").checked = true;
				}
				if (str.indexOf("FG") != -1) {
					document.getElementById("gameFG").checked = true;
				}
				if (str.indexOf("animal") != -1) {
					document.getElementById("gameAnimal").checked = true;
				}
				if (str.indexOf("WOW") != -1) {
					document.getElementById("gameWOW").checked = true;
				}
				if (str.indexOf("LOLm") != -1) {
					document.getElementById("gameLOLm").checked = true;
				}
		}
	}
</script>
<script type="text/javascript">
	function confirmDelete() {
		var result = confirm("確定刪除此筆記錄?");
		if (result) {
			document.forms[0].finalDecision.value = "DELETE";
			return true;
		}
		return false;
	}
	function confirmUpdate() {
		var result = confirm("確定送出修改此筆記錄?");
		if (result) {
			document.forms[0].finalDecision.value = "UPDATE";
			return true;
		}
		return false;
	}
</script>
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
			<H1 style="text-align: center">會員基本資料修改</H1>
			<form action='updateMember.do' method='POST'
				enctype="multipart/form-data">
				<input type="hidden" name="id" value="${MemberBean.id}"> <input
					type="hidden" name="finalDecision" value="">

				<c:if test="${empty googleUser}">


					<div class="form-group row">
						<label for="id" class="col-sm-2 col-form-label">帳號</label>
						<div class="col-sm-10" style="font-size: 16px">
							${MemberBean.id}</div>
					</div>
				</c:if>


				<c:if test="${empty googleUser}">
					<div class="form-group row">
						<label for="picture" class="col-sm-2 col-form-label">大頭貼</label>
						<div class="col-sm-10">
							<img width='300' src="data:image/jpg;base64,${mbPic}">
						</div>
					</div>
				</c:if>
				<c:if test="${!empty googleUser}">
					<div class="form-group row">
						<label for="picture" class="col-sm-2 col-form-label">大頭貼</label>
						<div class="col-sm-10">
							<img width='300' src="${googlePicture}">
						</div>
					</div>
					
				</c:if>



				<div class="form-group row">
					<label for="picture" class="col-sm-2 col-form-label">更換大頭貼</label>
					<div class="col-sm-10">
						<input type="file" name="changePic" class="form-control"
							id="picture">

					</div>
				</div>

				<c:if test="${empty googleUser}">
					<div class="form-group row">
						<label for="password" class="col-sm-2 col-form-label">密碼</label>
						<div class="col-sm-10">
							<input type="password" name="password" class="form-control"
								id="password" value="${MemberBean.password}"> <font
								color='red' size='-1'>${error.password}</font>
						</div>
					</div>
					<div class="form-group row">
              <label for="password" class="col-sm-2 col-form-label">密碼確認</label>
              
              <div class="col-sm-10">
                <input type="password" name="checkPassword" class="form-control" id="checkPassword" placeholder="Password" value="${MemberBean.password}" >
                <font color='red' size='-1'>${error.password}</font>
              </div>
            </div>
					
				</c:if>

				<div class="form-group row">
					<label for="name" class="col-sm-2 col-form-label">姓名</label>
					<div class="col-sm-10">
						<input type="text" name="name" class="form-control" id="name"
							value="${MemberBean.name}"> <font
							color='red' size='-1'>${error.name}</font>
					</div>
				</div>

				<div class="form-group row">
					<label for="email" class="col-sm-2 col-form-label">E-mail</label>
					<div class="col-sm-10">
						<input type="text" name="email" class="form-control" id="email"
							value="${MemberBean.email}">
						<font color='red' size='-1'>${error.email}</font>
					</div>
				</div>
				<div class="form-group row">
					<label for="age" class="col-sm-2 col-form-label">年齡</label>

					<div class="col-sm-10">
						<input type="text" name="age" class="form-control" id="age"
							value="${MemberBean.age}"> <font color='red'
							size='-1'>${error.age}</font>
					</div>
				</div>
				<div class="form-group row">
					<label for="gender" class="col-sm-2 col-form-label">性別</label>
					<div class="col-sm-10">
						<label> <input type="radio" name="gender" value="male"
							id="genderMale">男
						</label> <label> <input type="radio" name="gender" value="female"
							id="genderFemale">女
						</label>
					</div>
				</div>
				<div class="form-group row">
					<label for="gender" class="col-sm-2 col-form-label">喜歡的遊戲</label>
					<div class="col-sm-10">

						<label> <input type="checkbox" name="games" value="LOL"
							id="gameLOL">英雄聯盟
						</label> 
						<label> <input type="checkbox" name="games" value="PUBG"
							id="gamePUBG">絕地求生
						</label> 
						<label> <input type="checkbox" name="games" value="FG"
							id="gameFG">鬥陣特攻
						</label>
						<label> <input type="checkbox" name="games" value="Animal"
							id="gameAnimal">動物森友會
						</label>
						<label> <input type="checkbox" name="games" value="LOLm"
							id="gameLOLm">傳說對決
						</label>
						<label> <input type="checkbox" name="games" value="WOW"
							id="gameWOW">魔獸世界
						</label>
					</div>
					<br> <br> <br>
					<div style="margin: auto;">
						<button type="submit" class="btn btn-primary"
							onclick="confirmUpdate()">確定修改</button>

						<button type="submit" class="btn btn-danger"
							onclick="confirmDelete()">刪除帳號</button>
					</div>

				</div>

			</form>
		</div>


</body>
</html>