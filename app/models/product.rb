class Product < ApplicationRecord
	has_many :product_combinations
  has_many :combinations, :through => :product_combinations
end
