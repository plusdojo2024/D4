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


 //[質問送信]ボタンをクリックしたときの処理
	let formObj = document.getElementById('question');
	let textboxObj = document.getElementById('question_text');
    let errorMessageObj = document.getElementById('error_message');
	if(formObj&&textboxObj&&errorMessageObj){
		formObj.onsubmit = function() {
			if(textboxObj.value.length === 0 || textboxObj.value.length > 1000) {
				errorMessageObj.textContent = '※1～1000字で入力してください';
				// alert('※1～1000字で入力してください');
				return false;
			}
			errorMessageObj.textContent = null;
		};
	}
