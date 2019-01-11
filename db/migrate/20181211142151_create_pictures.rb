class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.references :product, foreign_key: true
      t.string :photo

      t.timestamps
    end
  end
end
