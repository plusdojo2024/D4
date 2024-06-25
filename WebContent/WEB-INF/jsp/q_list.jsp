
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>質問一覧 | とくめぇ～</title>
<link rel="stylesheet" href="/D4/css/common.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.5.2/css/all.css">
<link rel="stylesheet" href="/D4/css/q_list.css">
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
            <input type="button" onclick="MoveCheck();" value="ログアウト" class="logout">
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

<!-- ここにプログラムを記入 -->

<form method="post" action="/D4/QListServlet" id = "searchform">
  <!-- ラジオボタン -->
  <input type="radio" name="selected" value="回答募集中" id ="still"><a id = "still_text">回答募集中</a>
  <input type="radio" name="selected" value="解決済み" id = "done">解決済み

  <!-- 検索窓とボタン -->

    <input type="text" name="questionWindow" id = "searchwindow">
    <input type="submit" name="submit" value="検索" id = "searchbutton">

</form>

<main>


  <c:if test="${empty questionList}">
	<p class="noneData">まだデータがありません。</p>
  </c:if>

  <span id="error_message">
    <a id ="Question_result">${Question_result.message}</a>
  </span>

<div id="moreload">
 <ul class="question_list">
  <c:forEach var="e" items="${questionList}">
	<form class="q_list" name="q_list" method="post" action="/D4/QListServlet">
	    <li class="list_item is-hidden"><a id = "q_number">質問No.</a><input type="text" name="questions_id" value="${e.questions_id}" id ="questions_id" size ="3" readonly="readonly">
	    <input type="submit" name="submit" value="<c:out value='${e.question}'></c:out>" id ="questions" ></li>
	</form>
  </c:forEach>
  </ul>
<%--
<c:forEach var="e" items=" ${questionList}" >
	<form class="q_list" method="get" action="/D4/QListServlet">
		<input type="text" name="questionList" value="${e.question}" ><br>
	</form>
</c:forEach>
--%>
  <div id ="more">
	<button class ="morebutton">もっと見る<br>↓</button>
  </div>

</main>
<footer>
    <p class="copyright">&copy; DIV</p>
</footer>

<script src="./js/q_list.js"></script>

</body>
</html>