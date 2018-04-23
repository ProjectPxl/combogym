class ProductsController < ApplicationController
	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to @product
		else
			render :new
		end
	end

	def product_params
		params.require(:product).permit(:name, :display_name, :category_id)
	end
end
