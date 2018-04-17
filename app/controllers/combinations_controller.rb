class CombinationsController < ApplicationController

	def index
		@combinations = Combination.all
	end

	def show
		@combination = Combination.find params[:id]
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
