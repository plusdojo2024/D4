<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>アノニくん表示 | とくめぇ～</title>
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

<!-- 次の段階まであと〇〇pt -->
<div>
次の段階まであと${next_point}pt
</div>

<!-- 現在のポイント -->
<div>
現在${id.grow_point}pt
</div>

<!-- あなたのアノニくん -->
<p>
あなたのアノニくん<br>
  <c:if test="${id.grow_point < 25}">
	    <img src = "/D4/img/anoni1.png" width=900px alt = "第一段階">
  </c:if>
  <c:if test="${25 <= id.grow_point && id.grow_point < 75}">
	    <img src = "/D4/img/anoni2.png" width=370px alt = "第二段階">
  </c:if>
  <c:if test="${75 <= id.grow_point && id.grow_point < 225}">
	    <img src = "/D4/img/anoni3.png" width=370px alt = "第三段階">
  </c:if>
  <c:if test="${225 <= id.grow_point && id.grow_point < 400}">
	    <img src = "/D4/img/anoni4.png" width=370px alt = "第四段階">
  </c:if>
  <c:if test="${id.grow_point >= 400}">
	    <img src = "/D4/img/anoni5.png" width=370px alt = "第五段階">
  </c:if>
</p>

</main>
<footer>
    <p class="copyright">&copy; DIV</p>
</footer>
<script src="./js/character.js"></script>
</body>
</html>