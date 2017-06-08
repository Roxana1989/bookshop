class List < ApplicationRecord

  has_many :books
  has_many :sorts

  scope :discount,  -> { where("name ~* ?", 'discount') }

end
