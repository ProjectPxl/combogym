class Combination < ApplicationRecord
	has_many :product_combinations
  has_many :products, :through => :product_combinations
end
