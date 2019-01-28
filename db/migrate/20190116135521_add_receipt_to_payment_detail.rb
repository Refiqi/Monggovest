class AddReceiptToPaymentDetail < ActiveRecord::Migration[5.2]
  def change
    add_column :payment_details, :receipt, :integer
  end
end
