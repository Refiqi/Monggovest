class CreateProductInvestDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :product_invest_details do |t|
      t.references :product_invest, foreign_key: true
      t.text :description
      t.integer :period
      t.float :return_value
      t.integer :share_periode
      t.text :background
      t.integer :count_view, default: 0

      t.timestamps
    end
  end
end
