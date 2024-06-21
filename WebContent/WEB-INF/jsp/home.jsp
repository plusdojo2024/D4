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

<main>

<!-- ここにプログラムを記入 -->
<h2>新規質問通知欄</h2>
<div class="newq">
	<div>
	<c:if test="${empty questionList}">
		<p>一致するデータはありません。</p>
	</c:if>

	<c:forEach var="e" items="${questionList}" >
	  	<input type="text" name="requestList" value="${e.question}" readonly="readonly" class="formtext">
	  	<br>
	</c:forEach>
	</div>
	<div class="more">
	<a href="/D4/QListServlet" class="button a">もっと見る</a>
	</div>
</div>

<h2>目安箱通知欄</h2>
<div class="newr">
	<div>
	<c:if test="${empty requestsList}">
		<p>一致するデータはありません。</p>
	</c:if>

	<c:forEach var="e" items="${requestsList}" >
	  	<input type="text" name="requestList" value="${e.request}" readonly="readonly" class="formtext">
	  	<br>
	</c:forEach>
	</div>
	<div class="more">
	<a href="/D4/RListServlet" class="button a">もっと見る</a>
	</div>
</div>

<div class="qf_ha qf">
<div class="qf">
	<h2>質問フォーム</h2>
	<form id="question" method="post" id = "question">
	    <textarea id = "question_text" name="question"  placeholder="1000字以内で入力してください" class="formta"></textarea>
		<div class="qsubmit">
	    <p class="sbutton"><input type="submit" name="submit" value="送信" class="button"></p>
		<p id="error_message" class="message">${result.message}</p>
		</div>
	</form>
</div>
<div class="ha">
	<!-- レベル別アノニくんの画像表示 -->
	<%-- <p class="h2">育成ptの説明</p> --%>
	<c:if test="${id.grow_point < 25}">
	<img src="/D4/img/home_anoni1.png" width="510px" alt="ホームアノニくんの画像1">
	</c:if>
	<c:if test="${25<= id.grow_point && id.grow_point < 75}">
	<img src="/D4/img/home_anoni2.png" width="500px" alt="ホームアノニくんの画像2">
	</c:if>
	<c:if test="${75<= id.grow_point && id.grow_point < 225}">
	<img src="/D4/img/home_anoni3.png" width="500px" alt="ホームアノニくんの画像3">
	</c:if>
	<c:if test="${225<= id.grow_point && id.grow_point < 400}">
	<img src="/D4/img/home_anoni4.png" width="500px" alt="ホームアノニくんの画像4">
	</c:if>
	<c:if test="${400<= id.grow_point}">
	<img src="/D4/img/home_anoni5.png" width="500px" alt="ホームアノニくんの画像5">
	</c:if>
	</div>
</div>
</main>
<footer>
    <p class="copyright">&copy; DIV</p>
</footer>
<script src="./js/home.js"></script>
</body>
</html>