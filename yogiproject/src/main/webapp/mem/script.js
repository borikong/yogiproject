function idCheck(id) {
	if(id==""){
		alert("아이디를 입력해주세요");
		document.regForm.id.focus();
	}else {
		url="member.do?cmd=idCheck&id="+id;
		window.open(url, "post", "width=300, height=150");
	}
}

function zipCheck(){
	url="member.do?cmd=zipCheck&check=y";
	window.open(url,"post","toolbar=no, width=500, height=300, directories=no, status=yes, scrollbars=yes, menubar=no");
}