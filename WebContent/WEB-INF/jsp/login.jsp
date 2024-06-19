
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン | とくめぇ～</title>
</head>
<body>
<header>
	<div class="logo">
		  <a href="/D4/HomeServlet"><img src="/D4/img/icon.png" alt="アプリロゴ"></a>
    </div>
</header>
<main>
    <h2>ログイン</h2>
    <form id="login_form" method="post" action="/D4/LoginServlet">
        <table>
            <tr>
                <td>
                    <label>
                        メールアドレス<br>
                        <input type="text" name="mail">
                    </label>
                </td>
            </tr>
            <tr>
                <td>
                    <label>
                        パスワード<br>
                        <input type="password" name="password">
                    </label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" name="submit" value="ログイン">
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
</body>
</html>