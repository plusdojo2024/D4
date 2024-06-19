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

// 追加読み込み機能

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
