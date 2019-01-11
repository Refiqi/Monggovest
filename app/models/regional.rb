class Regional < ApplicationRecord
  belongs_to :province
  has_many :subdistricts, dependent: false
end
