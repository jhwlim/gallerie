function addGalleryItem(article) {
	var gallery = document.getElementById('gallery');
	var galleryItem = document.createElement('div');
	galleryItem.className = 'gallery-item';
	galleryItem.dataset.id = article.id;
	gallery.append(galleryItem);
	
	if (article.imgPath == null) {
		article.imgPath = '';
	}
	var galleryImage = document.createElement('img');
	galleryImage.src = "/spring/image/article/" + article.imgPath + "/";
	galleryImage.className = 'gallery-image';
	galleryItem.appendChild(galleryImage);
	
	var galleryItemInfo = document.createElement('div');
	galleryItemInfo.className = 'gallery-item-info';
	galleryItem.appendChild(galleryItemInfo);
	
	var ul = document.createElement('ul');
	galleryItemInfo.appendChild(ul);
	
	var galleryItemLikes = document.createElement('li');
	galleryItemLikes.className = 'gallery-item-likes';
	galleryItemLikes.innerHTML = '<span class="visually-hidden">Likes:</span><i class="fas fa-heart" aria-hidden></i> ' + article.likeCount;
	ul.appendChild(galleryItemLikes);
	
	var galleryItemComments = document.createElement('li');
	galleryItemComments.className = 'gallery-item-comments';
	galleryItemComments.innerHTML = '<span class="visually-hidden">Comments:</span><i class="fas fa-comment" aria-hidden></i> ' + article.commentCount;
	ul.appendChild(galleryItemComments);
	
	return galleryItem;
}