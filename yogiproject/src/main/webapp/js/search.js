/**
 * 
 */
function submit() {
	document.submitForm.submit(); // Submits the form without the button
}



$(function() {
	var $likeBtn = $('.icon2.heart');

	$likeBtn
		.click(function() {
			$likeBtn.toggleClass('active');
			if ($likeBtn.hasClass('active')) {


				$(this)
					.find('img')
					.attr(
						{
							'src': 'https://cdn-icons-png.flaticon.com/512/803/803087.png',
							alt: '찜하기 완료'
						});
			} else {

				$("#like_frm").attr("action", "Like.de?cmd=dislike").submit()

				$(this).find('i').removeClass('fas').addClass('far')
				$(this)
					.find('img')
					.attr(
						{
							'src': 'https://cdn-icons-png.flaticon.com/512/812/812327.png',
							alt: "찜하기"
						})
			}
		})

	$.fn.call=function(text){
		console.log('calltest' + text);
	}

})


$(function() {
	var $likeBtn = $('.icon2.heart2');

	$likeBtn
		.click(function() {
			$likeBtn.toggleClass('active');
			if ($likeBtn.hasClass('active')) {


				$(this)
					.find('img')
					.attr(
						{
							'src': 'https://cdn-icons-png.flaticon.com/512/803/803087.png',
							alt: '찜하기 완료'
						});
			} else {

				$("#like_frm").attr("action", "Like.de?cmd=dislike").submit()

				$(this).find('i').removeClass('fas').addClass('far')
				$(this)
					.find('img')
					.attr(
						{
							'src': 'https://cdn-icons-png.flaticon.com/512/812/812327.png',
							alt: "찜하기"
						})
			}
		})

	function move(destname) {
		console.log('여기');
	}
})