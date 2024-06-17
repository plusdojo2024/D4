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
        <div class="logo">
		  <img src="/D4/img/icon.png" alt="アプリロゴ">
        </div>
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
<form method="post" action="/D4/QListServlet">
  <!-- ラジオボタン -->
  <input type="radio" name="selected" value="回答募集中">回答募集中<br>
  <input type="radio" name="selected" value="解決済み">解決済み<br>

  <!-- 検索窓とボタン -->
  <input type="text" name="questionWindow">
  <input type="submit" name="searchButton" value="検索">
</form>


<c:if test="${empty questionList}">
	<p>まだデータがありません。</p>
</c:if>

<span id="error_message">
  <a id ="Question_result">${Question_result.message}</a>
</span>

<c:forEach var="e" items="${questionList}">
	<form class="q_list" method="get" action="/D4/QListServlet">
	  	<input type="text" name="requestList" value="${e.question}">
	  	<br>
	</form>
</c:forEach>
<%--
<c:forEach var="e" items=" ${questionList}" >
	<form class="q_list" method="get" action="/D4/QListServlet">
		<input type="text" name="questionList" value="${e.question}" ><br>
	</form>
</c:forEach>
--%>

<form>
	<input type="button" name="moreLoad" value="さらに表示">
</form>

</main>
<footer>
    <p class="copyright">&copy; DIV</p>
</footer>
</body>
</html>