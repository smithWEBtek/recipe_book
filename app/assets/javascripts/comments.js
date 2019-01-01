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
	// let id = $(this).attr('data-id')
	// console.log(id)


	// recipes/1/comments.json

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
}

Comment.prototype.formatShow = function () {
	let commentHtml = `
	<a href= "/recipes/${this.id}/comments" data-id="${this.id}" class="show_link"><h3>${this.title}</h3>

	<h5>${this.title}</h5>
	<h6>${this.content}<h/6>
	`
	return commentHtml
}