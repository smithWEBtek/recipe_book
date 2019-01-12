$(() => {
	console.log('commentsjs loaded');
	CommentClickHandlers()
	listenForNewCommentForm()
	listenForCreateComment()	


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
        $('div#comment_form').html(data)
        listenForCreateComment()
    })
}

const listenForCreateComment = () => {
	$('input').on("click", (event) => {
		event.preventDefault()
		let url = event.target.href
		console.log("listen for submit")
		submitCommentForm()

	})
}
function submitCommentForm(url) {
	debugger
	$.ajax({
		url:url,
		method: 'post',
		data: {
			'comment':{
				'title': $("#comment_title").value(),
				'content': $("#comment_content").value(),
			}
		}
	}).done(function (data) {
		$('#ajax_form').html(data)
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