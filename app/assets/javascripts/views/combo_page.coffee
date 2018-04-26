class Combo.Views.ComboPage extends Backbone.View

	template: JST['summary_item']

	@comboImageName: null

	events:
		'click .js-category-item' : 'toggleCategoryItem'

	initialize: ->
		@listenTo @model, 'change',  @updateCombo

		# @model.set
		# 	"Rack 1" : "300"

	updateCombo: (model) ->
		@setImageName(model)
		@updateSummary(model)

	toggleCategoryItem: (event) ->
		$item 			= $(event.target)
		name  			= $item.data('item-name')
		id  				= $item.data('item-id')
		displayName = $item.data('item-display-name')
		price			  = $item.data('item-price')

		$item.toggleClass('is-active')
		if @model.has name
			@model.unset name
		else
			@model.set
				"#{name}":
					id: id
					displayName: displayName 
					price: price

	setImageName: (model) ->
		@comboImageName = model.keys().sort().join("_") + '.png'
		@$el.find('.demo').text @comboImageName

	updateSummary: (model) ->
		@$el.find('.summary-list').text('')

		_.each model.attributes, (item) =>
			@$el.find('.summary-list').append @template(item: item) 

