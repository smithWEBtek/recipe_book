$(() => {
	console.log("recipes.js loaded ...");
	ClickHandlers()

})

const ClickHandlers = () => {
	$(`.recipes`).on('click', (e) => {
		e.preventDefault()
		//history.pushState(null, null, "recipes")
		getRecipes()

	})
	$(document).on('click', ".show_link", function (e) {
		e.preventDefault()
		let id = $(this).attr('data-id')
		fetch(`/recipes/${id}.json`)
			.then(res => res.json())
			.then(recipe => {
				let newRecipe = new Recipe(recipe)
				let recipeHtml = newRecipe.formatShow()
				$('#app-container').append(recipeHtml)
			})
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


// class constructor function
class Recipe {
	constructor(recipeObj) {
		this.id = recipeObj.id
		this.title = recipeObj.title
		this.category = recipeObj.category
		this.directions = recipeObj.directions
		this.cook_time = recipeObj.cook_time
	}
}


//finish adding html for index markup of prototyping
Recipe.prototype.formatIndex = function () {
	let recipeHtml = `
	<a href= "/recipes/${this.id}" data-id="${this.id}" class="show_link"><h3>${this.title}</h3>
	`
	return recipeHtml
}
Recipe.prototype.formatShow = function () {
	let recipeHtml = `
	<a href= "/recipes/${this.id}/next" data-id="${this.id} " 

	`
	return recipeHtml
}

