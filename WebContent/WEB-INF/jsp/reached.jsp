
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>アノニくん到達度一覧 | とくめぇ～</title>
<link rel="stylesheet" href="/D4/css/common.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.5.2/css/all.css">
<link rel="stylesheet" href="/D4/css/reached.css">
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
    <div class="anonis">
        <div class="anoni">
 			<img src="/D4/img/reached_anoni1.png" class="anoni_png" alt="アノニくん1">
			<p>
			<h2>現在<br>
			<strong class="cnt">${human[0]}人育成中</strong>
			</h2>
			</p>
		</div>
        <div class="anoni">
          <c:if test="${id.grow_point >= 25}">
 			<img src="/D4/img/reached_anoni2.png" class="anoni_png" alt="アノニくん2">
 		  </c:if>
          <c:if test="${id.grow_point < 25}">
 			<img src="/D4/img/secret.png" class="anoni_png" alt="未到達です">
 		  </c:if>
			<p>
			<h2>現在<br>
			<strong class="cnt">${human[1]}人育成中</strong>
			</h2>
			</p>
		</div>
        <div class="anoni">
          <c:if test="${id.grow_point >= 75}">
 			<img src="/D4/img/reached_anoni3.png" class="anoni_png" alt="アノニくん3">
 		  </c:if>
          <c:if test="${id.grow_point < 75}">
 			<img src="/D4/img/secret.png" class="anoni_png" alt="未到達です">
 		  </c:if>
			<p>
			<h2>現在<br>
			<strong class="cnt">${human[2]}人育成中</strong>
			</h2>
			</p>
		</div>
        <div class="anoni">
          <c:if test="${id.grow_point >= 225}">
 			<img src="/D4/img/reached_anoni4.png" class="anoni_png" alt="アノニくん4">
 		  </c:if>
          <c:if test="${id.grow_point < 225}">
 			<img src="/D4/img/secret.png" class="anoni_png" alt="未到達です">
 		  </c:if>
			<p>
			<h2>
			現在<br>
			<strong class="cnt">${human[3]}人育成中</strong>
			</h2>
			</p>
		</div>
        <div class="anoni">
          <c:if test="${id.grow_point >= 400}">
 			<img src="/D4/img/reached_anoni5.png" class="anoni_png" alt="アノニくん5">
 		  </c:if>
          <c:if test="${id.grow_point < 400}">
 			<img src="/D4/img/secret.png" class="anoni_png" alt="未到達です">
 		  </c:if>
			<p>
			<h2>
			現在<br>
			<strong class="cnt">${human[4]}人育成中</strong>
			</h2>
			</p>
		</div>
        <div class="anoni">
 			<img src="/D4/img/coming_soon.png" class="anoni_png" alt="coming soon...">
			<p><br>
			</p>
		</div>
    </div>



</main>
<footer>
    <p class="copyright">&copy; DIV</p>
</footer>
<script src="./js/reached.js"></script>
</body>
</html>