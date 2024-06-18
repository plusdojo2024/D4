<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ホーム | とくめぇ～</title>
<link rel="stylesheet" href="/D4/css/common.css">
</head>
<body>
<header>
    <div class="headers">
        <div class="logo">
		  <img src="/D4/img/icon.png" alt="アプリロゴ">
        </div>
        <div class="header">
            <input type="button" onclick="window.location='/D4/LogoutServlet'" value="ログアウト" class="lobutton">
        </div>
    </div>
</header>
<main>
<nav class="nav">
    <ul class="menu">
        <li><a href="/D4/HomeServlet" class="major home">ホーム</a></li>
        
        <li><a class="major">質問</a><br>
        <a href="/D4/QListServlet" class="link">一覧</a><br>
        <a href="/D4/QFormServlet" class="link">質問をする</a></li>
        
        <li><a class="major">目安箱</a><br>
        <a href="/D4/RListServlet" class="link">一覧</a><br>
        <a href="/D4/RFormServlet" class="link">要望を送る</a></li>
        
        <li><a class="major">育成</a><br>
        <a href="/D4/CharacterServlet" class="link">アノニくんに会いに行く</a><br>
        <a href="/D4/ReachedServlet" class="link">アノニくん到達段階</a></li>
        
        <c:if test="${id.master_code == 1}">
        <li class="major"><a href="/D4/RegistServlet">ユーザー登録フォーム</a></li>
        </c:if>
    </ul>
</nav>

<!-- ここにプログラムを記入 -->
<h2>新規質問通知欄</h2>
	<c:if test="${empty questionList}">
		<p>一致するデータはありません。</p>
	</c:if>

	<c:forEach var="e" items="${questionList}" >
	  	<input type="text" name="requestList" value="${e.question}">
	  	<br>
	</c:forEach>

	<a href="/D4/QListServlet">もっと見る</a>

<h2>目安箱通知欄</h2>
	<c:if test="${empty requestsList}">
		<p>一致するデータはありません。</p>
	</c:if>

	<c:forEach var="e" items="${requestsList}" >
	  	<input type="text" name="requestList" value="${e.request}">
	  	<br>
	</c:forEach>

	<a href="/D4/RListServlet">もっと見る</a>

<h2>質問フォーム</h2>
<form id="question" method="post">
    <textarea name="question" placeholder="質問フォーム"></textarea>
    <p><input type="submit" name="submit" value="送信"></p>
    <span id="error_message"><a id ="result">${result.message}</a></span>
</form>

<!-- レベル別アノニくんの画像表示 -->
<p>育成ptの説明</p>
<c:if test="${id.grow_point < 25}">
<img src="/D4/img/homeanoni1.png" alt="ホームアノニくんの画像1">
</c:if>
<c:if test="${25<= id.grow_point && id.grow_point < 75}">
<img src="/D4/img/homeanoni2.png" alt="ホームアノニくんの画像2">
</c:if>
<c:if test="${75<= id.grow_point && id.grow_point < 225}">
<img src="/D4/img/homeanoni3.png" alt="ホームアノニくんの画像3">
</c:if>
<c:if test="${225<= id.grow_point && id.grow_point < 400}">
<img src="/D4/img/homeanoni4.png" alt="ホームアノニくんの画像4">
</c:if>
<c:if test="${400<= id.grow_point}">
<img src="/D4/img/homeanoni5.png" alt="ホームアノニくんの画像5">
</c:if>


</main>
<footer>
    <p class="copyright">&copy; DIV</p>
</footer>
</body>
</html>