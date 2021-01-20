<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Ent Main</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">

<style type="text/css">
	.jumbotron{
		background-image: url("./images/jumbotronimg.jpg");
		background-size: cover;
		text-shadow: 0.2em 0.2em 0.2em gray;
		color: white;
	}
	body{
		background-color: white;
	}
	.jumbotron #africa{
		background-image: url("./images/africa.jpg");
	}
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>

</head>
<body>

<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="false">
			<span class="sr-only"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			</button>
		<a class="navbar-brand" href="main">Ent</a>	
		</div>
	
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
			<li><a href="main" accesskey="1" >Home</a></li>
			<li><a href="game?subject=game" class="game" accesskey="2">게임</a></li>
			<li><a href="movie?subject=movie" class="movie" accesskey="3">영화</a></li>
			<li><a href="cartoon?subject=cartoon" class="cartoon" accesskey="4">만화</a></li>
			<li><a href="list" class="list" accesskey="5">전체글 간략히 보기</a></li>
			<li>&nbsp;&nbsp;&nbsp;&nbsp;</li>
		</ul>
		<div class="nav navbar-nav navbar-right">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="true">메뉴보기
				<span class="caret"></span></a>
				<ul class="dropdown-menu">
						<li><a href="#">추가할 메뉴 있으면 적고 없으면 삭제하기</a></li>
				</ul>
			</li>
		</div>
	</div>
	</div>
</nav>
	
	<!--  -->
	<div class="container">
		<div class="table-responsive">
			<div class="page-header text-center">
				<h2>${contentVO.name}</h2>
			</div>
			<form action="updateCO" method="post">
				<table class="table table-bordered table-striped">
					<tr>
						<th align="center">
							 <img src="testfile/${contentVO.photo}" class="img-responsive" />
						</th>
					</tr>	
					<tr>
						<td class="text-center"> 장르 : ${contentVO.genre}</td>
					</tr>
					<tr>
						<td class="text-center"> 제작 : ${contentVO.company}</td>
					</tr>
					<tr>
						<td class="text-center"> 등급 : ${contentVO.cls}</td>
					</tr>
					<tr>
						<td class="text-center"> 출시일 : ${contentVO.releaseDate}</td>
					</tr>
					<tr>
						<td class="text-center"> 
							<div class="form-group">
								<label for ="price">가격 : </label>
								<input type="number" name="price" id="price" class="form-control" placeholder="${contentVO.price}"/>
							</div>
						</td>
					</tr>
					<tr>
					 <td>
					 	<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/${contentVO.url}" width="700px;"height="200px;"></iframe>
					 </td>
					</tr>
					<tr>
						<td>
							<div class="form-group">
								<label for ="url">url뒷부분 : </label>
						 		<input type="text" name="url" id="url" class="form-control" placeholder="${contentVO.url}"/>
							</div>		
						</td>
					</tr>
					<tr>
						<td>
							<div class="form-group">
								<label for ="platform">플랫폼: </label>
						 		<input type="text" name="platform" id="platform" class="form-control" placeholder="${contentVO.platform}"/>
							</div>		
						</td>
					</tr>
					<tr>
						<td class="text-center">
							<input class="btn btn-success" type="submit" value="수정하기">
							<input class="btn btn-warning" type="button" value="삭제하기" onclick="location.href='deleteCO?idx=${contentVO.idx}&currentPage=${currentPage}&subject=${contentVO.subject}'">
							<input class="btn btn-dark" type="button" value="돌아가기" onclick="history.back()">
			
							<input type="hidden" name="idx" value="${contentVO.idx}"/>
							<input type="hidden" name="currentPage" value="${currentPage}"/>
							<input type="hidden" name="subject" value="${contentVO.subject}"/>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	

<!--  -->

<hr color="black" size="2"/><br/>
	
	<footer style="background-color: white;color: black">
		<div class="container">
		<br/>
		<div class="row">
			<div class="col-sm-4" style="text-align: center">
				<h5>Copyright &copy; 2020</h5>
			</div>
			
			<div class="col-sm-4">
				<h5>사이트 소개</h5>
				<h5>여행지에 대한 정보를 간단히 보여주는 사이트입니다.</h5>
			</div>
			
			<div class="col-sm-4">
				<h5 style="text-align: center;">
					<span class="glyphicon glyphicon-ok"></span>&nbsp;by 김예지<br/>
					<span class="glyphicon glyphicon-ok"></span>&nbsp;by 김경준<br/>
					<span class="glyphicon glyphicon-ok"></span>&nbsp;by 안진석
				</h5>
			</div>
		</div>
		</div>
	</footer>	

</body>
</html>