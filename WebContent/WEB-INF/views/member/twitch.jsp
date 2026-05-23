<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    

</head>
<style>

body {

background: url(https://lolstatic-a.akamaihd.net/lolkit/1.1.6/resources/images/bg-default.jpg) no-repeat center; 
background-attachment: fixed; 

margin: 20; 
}  

.container{
    background: rgba(0, 0, 0, 0.1);
    min-height: 100vh;
    padding-top: 100px;
}

.intro{
    color: white;
    position: absolute;
    top: 12px;
    left: 70px;
}
.preview img{
    width: 100%;
}
.bottom{
    background: rgba(0, 0,0, 0.8);
    padding: 10px;
    position: relative;
}
.row{
    width: 1300px;
    margin: 0 auto;
}
.col{
    width: 380px;
    display: inline-block;
    margin-right: 20px;
    margin-bottom: 30px;
}

.col :hover{
    cursor: pointer;
    box-shadow: 5px 5px 20px 5px rgba(0, 0, 0, 0.5);
    filter: brightness(1.5);
    transition: all 0.5s;
}

.avatar img{
    width: 50px; height: 50px;
    overflow: hidden;
    border-radius: 50%;
}
.channel_name{
    margin-bottom: 10px;
}</style>
<body>
<!-- 	--header-- -->
		<jsp:include page="/WEB-INF/views/top.jsp" />
	
<!-- 	--header-- -->
	  
	  
	  
	  
<section class="padding_top">
    <div class="container">
        <div class="row">
            <div class="col">
                <div class="preview">
                    <iframe width="380" height="220" src="https://www.youtube.com/embed/bqCnkoSFFBg" frameborder="0"
                        allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                        allowfullscreen></iframe>
                </div>
                <div class="bottom">
                    <div class="avatar">
                        <img
                            src="https://yt3.ggpht.com/a/AATXAJw9z9pkpfRjk3guU00xZf_RdchSPjFYyZHnuA=s144-c-k-c0xffffffff-no-rj-mo">
                    </div>
                    <div class="intro">
                        <div class="channel_name">頻道名稱:SGD LOL - TOP</div>
                        <div class="user_name">英雄聯盟</div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="preview">
                    <iframe width="380" height="220" src="https://www.youtube.com/embed/Q9sT5ryIBgs" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
                <div class="bottom">
                    <div class="avatar">
                        <img
                            src="https://yt3.ggpht.com/a/AATXAJwXmlk2M29W3iM_Ru6o3UYRgtVq5o1xZC2Dog=s88-c-k-c0xffffffff-no-rj-mo">
                    </div>
                    <div class="intro">
                        <div class="channel_name">頻道名稱:朔月</div>
                        <div class="user_name">跑跑卡丁車 RUSH+</div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="preview">
                    <iframe width="380" height="220" src="https://www.youtube.com/embed/XjjaHjFj1zY" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
                <div class="bottom">
                    <div class="avatar">
                        <img
                            src="https://yt3.ggpht.com/a/AATXAJyNoKWKcEYoLqWh6KWb5FRf5X5yLrnxuS0K=s144-c-k-c0xffffffff-no-rj-mo">
                    </div>
                    <div class="intro">
                        <div class="channel_name">頻道名稱:予樂 Ler4ü</div>
                        <div class="user_name">動物森友會</div>
                    </div>
                    
                </div>
            </div>
            <div class="col">
                <div class="preview">
                    <iframe width="380" height="220" src="https://www.youtube.com/embed/GJU0GV3bnUY" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
                <div class="bottom">
                    <div class="avatar">
                        <img
                            src="https://yt3.ggpht.com/a/AATXAJz9EolH1IDr-anG6zGuzcZijLnUirf84eKu=s88-c-k-c0xffffffff-no-rj-mo">
                    </div>
                    <div class="intro">
                        <div class="channel_name">頻道名稱:
                            Tony Life</div>
                        <div class="user_name">灌籃高手</div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="preview">
                    <iframe width="380" height="220"  src="https://www.youtube.com/embed/aqfjoPYGokE" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
                <div class="bottom">
                    <div class="avatar">
                        <img
                            src="https://yt3.ggpht.com/a/AATXAJw9z9pkpfRjk3guU00xZf_RdchSPjFYyZHnuA=s144-c-k-c0xffffffff-no-rj-mo">
                    </div>
                    <div class="intro">
                        <div class="channel_name">頻道名稱:SGD LOL - TOP</div>
                        <div class="user_name">絕地求生</div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="preview">
                    <iframe width="380" height="220" src="https://www.youtube.com/embed/iV8bl5ZlnwM" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
                <div class="bottom">
                    <div class="avatar">
                        <img
                            src="https://yt3.ggpht.com/a/AATXAJzgjViCVETsNpqe5DlQUWDpEKk5kqeHZMHuRfQKBw=s88-c-k-c0xffffffff-no-rj-mo">
                    </div>
                    <div class="intro">
                        <div class="channel_name">頻道名稱:NyoNyo日常實況
                        </div>
                        <div class="user_name">Minecraft</div>
                    </div>
                </div>
            </div> 
            <div class="col">
                <div class="preview">
                    <iframe width="380" height="220"  src="https://www.youtube.com/embed/ZJU56EX27Q0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
                <div class="bottom">
                    <div class="avatar">
                        <img
                            src="https://yt3.ggpht.com/a/AATXAJzfNKuKJIY7R3b7GEsDGRAnxfEDVQ17nAwzBw=s88-c-k-c0xffffffff-no-rj-mo">
                    </div>
                    <div class="intro">
                        <div class="channel_name">頻道名稱:魔獸世界</div>
                        <div class="user_name">魔獸世界</div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="preview">
                    <iframe width="380" height="220" src="https://www.youtube.com/embed/t_dQgZgoHX4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
                <div class="bottom">
                    <div class="avatar">
                        <img
                            src="https://yt3.ggpht.com/a/AATXAJxqjCpmnGyw-XFDOGEib7R87HZlWj0O-2_8FQ=s88-c-k-c0xffffffff-no-rj-mo">
                    </div>
                    <div class="intro">
                        <div class="channel_name">頻道名稱:最強聯盟OW頻道</div>
                        <div class="user_name">鬥陣特攻</div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="preview">
                    <iframe width="380" height="220" src="https://www.youtube.com/embed/o629TdBxRO4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
                <div class="bottom">
                    <div class="avatar">
                        <img
                            src="https://yt3.ggpht.com/a/AATXAJz2IUiVpi1P9FEZPH3KYKEkei2P5oQEk9-h6w=s144-c-k-c0xffffffff-no-rj-mo">
                    </div>
                    <div class="intro">
                        <div class="channel_name">頻道名稱:雨小棠Asuat</div>
                        <div class="user_name">RO 仙境傳說</div>
                    </div>
                </div>
            </div>
               
            


        </div>
    </div>
    </section>
    
</body>



</html>