class Combo.Routers.Router extends Backbone.Router

	views: {}

	routes:
		"combinations/(:id)" : "show"

	show: (id) =>
		@views['view1'] = new Combo.Views.ComboPage
			el: '.build'
			model: new Combo.Models.ComboModel

	close: ->
		for k,view of @views
			view.close()