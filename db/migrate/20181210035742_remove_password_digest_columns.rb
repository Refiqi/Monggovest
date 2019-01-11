class RemovePasswordDigestColumns < ActiveRecord::Migration[5.2]
  def change
    remove_columns :users, :password_digest
  end
end
