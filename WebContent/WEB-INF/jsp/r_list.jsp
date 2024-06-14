<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>目安箱一覧 | とくめぇ～</title>
</head>
<body>
<header>
    <div class="headers">
        <div class="header">アプリロゴ</div>
        <div class="header">
            <a href="/D4/LogoutServlet">ログアウト</a>
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
        <li><a href="/D4/RegistServlet">ユーザー登録フォーム</a></li>
    </ul>
</nav>

<!-- ここにプログラムを記入 -->
<span id="error_message">
  <a id ="R_result">${R_result.message}</a>
</span>
<c:forEach var="e" items="${requestList}" >
	<form class="r_list" method="get" action="/D4/RListServlet">

	  	<!-- <textarea  name="requestList" rows="5" cols="100" readonly="readonly">${e.request}</textarea> -->
	  	<input type="text" name="requestList" value="${e.request}">
	  	<br>


	</form>
</c:forEach>
<div>
	<button>もっと見る</button>
</div>


</main>
<footer>
    <p class="copyright">&copy; DIV</p>
</footer>
</body>
</html>