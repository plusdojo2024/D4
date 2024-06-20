
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン | とくめぇ～</title>
<link rel="stylesheet" href="/D4/css/common.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.5.2/css/all.css">
<link rel="stylesheet" href="/D4/css/login.css">
</head>
<body>
<header>
    <div class="headers">
        <div class="logo">
		  <a href="/D4/HomeServlet"><img src="/D4/img/icon.png" alt="アプリロゴ"></a>
        </div>
    </div>
</header>
<main>
	<div>
    <h2>ログイン</h2>
    <form id="login_form" method="post" action="/D4/LoginServlet">
        <table>
            <tr>
                <td>
                    <label>
                        メールアドレス<br>
                        <input type="text" name="mail" class="formtext">
                    </label>
                </td>
            </tr>
            <tr>
                <td>
                    <label>
                        パスワード<br>
                        <input type="password" name="password" class="formtext">
                    </label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" name="submit" value="ログイン" class="button">
                    <input type="reset" name="reset" value="リセット">
                    <span id="error_message">
                  <%-- <a id ="result">${result.message}</a> --%>
                    </span>
                </td>
            </tr>
        </table>
    </form>
    </div>
</main>
<footer>
    <p class="copyright">&copy; DIV</p>
</footer>

<script src="./js/login.js"></script>

</body>
</html>