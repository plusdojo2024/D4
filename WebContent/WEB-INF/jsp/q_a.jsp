<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>質問詳細・回答 | とくめぇ～</title>
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
<form method="get" action="/D4/QAServlet">
	<!-- 質問の詳細表示、ID==質問IDならば編集可能 -->
	<c:if>
		<textarea name="question">${ }</textarea>
		<input type="radio" name="unresolved">回答募集中<br>
		<input type="radio" name="resolved">解決済み<br>
	</c:if>
	<c:if>
		<textarea name="question" readonly="readonly">${ }</textarea>
		<input type="radio" name="unresolved" readonly="readonly">回答募集中<br>
		<input type="radio" name="resolved" readonly="readonly">解決済み<br>
	</c:if>

	<!-- 過去の回答を編集不可で表示 -->
	<c:forEach var="e" items="${ }">
		<textarea name="postAnswer" readonly="readonly">${ }</textarea><br>
	</c:forEach>

</form>
<form method="post" action="/D4/QAServlet">
	<!-- 回答入力欄＆送信ボタン -->
	<input type="text" name="answerForm">
	<input type="submit" name="submit" value="回答する">
</form>

</main>
<footer>
    <p class="copyright">&copy; DIV</p>
</footer>
</body>
</html>