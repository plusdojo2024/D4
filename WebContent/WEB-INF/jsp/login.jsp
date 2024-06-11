<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン | とくめぇ～</title>
</head>
<body>
<header>
	<div class="logo">
		<img src="/D4/img/logo.png" alt="アプリロゴ">
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
                        <input type="text" name="id">
                    </label>
                </td>
            </tr>
            <tr>
                <td>
                    <label>
                        パスワード<br>
                        <input type="password" name="pw">
                    </label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" name="submit" value="ログイン">
                    <input type="reset" name="reset" value="リセット">
                    <span id="error_message"></span>
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