
 //[質問送信]ボタンをクリックしたときの処理
	let formObj = document.getElementById('request');
	let textboxObj = document.getElementById('request_text');
    let errorMessageObj = document.getElementById('errorMessage');

	formObj.onsubmit = function() {
	if(textboxObj.value.length === 0 || textboxObj.value.length > 1000) {
	errorMessageObj.textContent = '※1～1000字で入力してください';
		// alert('※1～1000字で入力してください');
		return false;
	}
	errorMessageObj.textContent = null;
};

/*
//[要望送信]ボタンをクリックしたときの処理
	let formObj = document.getElementById('request');

	formObj.onsubmit = function() {
	if(formObj.request.length === 0 || formObj.request.length > 1000) {
//		errorMessageObj.textContent = '※1～1000字で入力してください';
		alert('※1～1000字で入力してください');
		return false;
	}
	errorMessageObj.textContent = null;
};
*/

/*
function Request(){
	if(window.confirm('送信してよろしいですか？')){ // 確認ダイアログを表示
		return true; // 「OK」時は送信を実行
	}
	else{ // 「キャンセル」時の処理
		window.alert('キャンセルされました'); // 警告ダイアログを表示
		event.preventDefault();; // 送信を中止
	}
}
*/

/*
//[回答送信]ボタンをクリックしたときの処理
	let formObj = document.getElementById('answer');

	formObj.onsubmit = function() {
	if(formObj.request.length === 0 || formObj.request.length > 1000) {
//		errorMessageObj.textContent = '※1～1000字で入力してください';
		alert('※1～1000字で入力してください');
		return false;
	}
	errorMessageObj.textContent = null;
};
*/

window.onload = function(){
	const moreload = document.getElementById("moreload");
	const more = document.getElementById("more");

//  if(moreload != null && more != null)的な
	if(moreload && more) {
		more.onclick = function(){
			const targetArray = document.querySelectorAll(".list_item.is-hidden");
			const length = targetArray.length;
			if(length <= 20) {
				more.style.display = "none";
			}
			for(let i = 0; (i < 20 && i < length); i++) {
				const target = targetArray[i];
				target.classList.remove("is-hidden");
			}
		};
		more.click();
	}
}
