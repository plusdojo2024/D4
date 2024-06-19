
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>質問一覧 | とくめぇ～</title>
<link rel="stylesheet" href="/D4/css/common.css">
</head>
<body>
<header>
    <div class="headers">
        <div class="logo">
          <c:if test="${id.master_code == 0}">
          <a href="/D4/HomeServlet"><img src="/D4/img/icon.png" alt="アプリロゴ"></a>
          </c:if>
          <c:if test="${id.master_code == 1}">
          <a href="/D4/HomeServlet"><img src="/D4/img/akiramenai.png" alt="管理者用アプリロゴ"></a>
          </c:if>
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
<form method="post" action="/D4/QListServlet">
  <!-- ラジオボタン -->
  <input type="radio" name="selected" value="回答募集中">回答募集中<br>
  <input type="radio" name="selected" value="解決済み">解決済み<br>

  <!-- 検索窓とボタン -->
  <input type="text" name="questionWindow" placeholder = "キーワードを入力してください">
  <input type="submit" name="submit" value="検索">
</form>


<c:if test="${empty questionList}">
	<p>まだデータがありません。</p>
</c:if>

<span id="error_message">
  <a id ="Question_result">${Question_result.message}</a>
</span>

<div id="moreload">
  <ul class="r_list">
    <c:forEach var="e" items="${questionList}">
	    <%--
	    <form class="q_list" name="q_list" method="post" action="/D4/QListServlet">
	    <input type="text" name="questions_id" value="${e.questions_id}">
	  	<input type="submit" name="submit" value="${e.question}">
	  	<br>
	  	</form>
	  	--%>
	  <li class="list_item is-hidden"><a href = "/D4/QAServlet">${e.question}</a></li>
    </c:forEach>
  </ul>
  <div id="more">
	<button>もっと見る</button>
  </div>
</div>
<%--
<c:forEach var="e" items=" ${questionList}" >
	<form class="q_list" method="get" action="/D4/QListServlet">
		<input type="text" name="questionList" value="${e.question}" ><br>
	</form>
</c:forEach>
--%>

</main>
<footer>
    <p class="copyright">&copy; DIV</p>
</footer>
<script src="./js/q_list.js"></script>
</body>
</html>