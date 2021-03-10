
function createArticleItems() {
	articleItems = document.createElement('div');
	articleItems.classList.add('article__items');
	return articleItems;
}
function createArticleItem(width, src) {
	articleItem = document.createElement('div');
	articleItem.classList.add('article__item');
	articleItem.style.width = width;
	
	articleImage = document.createElement('img');
	articleImage.classList.add('article__image');
	articleImage.src = src;
	articleItem.appendChild(articleImage);
	return articleItem;
}
function createArticlePrevBtn() {
	articleBtn = document.createElement('figure');
	articleBtn.classList.add('article__btn', 'article__btn--prev');
	
	btnImage = document.createElement('img');
	btnImage.classList.add('article__btn-image');
	btnImage.src = '/spring/resources/image/static/prev_btn.png';
	articleBtn.appendChild(btnImage);
	return articleBtn;
}
function createArticleNextBtn() {
	articleBtn = document.createElement('figure');
	articleBtn.classList.add('article__btn', 'article__btn--next');
	
	btnImage = document.createElement('img');
	btnImage.classList.add('article__btn-image');
	btnImage.src = '/spring/resources/image/static/next_btn.png';
	articleBtn.appendChild(btnImage);
	return articleBtn;
}
function createCommentItem(comment, isLogined) {
	var listComment = document.createElement('div');
	listComment.classList.add('listComment');
	
	var commentEl = document.createElement('div');
	commentEl.classList.add('comment');
	listComment.appendChild(commentEl);
	
	var profile = document.createElement('div');
	profile.classList.add('comment__profile');
	commentEl.appendChild(profile);
	
	var img = document.createElement('img');
	img.src = '/spring/image/profile/' + comment.imgPath + '/';
	img.classList.add('comment__image');
	profile.appendChild(img);
	
	var text = document.createElement('div');
	text.classList.add('comment__text');
	commentEl.appendChild(text);
	
	var writer = document.createElement('div');
	writer.classList.add('comment__writer');
	writer.innerHTML = comment.writerId;
	text.appendChild(writer);
	
	var div = document.createElement('div');
	div.innerHTML = comment.content;
	text.appendChild(div);
	
	var dateSpan = document.createElement('span');
	dateSpan.classList.add('comment__date');
	dateSpan.innerHTML = comment.writeDate;
	text.appendChild(dateSpan);
	
	if (isLogined) {
		var btn = document.createElement('button');
		btn.name = "commentDeleteBtn";
		btn.dataset.id = comment.id;
		btn.innerHTML = 'delete';
		text.appendChild(btn);
	}
	
	return listComment;
}