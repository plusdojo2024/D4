<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>質問一覧 | とくめぇ～</title>
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
<form>
<!-- ラジオボタン -->
<input type="radio" name="unresolved">回答募集中<br>
<input type="radio" name="resolved">解決済み<br>

<!-- 検索窓とボタン -->
<input type="text" name="questionWindow">
<input type="button" name="searchButton">
</form>

<c:if test="${empty  }">
	<p>まだデータがありません。</p>
</c:if>

<c:forEach var="e" items="${ }">
	<form method="get" action="/D4/QListServlet">
	
	
	</form>
</c:forEach>


</main>
<footer>
    <p class="copyright">&copy; DIV</p>
</footer>
</body>
</html>