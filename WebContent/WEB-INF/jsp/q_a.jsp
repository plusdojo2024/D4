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
        <div class="logo">
		  <img src="/D4/img/icon.png" alt="アプリロゴ">
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
        <li><a href="/D4/RegistServlet">ユーザー登録フォーム</a></li>
    </ul>
</nav>

<!-- ここにプログラムを記入 -->
<form method="post" action="/D4/QAServlet" id="update_text">
	<!-- 質問の詳細表示、ID==質問IDならば編集可能 -->
	<c:if var="t" test="${id.users_id == Qid.users_id}">
	<c:if test="${Judge=='回答募集中'}">
	    <input type="radio" name="judge" value="回答募集中" checked="checked">回答募集中
		<input type="radio" name="judge" value="解決済み">解決済み
	</c:if>
	<c:if test="${Judge=='解決済み'}">
	    <input type="radio" name="judge" value="回答募集中" >回答募集中
		<input type="radio" name="judge" value="解決済み" checked="checked">解決済み
	</c:if>

		<br>
		<textarea id="question_text" name="question">${QList.question}</textarea>

		<input type="submit" name="submit" value="更新"><br>

		<span id="update">${update.message}</span>
	</c:if>

	<c:if var="t" test="${id.users_id != Qid.users_id}">
	    <c:if test="${Judge=='回答募集中'}">
	    <input type="radio" name="judge" value="回答募集中" checked="checked">回答募集中
		<input type="radio" name="judge" value="解決済み">解決済み
	</c:if>
	<c:if test="${Judge=='解決済み'}">
	    <input type="radio" name="judge" value="回答募集中" >回答募集中
		<input type="radio" name="judge" value="解決済み" checked="checked">解決済み
	</c:if>
		<br>
		<textarea name="question" readonly="readonly">${QList.question}</textarea>

	</c:if>
</form>

<form method="post" action="/D4/QAServlet" id="answer">
	<!-- 過去の回答を編集不可で表示 -->
	<br>
	<c:forEach var="e" items="${AList}">
		<textarea name="postAnswer" readonly="readonly">${e.answer}</textarea><br>
	</c:forEach>

	<!-- 回答入力欄＆送信ボタン -->
	<textarea id="answer_text" name="answerForm"></textarea>
	<input type="submit" name="submit" value="回答する"><br>
	<span id="error_message">${result.message}</span>
</form>

</main>
<footer>
    <p class="copyright">&copy; DIV</p>
</footer>
<script src="./js/q_a.js"></script>
</body>
</html>