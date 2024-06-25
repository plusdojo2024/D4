
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登録フォーム | とくめぇ～</title>
<link rel="stylesheet" href="/D4/css/common.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.5.2/css/all.css">
<link rel="stylesheet" href="/D4/css/regist.css">
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
	  <c:if test="${id.master_code == 0}">
         	<h1>権限がありません。</h1>
      </c:if>
	  <c:if test="${id.master_code == 1}">
		<div>
		<h2>ユーザー登録</h2>
		<form id="regist" method="post" action="/D4/RegistServlet">
        <table>
            <tr>
                <td>
                    <label>
                        メールアドレス<br>
                        <input type="text" name="mail" id = "mail" class="formtext">
                    </label>
                </td>
            </tr>
            <tr>
                <td>
                    <label>
                        パスワード<span> ※パスワードは100字まで使用可能です</span><br>
                        <input type="password" name="password" id = "password" class="formtext">
                    </label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" name="submit" value="登録" class="button">
                    <input type="reset" name="reset" value="リセット" class="button">
                    <span id="error_message">
                    <a id ="result">${result.message}</a>
                    </span>
                </td>
            </tr>
        </table>

		</form>
		</div>
      </c:if>
	</main>

<footer>
    <p class="copyright">&copy; DIV</p>
</footer>
<script src="./js/regist.js"></script>
</body>
</html>