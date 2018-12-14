class CreateKecamatans < ActiveRecord::Migration[5.2]
  def change
    create_table :kecamatans do |t|
      t.references :regional, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
