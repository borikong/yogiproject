function writeSave(){
	
	if(document.writeForm.title.value==""){
		alert("글 제목을 입력해주세요.");
		document.writeForm.title.focus();
		return false;
	}
	
	if(document.writeForm.writer.value==""){
		alert("이름을 입력해주세요.");
		document.writeForm.writer.focus();
		return false;
	}
	
	if(document.writeForm.pass.value==""){
		alert("비밀번호를 입력해주세요.");
		document.writeForm.pass.focus();
		return false;
	}
	
	if(document.writeForm.content.value==""){
		alert("내용을 입력해주세요.");
		document.writeForm.content.focus();
		return false;
	}
}