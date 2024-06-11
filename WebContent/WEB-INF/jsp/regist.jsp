<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登録フォーム | とくめぇ～</title>
</head>
<body>
<header>
    <div class="header">アプリロゴ</div>
</header>

	<main>
		<form id="regist" method="post" action="/simpleBC/RegistServlet">
			<p>
				<label>メールアドレス</label><br>
				<input type="text" name="mail">
			</p>
			<p>
				<label>パスワード</label><span> ※パスワードは50時まで使用可能です</span><br>
				<input type="password" name="pw">
			</p>
			<p class="submit">
				<input type="submit" name="submit" value="登録">
				<input type="reset" name="reset" value="リセット">
			</p>
			<p id="error_message"></p>
		</form>
	</main>

</body>
</html>