class CombinationsController < ApplicationController

	def index
		@combinations = Combination.all
	end

	def show
		@combination = Combination.find params[:id]
		@output = {}
		gon.base = {}
		@combination.products.select('products.*, product_combinations.base').each do |p|
			
			@output[ p.category.name ] ||= {}
			@output[ p.category.name ][p.name] = p
			if p.base? 
				gon.base[p.name] = {
					id: p.id,
					displayName: p.display_name,
					price: "250"
				}
			end

		end
	end

	def new
		@combination = Combination.new
	end

	def create
		@combination = Combination.new(combination_params)
		if @combination.save
			redirect_to @combination
		else
			render :new
		end
	end

	def combination_params
		params.require(:combination).permit(:name, product_ids:[])
	end

end
