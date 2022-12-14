<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>taste-main</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/asset/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/all_css.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/playlist-like.css">
<link rel="stylesheet" href="/bookproject/asset/css/modal.css">
<script src="${pageContext.request.contextPath}/asset/js/jquery-1.12.4.js"></script>
<script src="${pageContext.request.contextPath}/asset/bootstrap/js/bootstrap.js"></script>
</head>
<!--header-->
<body>
	<div id="wrap">
		<!-- 헤더 -->
		<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
		<div id="nav" class="clearfix">
			<c:choose>
				<c:when test="${result eq 'sameUser'}">
					<ul class="nav nav-tabs">
						<li role="presentation"><a href="${pageContext.request.contextPath}/${nickname}">내 서평</a></li>
						<li role="presentation"><a href="${pageContext.request.contextPath}/${nickname}/tastemain">취향저격</a></li>
						<li role="presentation" class="active"><a href="${pageContext.request.contextPath}/${nickname}/like_playlist">플레이리스트</a></li>
						<!--세션 아이디와 사이트아이디 같을때
						<li role="presentation"><a href="${pageContext.request.contextPath}/analyze">통계</a></li>
						-->
					</ul>
				</c:when>
				<c:otherwise>
					<!-- 세션아이디랑 다를때는 사이트주소의 아이디와 같은 유저의 데이터들 불러오기-->
					<ul class="nav nav-tabs">
						<li role="presentation"><a href="${pageContext.request.contextPath}/${nickname}">남 서평</a></li>
						<li role="presentation"><a href="${pageContext.request.contextPath}/${nickname}/tastemain">취향저격</a></li>
						<li role="presentation" class="active"><a href="${pageContext.request.contextPath}/${nickname}/like_playlist">플레이리스트</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>
		<!-- ------nav------ -->
		<div id="content">
			<!--content4-->
			<div id="content4">
				<div class="minicontent">
					<div class="left">
						<c:choose>
							<c:when test="${result eq 'sameUser'}">
								<p>'${nickname}'님이 좋아하는 플레이리스트</p>
							</c:when>
							<c:otherwise>
								<p>'${otherUser.nickname}'님이 좋아하는 플레이리스트</p>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="right" id="more">
						<p>
							<a href="${pageContext.request.contextPath}/${nickname}/playlist">더보기</a><span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
						</p>
					</div>
				</div>
				<div>
					<p class="index">오늘의 플레이리스트를 확인해보세요!</p>
				</div>
				<div id="playlist">
					<c:forEach items="${likeplay}" var="vo">
						<div class="nail purple"> <!-- 1~14까지 감정으로색깔 -->
							<div onclick="location.href='${pageContext.request.contextPath}/playlist/folder?playlistNo=${vo.playlistNo }&userNo=${vo.userNo }&nickname=${vo.nickname}'" class="nail-desc">
								<p>${vo.playlistName }</p>
							</div>
							<div>
								<div onclick="location.href='${pageContext.request.contextPath}/main/playlist?playlistNo=${vo.playlistNo }'" id="opac">  
									<span class="glyphicon glyphicon-play-circle" aria-hidden="true"></span>
								</div>
							</div>
						</div>	
					</c:forEach>
				</div>
			</div>
			<!--content4-->
			<!--content4-->
			<div id="content4">
				<div class="minicontent">
					<div class="left">
						<p>인기순 플레이리스트</p>
					</div>
				</div>
				<div class="right" id="more">
					<p>
						<a href="${pageContext.request.contextPath}/${nickname}/hotplaylist">더보기<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></a>
					</p>
				</div>
				<div>
					<p class="index">보글이 끓인 오늘의 플레이리스트를 확인해보세요!</p>
				</div>
				<div id="playlist">
					<c:forEach items="${popularlist}" var="vo">
						<div class="nail green" onclick="location.href='${pageContext.request.contextPath}/playlist/folder?playlistNo=${vo.playlistNo }&userNo=${vo.userNo }&nickname=${vo.nickname }'">
							<!-- 1~14까지 감정으로색깔 -->
							<div class="nail-desc">
								<p>${vo.playlistName }</p>
							</div>
							<div>
								<div id="opac">
									<span class="glyphicon glyphicon-play-circle" aria-hidden="true"></span>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<!--content4-->
			<!--content4-->
			<div id="content4">
				<div class="minicontent">
					<div class="left">
						<p>내가 만든 서평 플레이리스트</p>
					</div>
					<div class="right" id="more">
						<p>
							<a href="${pageContext.request.contextPath}/${nickname}/writeplaylist">더보기</a><span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
						</p>
					</div>
				</div>
				<div>
					<p class="index">내가 만든 플레이리스트를 확인해보세요!</p>
				</div>
				<div id="playlist">
					
					<c:forEach items="${makelist}" var="vo">						
						<div class="nail deeppurple" onclick="location.href='${pageContext.request.contextPath}/playlist/folder?playlistNo=${vo.playlistNo }&userNo=${vo.userNo }&nickname=${vo.nickname }'"> <!-- 1~14까지 감정으로색깔 -->
							<div class="nail-desc">
								<p>${vo.playlistName }</p>
							</div>
							<div>
								<div id="opac">
									<span class="glyphicon glyphicon-play-circle" aria-hidden="true"></span>
								</div>
							</div>
						</div>							
					</c:forEach>
					
				</div>
			</div>
			<!--content4-->
		</div>
		<!-- footer -->
		<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
		<!-- modal창 -->
		<c:import url="/WEB-INF/views/include/modal.jsp"></c:import>
	</div>
	<!--wrap-->
</body>
<script src="${pageContext.request.contextPath}/asset/js/more.js"></script>
</html>