$(() => {
	ClickHandlers()

})

// Ally check out this function...
const ClickHandlers = () => {
	$(`.recipes`).on('click', (e) => {
		e.preventDefault()
		//history.pushState(null, null, "recipes")
		getRecipes()

	})
	$(document).on('click', ".show_link", function (e) {
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
	$(document).on('click', '.next_recipe', function (e) {
		let id = $(this).attr('data-id')
		console.log(id)
		fetch(`/recipes/${id}/next.json`)

	})
}



const getRecipes = () => {
	fetch('/recipes.json')
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
function Recipe(recipe) {
	this.id = recipe.id
	this.title = recipe.title
	this.category = recipe.category
	this.directions = recipe.directions
	this.cook_time = recipe.cook_time
}


//finish adding html for index markup of prototyping
Recipe.prototype.formatIndex = function () {
	let recipeHtml = `
	<a href= "/recipes/${this.id}/comments" data-id="${this.id}" class="show_link"><h3>${this.title}</h3>
	`
	console.log(this)
	console.log(recipeHtml)
	return recipeHtml
}
Recipe.prototype.formatShow = function () {
	let recipeHtml = `
	<a href= "/recipes/${this.id}/comments" data-id="${this.id}" 

	<button class= "next_recipe">${this.title} Comments</button>
	`
	return recipeHtml
}

