<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>目安箱フォーム | とくめぇ～</title>
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
<!-- 宛先指定 -->
<p>
宛先指定<br>
<select name = "addressOrder">
  <option value = "keiri">経理部</option>
  <option value = "soumu">総務部</option>
  <option value = "jinji">人事部</option>
</select>
</p>

<!-- 要望フォーム -->
<p>
要望フォーム<br>
<input type ="text" name = "requestForm" placeholder = "1～1000字で入力してください">
</p>

<!-- 送信ボタン -->
<input type = "submit">

<!-- エラーメッセージ -->
<span id="errorMassage"></span>

</main>
<footer>
    <p class="copyright">&copy; DIV</p>
</footer>
</body>
</html>