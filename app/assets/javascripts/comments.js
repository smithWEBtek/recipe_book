$(() => {
	console.log('commentsjs loaded');
	CommentClickHandlers()

})

const CommentClickHandlers = () => {
	$('a.all_comments').on('click', (e) => {
		e.preventDefault()
		let url = e.target.href

		getComments(url)
	})

}

const getComments = (url) => {
	let newUrl = url + '.json'
	fetch(newUrl)
		.then(res => res.json()
			.then(comments => {
				$('#app-container').html('')
				comments.forEach((comment) => {
					console.log(comment)
					let newComment = new Comment(comment)
					let commentHtml = newComment.formatShow()
					$('#app-container').append(commentHtml)
				})
			})
		)
}

function Comment(comment) {
	this.id = comment.id
	this.title = comment.title
	this.content = comment.content
	this.user = comment.user
	this.recipe = comment.recipe.id
}

Comment.prototype.formatShow = function () {

	let commentHtml = `
		<h4> Comments: </h4>
	<a href= "/recipes/${this.recipe}/comments/${this.id}" data-id="${this.id}"
	<h5>${this.title}</h5><br>
	`
	return commentHtml
}