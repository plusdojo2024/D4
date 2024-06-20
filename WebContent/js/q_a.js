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


 //[更新]ボタンをクリックしたときの処理
	let formObj1 = document.getElementById('update_text');
	let textboxObj1 = document.getElementById('question_text');
    let errorMessageObj1 = document.getElementById('update');
	if(formObj1&&textboxObj1&&errorMessageObj1){
		formObj1.onsubmit = function() {
			if(textboxObj1.value.length === 0 || textboxObj1.value.length > 1000) {
				errorMessageObj1.textContent = '※1～1000字で入力してください';
				// alert('※1～1000字で入力してください');
				return false;
			}
			errorMessageObj1.textContent = null;
		};
	}

 //[回答する]ボタンをクリックしたときの処理
	let formObj2 = document.getElementById('answer');
	let textboxObj2 = document.getElementById('answer_text');
    let errorMessageObj2 = document.getElementById('error_message');
	if(formObj2&&textboxObj2&&errorMessageObj2){
		formObj2.onsubmit = function() {
			if(textboxObj2.value.length === 0 || textboxObj2.value.length > 1000) {
				errorMessageObj2.textContent = '※1～1000字で入力してください';
				// alert('※1～1000字で入力してください');
				return false;
			}
			errorMessageObj2.textContent = null;
		};
	}

