class PaymentDetail < ApplicationRecord
  belongs_to :user_investor
  enum payment_method: [{cc:"Kartu Kredit / Online Debit"}, 
                        {bank:"Tranfer Bank"}, {indomaret:"Indomaret"}, {alfamart:"Alfamart"}]
end
