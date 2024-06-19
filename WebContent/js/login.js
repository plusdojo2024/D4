// 入力エラー


let formObj = document.getElementById('login_form');
let errorMessageObj = document.getElementById('error_message');


// [ログイン]ボタンをクリックしたときの処理
formObj.onsubmit = function() {
  if (!formObj.mail.value || !formObj.password.value) {
    errorMessageObj.textContent = '入力内容が正しくありません。';
    return false;
  }
  errorMessageObj.textContent = null;
};