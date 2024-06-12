<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>アノニくん表示 | とくめぇ～</title>
</head>
<body>
<header>
    <div class="headers">
        <div class="header">アプリロゴ</div>
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

<!-- 次の段階まであと〇〇pt -->
<div>
次の段階まであと${e.grow_point}pt
</div>

<!-- 現在のポイント -->
<div>
現在${e.grow_point}pt
</div>

<!-- あなたのアノニくん -->
<p>
あなたのアノニくん<br>
  <c:if test="${e.growpoint < 25}">
	    <img src = "/D4/img/ jpg" alt = "第一段階">
  </c:if>
  <c:if test="${e.growpoint < 75}">
	    <img src = "/D4/img/ jpg" alt = "第二段階">
  </c:if>
  <c:if test="${e.growpoint < 225}">
	    <img src = "/D4/img/ jpg" alt = "第三段階">
  </c:if>
  <c:if test="${e.growpoint < 400}">
	    <img src = "/D4/img/ jpg" alt = "第四段階">
  </c:if>
  <c:if test="${e.growpoint >= 400}" alt = "第五段階">
	    <img src = "/D4/img/ jpg">
  </c:if>
</p>

</main>
<footer>
    <p class="copyright">&copy; DIV</p>
</footer>
</body>
</html>