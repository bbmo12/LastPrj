<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	 <!-- Required Meta Tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>medino</title>
    <!-- Page Title -->
    <title>Medino</title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="resources/assets/images/logo/favicon.png" type="image/x-icon">

    <!-- CSS Files -->
    <link rel="stylesheet" href="resources/assets/css/animate-3.7.0.css">
    <link rel="stylesheet" href="resources/assets/css/font-awesome-4.7.0.min.css">
    <link rel="stylesheet" href="resources/assets/css/bootstrap-4.1.3.min.css">
    <link rel="stylesheet" href="resources/assets/css/owl-carousel.min.css">
    <link rel="stylesheet" href="resources/assets/css/jquery.datetimepicker.min.css">
    <link rel="stylesheet" href="resources/assets/css/linearicons.css">
    <link rel="stylesheet" href="resources/assets/css/style.css">
</head>

<body>

	<!-- header -->
	<tiles:insertAttribute name="header"/>
		
	<!-- 몸통 -->
	<tiles:insertAttribute name="body" />
	
	<!-- 발 -->
	<tiles:insertAttribute name="footer"/>
  <!-- Javascript -->
    <script src="resources/assets/js/vendor/jquery-2.2.4.min.js"></script>
	<script src="resources/assets/js/vendor/bootstrap-4.1.3.min.js"></script>
    <script src="resources/assets/js/vendor/wow.min.js"></script>
    <script src="resources/assets/js/vendor/owl-carousel.min.js"></script>
    <script src="resources/assets/js/vendor/jquery.datetimepicker.full.min.js"></script>
    <script src="resources/assets/js/vendor/jquery.nice-select.min.js"></script>
    <script src="resources/assets/js/vendor/superfish.min.js"></script>
    <script src="resources/assets/js/main.js"></script>
</body>