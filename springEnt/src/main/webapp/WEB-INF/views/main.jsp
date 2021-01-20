<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	.background{
		/* background-image: url("https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F2244304254130EEC0A"); */
		background-position: right;
		background-repeat: no-repeat;
		height: 500px;
		width: 1900px;
		opacity: 3;
	}
	
	.jumbotron #africa{
		background-image: url("./images/africa.jpg");
	}
	.col-sm-4{
		text-align: center;
		background: bottom;
	}
	.content {
	  position: static;
	  background: rgba(0, 0, 0, 0.5);
	  color: #f1f1f1;
	  width: 10cm;
	  height: 1cm;
	  padding: 10px;
	}
	.font-border{
		border: solid;
		border-bottom-width: 10px 0 1px 6px;
		padding: 10px;
	}
	
	
	
	
	*{padding: 0;margin: 0;}
		ul,li,ol,li{list-style:none;}
		a{display: block; color: #333; text-decoration: none;}
		h1{font-size: 20px;}
		h2{font-size: 16px;}
		h3{font-size: 14px;}
		
    @media screen and (min-width:769px) {
      .only-m{display:none;}

      header{width:100%; text-align:center;  background:rgba(0, 0, 0 , 0.5);}
      header .head-content{max-width:1280px; width:100%; padding:10px 10px 7px; margin:auto; overflow:hidden;}
      header .head-content:after{clear:both; display:block; content:"";}

      header h1{float:left}
      header h1 a{color:#000; text-transform:uppercase;}

      header .nav{display:inline-block; margin:auto; vertical-align:middle;}
      header .nav > ul{margin-top:10px;}
      header .nav > ul:after{clear:both; display:block; content:"";}
      header .nav > ul li.dep02{float:left}
      header .nav > ul li.dep02 h2{margin:0 10px;}
      header .nav > ul li.dep02 h2 a{padding:0 3px; color:#ebebeb;}
      header .nav > ul li.dep02.active h2 a{color:#000;}
      header .nav > ul li.dep02 h2 ~ ul.dep03{max-height:0; position:relative; margin-top:10px; transition:all 0.4s linear;}
      header .nav > ul li.dep02.active h2 ~ ul.dep03{max-height:200px;}
      header .nav > ul li.dep02 h2 ~ ul.dep03 li{}
      header .nav > ul li.dep02 h2 ~ ul.dep03 li h3{}
      header .nav > ul li.dep02 h2 ~ ul.dep03 li h3 a{padding:4px 0;}
      header .nav > ul li.dep02 h2 ~ ul.dep03 li h3 a:hover{color:#000;}

    }



    @media screen and (max-width:768px) {
      .only-m{display:block;}

      .m-btn-nav{width:30px; height: 24px; float:right; padding:5px; margin-top:10px; background: transparent; border: 0;}
      .m-btn-nav span{display:block; width:15px; height:2px; background:#fff; position:relative;}
      .m-btn-nav span:before{display:block; width:15px; height:2px; background:#fff; position:absolute; top:-5px; left:0; content:" ";}
      .m-btn-nav span:after{display:block; width:15px; height:2px; background:#fff; position:absolute; bottom:-5px; left:0; content:" ";}



      header{width:100%; text-align:center;  background:rgba(0, 0, 0 , 0.5); position:fixed; top:0; left:0;}
      header .head-content{max-width:100%; width:100%; padding:10px 10px 0px; margin:auto; overflow:hidden; box-sizing:border-box;}
      header .head-content:after{clear:both; display:block; content:"";}

      header h1{float:left; margin-top:10px;}
      header h1 a{color:#000; text-transform:uppercase;}

      header .nav{display:inline-block; width:100%; margin:auto; vertical-align:middle;}
      header .nav > ul{display:none;}
      header .nav > ul.active{display:block;}
      header .nav > ul:after{clear:both; display:block; content:"";}
      header .nav > ul li.dep02{float:none; width:100%; overflow: hidden;}
      header .nav > ul li.dep02 h2{width:100%; margin:0 0px;}
      header .nav > ul li.dep02 h2 a{padding:5 10px; color:#ebebeb; text-align:center;}
      header .nav > ul li.dep02.active h2 a{color:#000;}
      header .nav > ul li.dep02 h2 ~ ul.dep03{display: none; max-height:200px; position:relative; margin-top:0px; transition: none;}
      header .nav > ul li.dep02.active h2 ~ ul.dep03{display: block; max-height:200px;}
      header .nav > ul li.dep02 h2 ~ ul.dep03 li{}
      header .nav > ul li.dep02 h2 ~ ul.dep03 li h3{}
      header .nav > ul li.dep02 h2 ~ ul.dep03 li h3 a{padding:4px 0;}
	}
	
	
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>

<script type="text/javascript">

	var windowWidth;
		
		$(function(){
			windowWidth = $(window).width();
			
			$(window).resize(function(){
				windowWidth = $(window).width();
				
				if(768< windowWidth){
					$("header .nav > ul li.dep02 .def03").css({"display":"block"});
				}
				if(windowWidth < 768){
					$("header .nav > ul li.dep02 .def03").css({"display":"none"});
				}
			});
			
				$(".dep02").mouseover(function(){
					if(768 < windowWidth){
						$(this).addClass("active");
					}
				}).mouseleave(function(){
					if(768<windowWidth){
						$(this).removeClass("active");
					}
				});
				
				
				$(".m-btn-nav").click(function(){
					mBtnNav();
				});
				
				$("header .nav > ul li.dep02 h2").each(function(idx,
		element){
				
					$(element).click(function(){
						if(768 < windowWidth)
							return;
						
						$("header .nav > ul li.dep02 .dep03").slideUp();
						if($(this).next(".dep03").css("display")=="none"){
							$(this).next(".dep03").slideDown();
						}
					});
					
					});
				});
		
		function mBtnNav(){
			$("header .nav > ul").toggleClass("active");
		}
		
		
</script>


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
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="true">메뉴보기&nbsp;&nbsp;
				<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="#">추가할 메뉴 있으면 적고 없으면 삭제하기</a></li>
				</ul>
			</li>
		</div>
	</div>
	</div>
</nav>

	<hr color="black" size="2"/><br/><br/>

<!--  -->
<!-- 메인 본문 꾸며야함 -->
<h1  align="center" style="; font-size: 40px;"><b class="font-border">회사 소개</b></h1>

<nav class="background">
	<div class="container">
		<div>
			<blockquote style="font-style: oblique; font-size: 40px;"><hr>Ent<hr></blockquote>
		</div>
		<div align="center">
			<p class="content" style="font-size: 16px; ">각종 게임영상,영화,만화를 볼수 있는 사이트</p>
			<p><iframe width="400" height="300" src="https://www.youtube.com/embed/DkKbcS2JUZE?playlist=DkKbcS2JUZE&loop=1" ></iframe></p>
		</div>
	</div>
</nav>
	
<!--  -->
<hr color="black" size="2"/><br/>
	<footer style="background-color: black;color: white;">
		<div class="container" style="margin-top: 10cm;">
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

</body>
</html>