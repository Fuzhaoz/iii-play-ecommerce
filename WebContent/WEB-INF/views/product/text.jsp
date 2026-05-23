<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="<c:url value='/js/jquery-1.12.1.min.js'/>"></script>
  <div id="content"  style="text-align: center"> 


     <label for="inputEmail4 ">使用者姓名：</label>
           <input type="text" id="uid" name="uid"  style="width: 200px;" onblur="checkName()">
   
        <span  style="position:fixed"><font color='red' id="first1" size='-1'></font> </span>
      <br/>
      
      <label for="inputEmail4">使用者電話： </label>
          <input type="text" id="pid" name="uphone"  class="fieldWidth" style="width: 200px;" onblur="checknum()">
            <span  style="position:fixed"> <font color='red' id="number1" size='-1'></font>  </span>
      <br/>
     <div style="position:relative ;right:103px">
     <label for="inputEmail4" >性別：</label>
      <select name="usex" id="usex" >
　                <option value="M">男性</option>
       <option value="F">女性</option>
      </select>
      <br/>
      </div>
      <button type="submit" class="su" style="text-align: center">查詢</button>
   


</div>


<table style="margin-left:auto; margin-right:auto; position:relative; top:20px; width:810; background:#80def4; border:2px solid #10b0d5; border-style: outset; ">

		<tr id='borderA' height='50' >
			<th id='borderA'  colspan="6" align="center">查詢結果</th>
		</tr>
		<tr id='borderA' height='36' >
			<th id='borderA'>編號</th>
			<th id='borderA'>姓名</th>
			<th id='borderA'>性別</th>
			<th id='borderA'>電話</th>
			<th id='borderA'>地址</th>
			
		</tr>
				
			<TR id='borderA' height='30'>
			<TD id='ud' width="86" align="center">
			  
			</TD>
			<TD id='un' width="86" align="center">
			  
			</TD>
			<TD id='us' width="86" align="center">
			     
			</TD>
			<TD id='up' width="86" align="center">
			     
			</TD>
			<TD id='ua' width="100" align="center">
			     
			</TD>
			
			
							
		</TR>

	
	</TABLE>


</body>

	<script>
		//進入詳情
		
			$(function(){
				$(".su").click(function() {
					var id = document.getElementById("uid");
					 var num = document.getElementById("pid");
				
					 if (id.value == "" || num.value == "") {
					     alert("請輸入完整資訊");}
					 else{
					$.ajax({
					url : "<c:url value='/text/showas'/>", //請求的url地址
					dataType : "json", //返回格式為json
                    traditional:true,
					async : true, //請求是否非同步，預設為非同步，這也是ajax重要特性
					data : {

						"uid":document.getElementById("uid").value , 
						"uphone":document.getElementById("pid").value ,  
						"usex":document.getElementById("usex").value , 
						
					}, //引數值
					type : "GET", //請求方式
					success : function(req) {
                      
                        if(req.uId ==0){
                        	alert("查無此資料")
                            }else{document.getElementById("ud").innerHTML=req.uId
        						document.getElementById("un").innerHTML=req.uname
        						document.getElementById("us").innerHTML=req.usex
        						document.getElementById("up").innerHTML=req.uphone
        						document.getElementById("ua").innerHTML=req.uaddress
                                    }
						
						
					},
					complete : function() {
						//請求完成的處理
						
					},
					error : function() {
						
					}
				});
					 }

							});
			});


			 function checkName() {
		           
		            let spanName = document.getElementById("first1");
		            let theName = document.querySelector("#uid");
		            let theNameVal = theName.value;
		            let theNameLen = theNameVal.length;
		          
		            if (theNameVal == "") {
		                spanName.innerHTML = "名稱不能為空"
		            } else{
		            	 spanName.innerHTML = ""
			            }
		            

		            }

		 function checknum() {
		     
		     let spanName = document.getElementById("number1");
		     let theName = document.querySelector("#pid");
		     let theNameVal = theName.value;
		     let theNameLen = theNameVal.length;
		   
		     if (theNameVal == "") {
		         spanName.innerHTML = "電話不能為空"
		     } else{
            	 spanName.innerHTML = ""
	            }

		     }
		
	</script>



</html>