class CreateRegionals < ActiveRecord::Migration[5.2]
  def change
    create_table :regionals do |t|
      t.references :province, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
