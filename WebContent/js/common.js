
 //[質問送信]ボタンをクリックしたときの処理
 let formObj = document.getElementById('question');

formObj.onsubmit = function() {
	if(formObj.question.length === 0 || formObj.question.length > 1000) {
//		errorMessageObj.textContent = '※1～1000字で入力してください';
		alert('※1～1000字で入力してください');
		return false;
	}
	errorMessageObj.textContent = null;
};

//[回答送信]ボタンをクリックしたときの処理
 let formObj = document.getElementById('request');
 
formObj.onsubmit = function() {
	if(formObj.request.length === 0 || formObj.request.length > 1000) {
//		errorMessageObj.textContent = '※1～1000字で入力してください';
		alert('※1～1000字で入力してください');
		return false;
	}
	errorMessageObj.textContent = null;
};