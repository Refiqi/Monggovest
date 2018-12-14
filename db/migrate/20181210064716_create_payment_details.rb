class CreatePaymentDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_details do |t|
      t.references :user_investor, foreign_key: true
      t.integer :payment_method
      t.string :card_number
      t.date :card_valid_date
      t.string :cvv
      t.boolean :isPaid

      t.timestamps
    end
  end
end
