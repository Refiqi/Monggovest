class ChangeColName < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :username, :name
  end
end
