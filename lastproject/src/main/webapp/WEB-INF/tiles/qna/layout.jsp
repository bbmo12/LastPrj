<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
</head>
<body>
	<!-- header -->
	<tiles:insertAttribute name="header" />

	<!-- banner -->
	<tiles:insertAttribute name="banner" />

	<!-- area -->
	<tiles:insertAttribute name="body" />

	<!-- footer -->
	<tiles:insertAttribute name="footer" />
</body>
</html>