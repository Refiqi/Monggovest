class CreateSubdistricts < ActiveRecord::Migration[5.2]
  # frozen_string_literal: true
  def change
    create_table :subdistricts do |t|
      t.references :regional, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
