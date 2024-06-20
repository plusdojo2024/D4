
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
            <input type="button" onclick="MoveCheck();" value="ログアウト" class="lobutton">
        </div>
    </div>
</header>

<nav>
	<ul class="menu">
        <li title="ホーム"><a href="/D4/HomeServlet" class="home">ホーム</a></li>

    <%-- <div class="menuli">質問</div> --%>
        <li title="質問一覧"><a href="/D4/QListServlet" class="qlist">一覧</a></li>
        <li title="質問をする"><a href="/D4/QFormServlet" class="que">質問をする</a></li>

    <%-- <div class="menuli">目安箱</div> --%>
        <li title="要望一覧"><a href="/D4/RListServlet" class="rlist">一覧</a></li>
        <li title="要望を送る"><a href="/D4/RFormServlet" class="req">要望を送る</a></li>

    <%-- <div class="menuli">育成：アノニくん</div> --%>
        <li title="アノニくんに会う"><a href="/D4/CharacterServlet" class="chara">アノニくんに会う</a></li>
        <li title="みんなの到達度"><a href="/D4/ReachedServlet" class="reach">みんなの到達度</a></li>

        <c:if test="${id.master_code == 1}">
        <li title="ユーザー登録"><a href="/D4/RegistServlet" class="regist">ユーザー登録</a></li>
        </c:if>
    </ul>
</nav>

<main>
<!-- ここにプログラムを記入 -->
    <div class="anonis">
        <div class="anoni">
 			<img src="/D4/img/anoni1.png" width=300px alt="アノニくん1">
			<p>
			現在<br>
			<strong class="cnt">${human[0]}人育成中</strong>
			</p>
		</div>
        <div class="anoni">
          <c:if test="${id.grow_point >= 25}">
 			<img src="/D4/img/anoni2.png" width=200px alt="アノニくん2">
 		  </c:if>
          <c:if test="${id.grow_point < 25}">
 			<img src="/D4/img/secret.png" width=200px alt="未到達です">
 		  </c:if>
			<p>
			現在<br>
			<strong class="cnt">${human[1]}人育成中</strong>
			</p>
		</div>
        <div class="anoni">
          <c:if test="${id.grow_point >= 75}">
 			<img src="/D4/img/anoni3.png" width=200px alt="アノニくん3">
 		  </c:if>
          <c:if test="${id.grow_point < 75}">
 			<img src="/D4/img/secret.png" width=200px alt="未到達です">
 		  </c:if>
			<p>
			現在<br>
			<strong class="cnt">${human[2]}人育成中</strong>
			</p>
		</div>
        <div class="anoni">
          <c:if test="${id.grow_point >= 225}">
 			<img src="/D4/img/anoni4.png" width=200px alt="アノニくん4">
 		  </c:if>
          <c:if test="${id.grow_point < 225}">
 			<img src="/D4/img/secret.png" width=200px alt="未到達です">
 		  </c:if>
			<p>
			現在<br>
			<strong class="cnt">${human[3]}人育成中</strong>
			</p>
		</div>
        <div class="anoni">
          <c:if test="${id.grow_point >= 400}">
 			<img src="/D4/img/anoni5.png" width=200px alt="アノニくん5">
 		  </c:if>
          <c:if test="${id.grow_point < 400}">
 			<img src="/D4/img/secret.png" width=200px alt="未到達です">
 		  </c:if>
			<p>
			現在<br>
			<strong class="cnt">${human[4]}人育成中</strong>
			</p>
		</div>
        <div class="anoni">
 			<img src="/D4/img/coming_soon.png" width=200px alt="coming soon...">
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