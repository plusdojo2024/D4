<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>目安箱一覧 | とくめぇ～</title>
<link rel="stylesheet" href="/D4/css/common.css">
</head>
<body>
<header>
    <div class="headers">
        <div class="logo">
		  <a href="/D4/HomeServlet"><img src="/D4/img/icon.png" alt="アプリロゴ"></a>
        </div>
        <div class="header">
            <input type="button" onclick="MoveCheck();" value="ログアウト" class="lobutton">
        </div>
    </div>
</header>
<main>
<nav>
    <ul>
        <li><a href="/D4/HomeServlet">ホーム</a></li>
        <a>質問</a>
        <li><a href="/D4/QListServlet">一覧</a></li>
        <li><a href="/D4/QFormServlet">質問をする</a></li>
        <a>目安箱</a>
        <li><a href="/D4/RListServlet">一覧</a></li>
        <li><a href="/D4/RFormServlet">要望を送る</a></li>
        <a>育成</a>
        <li><a href="/D4/CharacterServlet">アノニくんに会いに行く</a></li>
        <li><a href="/D4/ReachedServlet">アノニくん到達段階</a></li>
        <c:if test="${id.master_code == 1}">
        <li><a href="/D4/RegistServlet">ユーザー登録フォーム</a></li>
        </c:if>
    </ul>
</nav>

<!-- ここにプログラムを記入 -->
<span id="error_message">
  <a id ="Request_result">${Request_result.message}</a>
</span>

<div id="moreload">
<ul class="r_list">
	<c:forEach var="e" items="${requestList}" >
		  	<!-- <textarea  name="requestList" rows="5" cols="100" readonly="readonly">${e.request}</textarea> -->

		<li class="list_item is-hidden"><a>${e.request}</a></li>
	</c:forEach>
</ul>
<div id="more">
	<button>もっと見る</button>
</div>
</div>

</main>
<footer>
    <p class="copyright">&copy; DIV</p>
</footer>

<script src="./js/r_list.js"></script>

</body>
</html>