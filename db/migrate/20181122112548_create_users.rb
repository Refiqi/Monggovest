# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false, unique: true
      t.string :email, null: false, index: true, unique: true
      t.string :password_digest
      t.string :role, null: false, default: 'user'
      t.datetime :last_login

      t.timestamps
    end
  end
end
