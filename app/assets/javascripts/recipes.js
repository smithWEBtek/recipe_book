$(() => {
	ClickHandlers()

})

const ClickHandlers = () => {
	$(`.your_recipes`).on('click', (e) => {
		e.preventDefault()
		//history.pushState(null, null, "recipes")
		getRecipes()
		
		})
	$(document).on('click', ".show_link", function(e) {
		e.preventDefault()
		let id = $(this).attr('data-id')
		console.log(id)
		console.log(this)
		fetch(`/recipes/${id}.json`)
		.then(res => res.json())
		.then(recipe => {
			let newRecipe = new Recipe(recipe)
			let recipeHtml = newRecipe.formatShow()
			$('#app-container').append(recipeHtml)		
		})
	})
	$(document).on('click', ".next-recipe", function(e){
				console.log('hi')
				e.preventDefault()
				let id = $(this).attr('data-id')
				console.log(this)
				fetch(`/recipes/${id}.json`)
				
			})
}



const getRecipes = () => {
	fetch('/your_recipes.json')
			.then(res => res.json())
			.then(recipes => {
				$('#app-container').html('')
				recipes.forEach((recipe) => {
					let newRecipe = new Recipe(recipe)
					let recipeHtml = newRecipe.formatIndex()
					$('#app-container').append(recipeHtml)
				
				})

			})
			

}

// constructor function
function Recipe(recipe){
	this.id = recipe.id
	this.title = recipe.title
	this.category = recipe.category
	this.directions = recipe.directions
	this.recipe_ingredients = recipe.recipe_ingredients
	this.cook_time = recipe.cook_time
	this.user = recipe.user
	this.comments = recipe.content
}

function Comment(comment){
	this.id = comment.id
	this.title = comment.title
	this.content = comment.content
	this.user = comment.user
}
//finish adding html for index markup of prototyping
Recipe.prototype.formatIndex = function(){
	let recipeHtml = `
	<a href= "/recipes/${this.id}" data-id="${this.id}" class="show_link"><h3>${this.title}</h3>
	`
	return recipeHtml
}
Recipe.prototype.formatShow = function(){
	let recipeHtml = `
	<h4>${this.title}</h4>

	<button class= "next-recipe">Next</button>
	`
	return recipeHtml
}

Comment.prototype.formatShow = function(){
	let commentHtml = `
	<h5>${this.title}</h5>
	<h6>${this.content}<h/6>
	`
	return commentHtml
}