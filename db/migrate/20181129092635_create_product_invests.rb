class CreateProductInvests < ActiveRecord::Migration[5.2]
  def change
    create_table :product_invests do |t|
      t.references :product, foreign_key: true
      t.float :price
      t.integer :slot

      t.timestamps
    end
  end
end
