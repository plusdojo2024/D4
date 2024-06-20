
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登録フォーム | とくめぇ～</title>
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


	<main>
		<form id="regist" method="post" action="/D4/RegistServlet">
        <table>
            <tr>
                <td>
                    <label>
                        メールアドレス<br>
                        <input type="text" name="mail" id = "mail">
                    </label>
                </td>
            </tr>
            <tr>
                <td>
                    <label>
                        パスワード<span> ※パスワードは50字まで使用可能です</span><br>
                        <input type="password" name="password" id = "password">
                    </label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" name="submit" value="登録">
                    <input type="reset" name="reset" value="リセット">
                    <span id="error_message">
                    <a id ="result">${result.message}</a>
                    </span>
                </td>
            </tr>
        </table>

		</form>
	</main>
<footer>
    <p class="copyright">&copy; DIV</p>
</footer>
<script src="./js/regist.js"></script>
</body>
</html>