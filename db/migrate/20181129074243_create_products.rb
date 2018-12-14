class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :kecamatan, foreign_key: true
      t.references :product_type, foreign_key: true
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end
