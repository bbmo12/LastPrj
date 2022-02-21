<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	 <!-- Required Meta Tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>medino</title>

</head>

<body>

	<!-- header -->
	<tiles:insertAttribute name="header"/>
	
	<!-- section -->
	<tiles:insertAttribute name="section"/>
	
	<!-- section2 -->
	<tiles:insertAttribute name="section2"/>
	
	<!-- section3 -->
	<tiles:insertAttribute name="section3"/>
	
	<!-- section4 -->
	<tiles:insertAttribute name="section4"/>
	
	<!-- section5 -->
	<tiles:insertAttribute name="section5"/>
	
	<!-- section6 -->
	<tiles:insertAttribute name="section6"/>	
	
	<!-- section7 -->
	<tiles:insertAttribute name="section7"/>
	
	<!-- section8 -->
	<tiles:insertAttribute name="section8"/>
	
	<!-- 몸통 -->
	<tiles:insertAttribute name="body" />
	
	<!-- 발 -->
	<tiles:insertAttribute name="footer"/>

</body>