function checkclose(){
	opener.location.href="mem.me?cmd=regForm&checkid="+"";
	window.close();
}

function idCheck(id) {
	if(id==""){
		alert("아이디를 입력해주세요");
		document.regForm.id.focus();
	}else {
		url="member.me?cmd=idCheck&id="+id;
		console.log(url)
		window.open(url, "post", "width=300, height=150");
	}
}

function zipCheck(){
	url="member.me?cmd=zipCheck&check=y";
	window.open(url,"post","toolbar=no, width=500, height=300, directories=no, status=yes, scrollbars=yes, menubar=no");
}

function dongCheck(){
	if(document.zipForm.dong.value == ""){
		alert("동 이름을 입력하세요.");
		document.zipForm.dong.focus();
		return;
	}
	document.zipForm.submit();	
}

function sendAddress(zipcode,sido,gugun,dong,ri,bunji){
	var address=sido+" "+gugun+" "+dong+" "+ri+" "+bunji;
	opener.document.regForm.zipcode.value=zipcode;
	opener.document.regForm.address1.value=address;
	self.close();
}

function inputCheck(){
	
	if(document.regForm.id.value == ""){
		alert("아이디를 입력해주세요.");
		document.regForm.id.focus();
		return;
	}
	
	if(document.regForm.pass.value == ""){
		alert("비밀번호를 입력해주세요.");
		document.regForm.pass.focus();
		return;
	}
	
	if(document.regForm.repass.value == ""){
		alert("비밀번호를 확인해주세요");
		document.regForm.repass.focus();
		return;
	}
	
	if(document.regForm.pass.value != document.regForm.repass.value){
		alert("비밀번호가 일치하지 않습니다.");
		document.regForm.repass.focus();
		return;
	}
	
	if(document.regForm.name.value == ""){
		alert("이름을 입력해주세요.");
		document.regForm.name.focus();
		return;
	}
	
	if(document.regForm.email.value == ""){
		alert("이메일을 입력해주세요.");
		document.regForm.email.focus();
		return;
	}
	
	if(document.regForm.zipcode.value == ""){
		alert("우편번호를 입력해주세요.");
		document.regForm.zipcode.focus();
		return;
	}
	
	if(document.regForm.address1.value == ""){
		alert("주소를 입력해주세요.");
		return;
	}
	
	document.regForm.submit();
}

function updateCheck(){
	
	if(document.regForm.pass.value == ""){
		alert("비밀번호를 입력해주세요.");
		document.regForm.pass.focus();
		return;
	}
	
	if(document.regForm.repass.value == ""){
		alert("비밀번호를 확인해주세요");
		document.regForm.repass.focus();
		return;
	}
	
	if(document.regForm.pass.value != document.regForm.repass.value){
		alert("비밀번호가 일치하지 않습니다.");
		document.regForm.repass.focus();
		return;
	}
	
	if(document.regForm.email.value == ""){
		alert("이메일을 입력해주세요.");
		document.regForm.email.focus();
		return;
	}
	
	if(document.regForm.zipcode.value == ""){
		alert("우편번호를 입력해주세요.");
		document.regForm.zipcode.focus();
		return;
	}
	
	if(document.regForm.address1.value == ""){
		alert("주소를 입력해주세요.");
		return;
	}
	
	document.regForm.submit();
}