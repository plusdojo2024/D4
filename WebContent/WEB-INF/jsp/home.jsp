<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ホーム | とくめぇ～</title>
<link rel="stylesheet" href="/D4/css/common.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.5.2/css/all.css">
<link rel="stylesheet" href="/D4/css/home.css">
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

<nav>
	<ul class="menu">
        <li title="ホーム" class="home"><a href="/D4/HomeServlet" class="home">ホーム</a></li>

    <%-- <div class="menuli">質問</div> --%>
        <li title="質問一覧" class="q"><a href="/D4/QListServlet" class="qlist">一覧</a></li>
        <li title="質問をする" class="q"><a href="/D4/QFormServlet" class="que">質問をする</a></li>

    <%-- <div class="menuli">目安箱</div> --%>
        <li title="要望一覧" class="r"><a href="/D4/RListServlet" class="rlist">一覧</a></li>
        <li title="要望を送る" class="r"><a href="/D4/RFormServlet" class="req">要望を送る</a></li>

    <%-- <div class="menuli">育成：アノニくん</div> --%>
        <li title="アノニくんに会う" class="chara"><a href="/D4/CharacterServlet" class="chara">アノニくんに会う</a></li>
        <li title="みんなの到達度" class="chara"><a href="/D4/ReachedServlet" class="reach">みんなの到達度</a></li>

        <c:if test="${id.master_code == 1}">
        <li title="ユーザー登録" class="regist"><a href="/D4/RegistServlet" class="regist">ユーザー登録</a></li>
        </c:if>
    </ul>
</nav>

<main>

<!-- ここにプログラムを記入 -->
<h2>新規質問通知欄</h2>
	<c:if test="${empty questionList}">
		<p>一致するデータはありません。</p>
	</c:if>

	<c:forEach var="e" items="${questionList}" >
	  	<input type="text" name="requestList" value="${e.question}" class="formtext">
	  	<br>
	</c:forEach>

	<a href="/D4/QListServlet">もっと見る</a>

<h2>目安箱通知欄</h2>
	<c:if test="${empty requestsList}">
		<p>一致するデータはありません。</p>
	</c:if>

	<c:forEach var="e" items="${requestsList}" >
	  	<input type="text" name="requestList" value="${e.request}" class="formtext">
	  	<br>
	</c:forEach>

	<a href="/D4/RListServlet">もっと見る</a>

<div class="qf_ha qf">
	<h2>質問フォーム</h2>
	<form id="question" method="post">
	    <textarea name="question" placeholder="質問フォーム" class="formta"></textarea>
	    <p><input type="submit" name="submit" value="送信" class="button"></p>
	    <span id="error_message"><a id ="result">${result.message}</a></span>
	</form>
</div>
	
<div class="qf_ha ha">
	<!-- レベル別アノニくんの画像表示 -->
	<div class="homeanoni">
	<p class="h2">育成ptの説明</p>
	<c:if test="${id.grow_point < 25}">
	<img src="/D4/img/homeanoni1.png" width="300px" alt="ホームアノニくんの画像1">
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
	</div>
</div>
</main>
<footer>
    <p class="copyright">&copy; DIV</p>
</footer>
</body>
</html>