<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>アノニくん表示 | とくめぇ～</title>
</head>
<body>
<header>
    <div class="headers">
        <div class="logo">
		  <img src="/D4/img/icon.png" alt="アプリロゴ">
        </div>
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
	    <img src = "/D4/img/anoni1.png" alt = "第一段階">
  </c:if>
  <c:if test="${25 <= id.grow_point && id.grow_point < 75}">
	    <img src = "/D4/img/anoni2.png" alt = "第二段階">
  </c:if>
  <c:if test="${75 <= id.grow_point && id.grow_point < 225}">
	    <img src = "/D4/img/anoni3.png" alt = "第三段階">
  </c:if>
  <c:if test="${225 <= id.grow_point && id.grow_point < 400}">
	    <img src = "/D4/img/anoni4.png" alt = "第四段階">
  </c:if>
  <c:if test="${id.grow_point >= 400}">
	    <img src = "/D4/img/anoni5.png" alt = "第五段階">
  </c:if>
</p>

</main>
<footer>
    <p class="copyright">&copy; DIV</p>
</footer>
</body>
</html>