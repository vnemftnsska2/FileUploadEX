<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<script src="http://code.jquery.com/jquery.min.js"></script>
<meta charset="UTF-8">
<title>UploadAjax</title>

<style>

.fileDrop {
	width: 100%;
	height: 200px;
	border: 1px dotted blue;
}

small {
	margin-left: 3px;
	font-weight: bold;
}

</style>
</head>
<body>

	<h3>Ajax File Upload</h3>
	<div class="fileDrop"></div>

	<div class="uploadedList"></div>


	<script>
	
	$(".fileDrop").on("dragenter dragover", function(event){
		event.preventDefault();
	});
	
	$(".fileDrop").on("drop", function(event){
		// 기본 이벤트 막아줌
		event.preventDefault();
		// 기본 이벤트를 막아주고 진행
		
		var files = event.originalEvent.dataTransfer.files;
		var file = files[0];
		
		// console.log(file); file 객체 정보를 볼 수 있음
		var formData = new FormData();
		formData.append("file", file);
		
		$.ajax({
			url: '/uploadAjax',
			data: formData,
			dataType: 'text',
			processData: false,
			contentType: false,
			type: 'POST',
			success: function(data){
				
				console.log(data);
				console.log(checkImageType(data));
				
				var str = "";
				
				if(checkImageType(data)) {
					str = "<div>"
						+ "<a href='displayFile?fileName=" + getImageLink(data) + "'>"
						+ "<img src='displayFile?fileName=" + data + "'/></a><small data-src="+data+">X</small></div>";
				} else {
					str = "<div><a href='displayFile?fileName=" + data + "'>" + getOriginalName(data) + "</a><small data-src="+data+">X</small></div>";
				}
				
				$(".uploadedList").append(str);
			}
		});
	});
	
	function checkImageType(fileName) {
		
		var pattern = /jpg$|gif$|png$|jpeg$/i;
		
		return fileName.match(pattern);
	}
	
	function getOriginalName(fileName) {
		
		if(checkImageType(fileName)) {
			return;
		}
		
		var idx = fileName.indexOf("_") + 1;
		return fileName.substr(idx);
	}
	
	function getImageLink(fileName) {
		
		if(!checkImageType(fileName)) {
			return;
		}
		var front = fileName.substr(0, 12);	// 경로 앞에 날짜 추출
		var end = fileName.substr(14);	// 경로 뒤 s_ 제거
		
		return front + end;
	}
	// 공백 처리 (encodeURI 이용)
	/* function getFileInfo(fullName) {
		
		var fileName, imgsrc, getLink;
		var fileLink;
		
		if(checkimageType(fullName)){
			imgsrc = encodeURI("/displayFile?fileName="+fullName);
			fileLink = fullName.substr(14);
			
			var front = fullName.substr(0, 12); // /2019/02/11/
			var end = fullName.substr(14);
			
			getLink = encodeURI("/displayFile?fileName="+front + end);
		} else {
			
			imgsrc = "/resource/dist/img/file.png";
			fileLink = fullName.substr(12);
			getLink = encodeURI("/displayFile?fileName=" + fullName);
		}
		fileName = fileLink.substr(fileLink.indexOf("_")+1);
		
		return {fileName:fileName, imgsrc:imgsrc, getLink:getLink, fullName:fullName};
	} */
	/////////////////////////////////////////////////////////
	$(".uploadedList").on("click", "small", function(event){
		
		var that = $(this);
		
		$.ajax({
			url : "deleteFile",
			type : "post",
			data : {fileName:$(this).attr("data-src")},
			dataType : "text",
			success : function(result) {
				if(result == 'deleted') {
					alert("deleted");
					that.parent("div").remove();
				}
			}
		});
	});
	
	</script>

</body>
</html>