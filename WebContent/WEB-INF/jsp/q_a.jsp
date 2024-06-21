<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>質問詳細・回答 | とくめぇ～</title>
<link rel="stylesheet" href="/D4/css/common.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.5.2/css/all.css">
<link rel="stylesheet" href="/D4/css/q_a.css">
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
<nav>
	<ul class="menu">
        <li title="ホーム" class="home"><a href="/D4/HomeServlet" class="home">ホーム</a></li>

    <%-- <div class="menuli">質問</div> --%>
        <li title="質問一覧" class="q qlist"><a href="/D4/QListServlet" class="qlist">一覧</a></li>
        <li title="質問をする" class="q que"><a href="/D4/QFormServlet" class="que">質問をする</a></li>

    <%-- <div class="menuli">目安箱</div> --%>
        <li title="要望一覧" class="r rlist"><a href="/D4/RListServlet" class="rlist">一覧</a></li>
        <li title="要望を送る" class="r req"><a href="/D4/RFormServlet" class="req">要望を送る</a></li>

    <%-- <div class="menuli">育成：アノニくん</div> --%>
        <li title="アノニくんに会う" class="chara anoni"><a href="/D4/CharacterServlet" class="anoni">アノニくんに会う</a></li>
        <li title="みんなの到達度" class="chara reach"><a href="/D4/ReachedServlet" class="reach">みんなの到達度</a></li>

        <c:if test="${id.master_code == 1}">
        <li title="ユーザー登録" class="regist"><a href="/D4/RegistServlet" class="regist">ユーザー登録</a></li>
        </c:if>
    </ul>
</nav>
<main>
<!-- ここにプログラムを記入 -->
<div class="back">
<h1>選択した質問</h1>
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
		<textarea id="question_text" name="question" class="formta">${QList.question}</textarea>

		<input type="submit" name="submit" value="更新" class="button upd"><br>

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

	<h1>質問に対する過去の回答</h1>
	<c:forEach var="e" items="${AList}">
		<textarea name="postAnswer" readonly="readonly" class="formtata">${e.answer}</textarea><br>
	</c:forEach>
</div>
	<!-- 回答入力欄＆送信ボタン -->
	<textarea id="answer_text" name="answerForm"></textarea>
	<input type="submit" name="submit" value="回答する" class="button"><br>
	<span id="error_message">${result.message}</span>
</form>

</main>
<footer>
    <p class="copyright">&copy; DIV</p>
</footer>
<script src="./js/q_a.js"></script>
</body>
</html>