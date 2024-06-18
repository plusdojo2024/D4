
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

//もっと見るボタンを押したときの処理
	var moreNum = 20;
	$('.r_list a:nth-child(n + ' + (moreNum + 1) + ')').addClass('is-hidden');
	$('.more').on('click', function() {
	  $('.r_list a.is-hidden').slice(0, moreNum).removeClass('is-hidden');
	  if ($('.r_list a.is-hidden').length == 0) {
	    $('.more').fadeOut();
	  }
	});
	
	
	
	