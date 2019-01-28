class PaymentDetail < ApplicationRecord

  # associations table
  belongs_to :user_investor
  has_one :product_invest, through: :user_investor
  has_one :product, through: :product_invest

  # to transform integer input to string when showed in form

  enum payment_method: [:"Kartu Kredit / Online Debit", :"Transfer Bank", :"Indomaret", :"Alfamart"]

end
