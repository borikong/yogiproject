<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<style>
    body {
        min-width: 1050px;
        margin-top: 150px;
        margin-bottom: 30px;
        background-color: #fff;       
        font-weight: 800;
        font-size: 20px;
        line-height: 20px;
        text-align: center; 
    }
   
    div{   
    	padding-bottom: 10px;	
    }
    
    .loginDivForm{    	   	
        width: 340px;
        margin: 0 auto;
        letter-spacing: -0.6px;
    }
    
    form {			  	 
    	font-size: 14px;
    	height: 250px;           
    }
    
    input {   
    	height: 54px;       	
        position: relative;
        height: 48px;  
    	width: 100%;
        height: 46px;
        padding: 0 11px 1px 15px;
        border-radius: 4px;
        border: 1px solid #ddd;
        font-weight: 400;
        font-size: 16px;
        line-height: 1.5;
        color: #333;
        outline: none;
        box-sizing: border-box;
    }
    
    .idpw{
    	display: flex;
    	font-size: 13px;
    	justify-content: flex-end;
    
    }
    
    .spanBorder{
    	width: 1px;
        height: 10px;
        margin: 0 6px 2px 4px;
    }
    
    button{
    	font-weight: 800;
    	font-size: 16px;
    	margin-bottom: 10px;
    }
    
    .bt1{
    	display: block;
        padding: 0 10px;
        text-align: center;
        overflow: hidden;
        width: 100%;
        height: 54px;
        border-radius: 3px;
        color: #fff;
        background-color: #2EA26B;
        border: 0 none;
	}
	
	.bt2{
    	display: block;
        padding: 0 10px;
        text-align: center;
        overflow: hidden;
        width: 100%;
        height: 54px;
        border-radius: 3px;
        color: #2EA26B;
        background-color: #fff;
        border: 1px solid #2EA26B;
	}
    </style>

</head>
<body>

<div class="loginDiv">로그인</div>
<div class="loginDivForm">
	<form action="">
		<div>
			<input type="text" name="id" value="" placeholder="아이디를 입력해주세요">
		</div>
		
		<div>
			<input type="text" name="id" value="" placeholder="비밀번호를 입력해주세요">
		</div>
		
		<div class="idpw">
			<a>아이디 찾기</a>
			<span class="spanBorder">|</span>
			<a>비밀번호 찾기</a>
		</div>
		
		<div>
			<button class="bt1">
				<span>로그인</span>
			</button>
			
			<button class="bt2">
				<span>회원가입</span>
			</button>
		</div>
	</form>
	
</div>

</body>
</html>