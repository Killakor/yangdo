<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#container{
	width: 1024px;
	margin: 0 auto;
}
#top_banner > img {
	display: block;
	margin: 0 auto;
	width: 1000px; height: 460px;
}
#category > ul, #notice > ul {text-align: center;}
#category li {
	list-style: none;
	display: inline-block;
	width: 320px;
	height: 50px;
	background: #f2264c;
	border: 3px solid #f2264c;
	text-align: center;
	line-height: 50px;
	margin: 20px 3px;
}
#category a {
	display: block;
	width: 100%; height: 100%;
}
#content a {color: white; text-decoration: none;}
#content a:visited {color: white; text-decoration: none;}
#content > div {margin-bottom: 100px;}
#content h1 {
	font-size: 32px;
}
#notice > ul > li {
	display: inline-block;
	width: 48%; height: 170px;
	border: 1px solid #efefef;
	margin: 20px 4px; padding: 0;
}
#notice > ul > li > img {
	width: 170px; height: 170px;
	float: left;
}
#notice > ul > li > p {
	display: inline-block;
	float: left;
	height: 170px;
	text-align: left;
	padding: 40px 0px 0px 15px;
}
#notice strong {
	display: block;
	font-size: 25px;
	color: rgb(0, 121, 107);
}
#notice span {
	font-family: 'Nanum Gothic';
	font-size: 16px;
	color: rgba(0, 0, 0, 0.56);
}
#notice:after {clear: both; content: ""; display: block;}
#event > ul > li {
	display: inline-block;
	margin: 20px 12px;
}
#event > ul > li > img {width: 1000px;}
</style>
</head>
<body>
	<div id="wrap">
		<div id="container">
			<div id="top_banner">
				<img alt="top_banner" src="../resources/img/banner_test.gif">
			</div>
			<div id="content">
				<div id="category">
					<ul>
						<li><a href="../yangdo/yangdoList.do?pg=1&yangdo_kind=호텔">숙 박</a></li>
						<li><a href="../yangdo/yangdoList.do?pg=1&yangdo_kind=스포츠">티 켓</a></li>
						<li><a href="../yangdo/yangdoList.do?pg=1&yangdo_kind=레스토랑">식 사</a></li>
					</ul>
				</div>
				<div id="notice">
					<h1>양도어때 소식</h1>
					<ul>
						<li>
							<img alt="notice_banner" src="../resources/img/notice_banner1.png">
							<p>
								<strong>양도어때 아카데미</strong><br>
								<span>
									Java의 기초부터 Spring으로 웹개발 까지<br>
									양도어때 아카데미로 스마트하게
								</span>
							</p>
						</li>
						<li>
							<img alt="notice_banner" src="../resources/img/notice_banner2.png">
							<p>
								<strong>양도어때 토이 프로젝트</strong><br>
								<span>
									젊고 당당한 양도어때 프로젝트<br>
									지금 바로 살펴보세요!
								</span>
							</p>
						</li>
					</ul>
				</div>
				<div id="event">
					<h1>이벤트</h1>
					<ul>
						<li><img alt="event_banner" src="../resources/img/main_event_banner.png"></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>