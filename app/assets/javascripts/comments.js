$(() => {
	console.log('commentsjs loaded');
	CommentClickHandlers()
	listenForNewCommentClick()

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

const listenForNewCommentForm = () => {
	$('a.new_comment').on('click', (event) => {
		event.preventDefault()
		let url = event.target.href
		newCommentForm(url)
	})
}

function newCommentForm(url) {
	$.ajax({
		url: url,
		method: 'get'
	}).done(function (data) {
		// console.log("this should be an an HTML form: ", data);
		$('div#comment_form').html(data)
	})
}

class Comment {
	constructor(commentObj) {
		this.id = commentObj.id
		this.title = commentObj.title
		this.content = commentObj.content
		this.user = commentObj.user
		this.recipe = commentObj.recipe.id
	}
}
Comment.prototype.formatShow = function () {

	let commentHtml = `
	<a href= "/recipes/${this.recipe}/comments/${this.id}" data-id="${this.id}"
	<h5>${this.title}</h5><br>
	`
	return commentHtml
}