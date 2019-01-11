class CreateProvinces < ActiveRecord::Migration[5.2]
  # frozen_string_literal: true
  def change
    create_table :provinces do |t|
      t.string :name

      t.timestamps
    end
  end
end
