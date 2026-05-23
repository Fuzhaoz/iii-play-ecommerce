<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>上架商品資料</title>
    <script
  src="https://code.jquery.com/jquery-3.5.0.js"
  integrity="sha256-r/AaFHrszJtwpe+tHyNi/XCfMxYpbsRg2Uqn0x3s2zc="
  crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body style="background: #f2f2f2" >
<jsp:include page="/WEB-INF/views/top.jsp" />
	<section class="padding_top">
    <div class="container" >
    <br>
         <H1 style="text-align: center ">上架商品資料</H1>
        <form action="insertProduct.do"  method='POST' enctype="multipart/form-data" >
            <div class="form-group row">
                <label for="id" class="col-sm-2 col-form-label">上架商品no</label>
                <div class="col-sm-10">
                  <input type="text" name="pdno" class="form-control" id="pdno" placeholder="Log001" value="${param.pdno}">
                  <font color='red' size='-1'>${error.pdno}</font>
                </div>
              </div>
              
              
            <div class="form-group row">
                <label for="id" class="col-sm-2 col-form-label">商品名稱</label>
                <div class="col-sm-10">
                  <input type="text" name="pdname" class="form-control" id="pdname" placeholder="滑鼠" value="${param.pdname}">
                  <font color='red' size='-1'>${error.pdname}</font>
                </div>
              </div>

                         
                      
                <div class="form-group row">
                <label for="picture" class="col-sm-2 col-form-label">產品圖片</label>
                <div class="col-sm-10">
                  <input type="file" name="picture" class="form-control" id="picture">
                  
                </div>
              </div>
              <div class="form-group row">
                <label for="email" class="col-sm-2 col-form-label">商品價格</label>
                <div class="col-sm-10">
                  <input type="text" name="price" class="form-control" id="price" placeholder="1500" value="${param.price}">
                  <font color='red' size='-1'>${error.price}</font>
                </div>
              </div>
              <div class="form-group row">
                <label for="email" class="col-sm-2 col-form-label">商品庫存</label>
                <div class="col-sm-10">
                  <input type="text" name="stock" class="form-control" id="stock" placeholder="30" value="${param.stock}">
                  <font color='red' size='-1'>${error.price}</font>
                </div>
              </div>
              
              <div class="form-group row">
                <label for="gender" class="col-sm-2 col-form-label">商品種類</label>
                <div class="col-sm-10">
                    <label>
                        <input type="radio" name="category" value="滑鼠" checked>滑鼠
                    </label>
                    <label>
                        <input type="radio" name="category" value="鍵盤">鍵盤
                    </label>
                    <label>
                        <input type="radio" name="category" value="耳機">耳機
                    </label>
                     <label>
                        <input type="radio" name="category" value="滑鼠墊">滑鼠墊
                    </label>
                </div>
                </div>
                <div class="form-group row">
                <label for="gender" class="col-sm-2 col-form-label">商品種類</label>
                <div class="col-sm-10">
                    <label>
                        <input type="radio" name="companyId" value="羅技" checked>羅技
                    </label>
                    <label>
                        <input type="radio" name="companyId" value="曜越">曜越
                    </label>
                    <label>
                        <input type="radio" name="companyId" value="雷蛇">雷蛇
                    </label>
                </div>
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
							document.getElementById("pdname").value = "羅技滑鼠666"
							document.getElementById("pdno").value = "Log666"
							document.getElementById("price").value = "999"
							document.getElementById("stock").value = "30"
								document.getElementById("email").value="sean406@outlook.com"
									document.getElementById("age").value="26"
						}
					</script>
                </div>
          </form>

            </div>
            
  
	</section>
    
</body>
</html>