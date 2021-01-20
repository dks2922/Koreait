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

<title>Cartoon</title>
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
<!-- 본문 채우기 -->

<div class="container">
	<div class="col-md-12">
		<div class="page-header">
			<div class="text-center">
				<h2> CARTOON</h2>
			</div>	
			<div class="text-right">
				${contentboardList.totalCount}(${contentboardList.currentPage}/${contentboardList.totalPage})Page
				<input type="button" class="btn btn-outline-primary"  value="글쓰기" onclick="location.href='insert'">
			</div>
			
		</div>
	</div>
</div>

<div class="container">
<c:set var="contentlist" value="${contentboardList.list}"/>
	<c:if test="${contentlist.size() == 0}">
		<div>
			<p>
				<marquee>테이블에 저장된 글이 없습니다.</marquee>
			</p>
		</div>
	</c:if>
	
	<c:if test="${contentlist.size() != 0}">
		<div class="row">
		<c:forEach var="contentVO" items="${contentlist}">
 			<div class="col-xs-4">		
			<div class="card">
				<div class="card-header" hidden="hidden">
					${contentVO.idx}
				</div>
			  	<img src="testfile/${contentVO.photo}" class="img-responsive"/>
		  	  <div class="card-body" align="center">
			    <h5 class="card-title">
			    	<a class="btn btn-default" data-target="#${contentVO.name}" data-toggle="modal">${contentVO.name}</a>
			    </h5>
			  </div>
			</div>
		</div>
		<!-- 모달 팝업 창으로 표시할 내용 -->
			<div class="modal" id="${contentVO.name}" tabindex="1">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							${contentVO.name}(${contentVO.subject})
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body" style="text-align: center;">
							<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/${contentVO.url}" width="500px;"height="300px;"></iframe>
							<hr/>
							<p>장르:${contentVO.genre}<br/>
							제작:${contentVO.company}<br/>
							등급:${contentVO.cls}<br/>
							출시일:${contentVO.releaseDate}<br/>
							가격:${contentVO.price}<br/>
							플랫폼:${contentVO.platform}</p>
							<a href="gameView?idx=${contentVO.idx}&currentPage=${contentboardList.currentPage}" class="btn btn-default">수정/삭제하러 가기</a>
						</div>
					</div>
				</div>		
			</div>
		<!--  -->
 			<!--  -->
	</c:forEach>
	</div>
	</c:if>
</div>	
<div class="container">
		 <div align="center">
			
			<c:if test="${contentboardList.currentPage > 1}">
				<input type="button" class="btn btn-default" value="맨앞" onclick="location.href='?subject=cartoon&currentPage=1'" title="첫 페이지 목록으로 이동하기"/>
			</c:if>
			<c:if test="${contentboardList.currentPage <= 1}">
				<input type="button" class="btn btn-default" value="맨앞" disabled="disabled" title="이미 첫 번째 목록입니다."/>
			</c:if>
			
			<c:if test="${contentboardList.startPage > 1}">
				<input class="btn btn-default" type="button" value="이전" onclick="location.href='?subject=cartoon&currentPage=${contentboardList.startPage - 1}'" 
					title="이전 페이지 목록으로 이동하기"/>
			</c:if>
			<c:if test="${contentboardList.startPage <= 1}">
				<input class="btn btn-default" type="button" value="이전" disabled="disabled" title="이미 첫 번째 페이지 목록입니다."/>
			</c:if>
			
			<c:forEach var="i" begin="${contentboardList.startPage}" end="${contentboardList.endPage}" step="1">
				<c:if test="${contentboardList.currentPage == i}">
					<input class="btn btn-default" type="button" value="${i}" disabled="disabled"/>
				</c:if>
				<c:if test="${contentboardList.currentPage != i}">
					<input class="btn btn-default" type="button" value="${i}" onclick="location.href='?subject=cartoon&currentPage=${i}'"
						title="${i}페이지로 이동합니다."/>
				</c:if>
			</c:forEach>
			
			<c:if test="${contentboardList.endPage < contentboardList.totalPage}">
				<input class="btn btn-default" type="button" value="다음" onclick="location.href='?subject=cartoon&currentPage=${contentboardList.endPage + 1}'" 
					title="다음 페이지 목록으로 이동하기"/>
			</c:if>
			<c:if test="${contentboardList.endPage >= contentboardList.totalPage}">
				<input class="btn btn-default" type="button" value="다음" disabled="disabled" title="이미 마지막 페이지 목록입니다."/>
			</c:if>
			
 			<c:if test="${contentboardList.currentPage < contentboardList.totalPage}">
				<input class="btn btn-default" type="button" value="맨뒤" onclick="location.href='?subject=cartoon&currentPage=${contentboardList.totalPage}'" 
					title="마지막 페이지 목록으로 이동하기"/>
			</c:if>
			<c:if test="${contentboardList.currentPage >= contentboardList.totalPage}">
				<input class="btn btn-default" type="button" value="맨뒤" disabled="disabled" title="이미 마지막 목록입니다."/>
			</c:if>
			
		</div>
</div>



<!--  -->
<hr color="black" size="2"/><br/>
	
	<footer style="background-color: black;color: white">
		<div class="container">
		<br/>
		<div class="row">
			<div class="col-sm-4" style="text-align: center">
				<h5>Copyright &copy; 2020</h5>
			</div>
			
			<div class="col-sm-4">
				<h5>사이트 소개</h5>
				<h5>엔터에 대한 정보를 간단히 보여주는 사이트</h5>
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
	
</body></html>