class CreateSliders < ActiveRecord::Migration[5.2]
  def change
    create_table :sliders do |t|
      t.string :name
      t.string :image
      t.string :url
      t.integer :sort_number
      t.boolean :isActive, default: true

      t.timestamps
    end
  end
end
