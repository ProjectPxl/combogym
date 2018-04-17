class CreateProductCombinations < ActiveRecord::Migration[5.1]
  def change
    create_table :product_combinations do |t|
      t.integer :product_id
      t.integer :combination_id

      t.timestamps
    end
  end
end
