class AddCardHolderNameToPaymentDetail < ActiveRecord::Migration[5.2]
  def change
    add_column :payment_details, :card_holder_name, :string
  end
end
