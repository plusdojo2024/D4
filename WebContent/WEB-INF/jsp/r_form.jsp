
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>目安箱フォーム | とくめぇ～</title>
<link rel="stylesheet" href="/D4/css/common.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.5.2/css/all.css">
<link rel="stylesheet" href="/D4/css/r_form.css">
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
<!-- 宛先指定 -->
<form id="request" method="post" action="/D4/RFormServlet">

<p>
<div class="address">
<h2>宛先指定</h2><br>
</div>
<select name = "address_order" class="order">
  <option value = "all">全体</option>
  <option value = "keiri">経理部</option>
  <option value = "soumu">総務部</option>
  <option value = "jinji">人事部</option>
</select>
</p>

<!-- 要望フォーム -->
<p>
  <textarea id ="request_text" name="request_text" rows="5" cols="100" placeholder="1000字以内で入力してください" ></textarea>
</p>

<!-- 送信ボタン -->
<input type = "submit" name="submit" value="送信" class="submit">

<!-- エラーメッセージ -->
<span id="error_message">
</span>
</form>
</main>
<footer>
    <p class="copyright">&copy; DIV</p>
</footer>
<script src="./js/r_form.js"></script>
</body>
</html>