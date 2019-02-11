<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload Result Page</title>
</head>
<body>



<script>

// Model 객체에 담은 key
var result = '${savedName}';

// 자신이 속한 화면의 바깥쪽 parent의 addFilePath() 함수 호출
parent.addFilePath(result);

</script>


</body>
</html>