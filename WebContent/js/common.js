/*
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
*/

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
			const targetArray = document.querySelectorAll("list_item.is-hidden");
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


//もっと見るボタンを押したときの処理
//ここには、表示するリストの数を指定
	var moreNum = 20;

//表示するリストの数以降のリストを隠す
	$('.r_list_item:nth-child(n + ' + (moreNum + 1) + ')').addClass('is-hidden');

//全てのリストを表示したら「もっとみる」ボタンをフェードアウトします。
	$('.more').on('click', function() {
	  $('.r_list_item.is-hidden').slice(0, moreNum).removeClass('is-hidden');
	  if ($('.r_list a.is-hidden').length == 0) {
	    $('.more').fadeOut();
	  }
	});

/* リストの数が、表示するリストの数以下だった場合、「もっとみる」ボタンを非表示にします。
$(function() {
  var list = $(".list li").length;  
    if (list < moreNum) {
      $('.list-btn').addClass('is-btn-hidden');
  }
});
*/
	