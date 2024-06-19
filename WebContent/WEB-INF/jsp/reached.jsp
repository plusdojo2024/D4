
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>アノニくん到達度一覧 | とくめぇ～</title>
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
    <div class="anonis">
        <div class="anoni">
 			<img src="/D4/img/anoni1.png" width=300px alt="アノニくん1">
			<p>
			現在<br>
			<strong>${human[0]}人育成中</strong>
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
			<strong>${human[1]}人育成中</strong>
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
			<strong>${human[2]}人育成中</strong>
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
			<strong>${human[3]}人育成中</strong>
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
			<strong>${human[4]}人育成中</strong>
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