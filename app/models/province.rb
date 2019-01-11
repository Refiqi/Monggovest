class Province < ApplicationRecord
  has_many :regionals, dependent: false
  has_many :subdistricts, :through => :regionals
end
