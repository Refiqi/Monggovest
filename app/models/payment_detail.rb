class PaymentDetail < ApplicationRecord
  belongs_to :user_investor
  enum payment_method: [:"Kartu Kredit / Online Debit", :"Transfer Bank", :"Indomaret", :"Alfamart"]
end
