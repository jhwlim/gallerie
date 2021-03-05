function checkExtOfFile(file) {
	const extArr = ['png', 'jpg', 'gif'];
	var fileName = file.name;
	var ext = fileName.substring(fileName.lastIndexOf('.')+1);
	
	if (extArr.indexOf(ext) >= 0) {
		return true;
	} else {
		alert(fileName + ' 파일은 지원하지 않은 파일 형식입니다.');
		return false;
	}
}
function hasSameFileName(file, fileList) {
	for (f of fileList) {
		if (f.name == file.name) {
			console.log("?");
			alert(f.name + ' 파일은 이미 추가되었습니다.');
			return true;
		}
	}
	return false;
}