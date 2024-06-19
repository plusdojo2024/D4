 // ログアウト時にアラート

function MoveCheck() {
	if(window.confirm('本当にログアウトしますか？')) {
		window.alert('またのご利用お待ちしております！');
		window.location.href = '/D4/LogoutServlet';
	}
	else {
	window.alert('ログアウトをやめました。');
	}
}

 //[登録]ボタンをクリックしたときの処理
	let formObj = document.getElementById('regist');
	let mailboxObj = document.getElementById('mail');
	let passwordboxObj = document.getElementById('password');
    let errorMessageObj = document.getElementById('error_message');
	if(formObj&&mailboxObj&&passwordboxObj&&errorMessageObj){
		formObj.onsubmit = function() {
			if(mailboxObj.value.length === 0 || mailboxObj.value.length > 100 || passwordboxObj.value.length === 0 || passwordboxObj.value.length >= 50) {
				errorMessageObj.textContent = '入力内容が正しくありません';
				return false;
			}
			errorMessageObj.textContent = null;
		};
	}