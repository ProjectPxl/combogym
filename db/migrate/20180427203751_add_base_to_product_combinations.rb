class AddBaseToProductCombinations < ActiveRecord::Migration[5.1]
  def change
    add_column :product_combinations, :base, :boolean, default: false
  end
end
