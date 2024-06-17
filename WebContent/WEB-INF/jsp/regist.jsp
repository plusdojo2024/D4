<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登録フォーム | とくめぇ～</title>
</head>
<body>
<header>
	<div class="logo">
		<img src="/D4/img/icon.png" alt="アプリロゴ">
    </div>
</header>

	<main>
		<form id="regist" method="post" action="/D4/RegistServlet">
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
                        パスワード<span> ※パスワードは50字まで使用可能です</span><br>
                        <input type="password" name="password">
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

</body>
</html>