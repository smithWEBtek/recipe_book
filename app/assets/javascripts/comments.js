$(() => {
	CommentClickHandlers()

})

const CommentClickHandlers = () => {
	$(`.all_comments`).on('click', (e) => {
		e.preventDefault()
		getComments()	
	})

}



const getComments = () => {
	let id = $(this).attr('data-id')
	console.log(id)
	fetch('/all_comments.json')
			.then(res => res.json())
			.then(comments => {
				$('#app-container').html('')
				comments.forEach((comment) => {
					console.log(comment)
					let newComment = new Comment(comment)
					let commentHtml = newComment.formatIndex()
					$('#app-container').append(commentHtml)
				
				})

			})
			

}

function Comment(comment){
	this.id = comment.id
	this.title = comment.title
	this.content = comment.content
	this.user = comment.user
}

Comment.prototype.formatShow = function(){
	let commentHtml = `
	<a href= "/recipes/${this.id}/comments" data-id="${this.id}" class="show_link"><h3>${this.title}</h3>

	<h5>${this.title}</h5>
	<h6>${this.content}<h/6>
	`
	return commentHtml
}