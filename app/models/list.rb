class List < ActiveRecord::Base

  has_many :books
  has_many :sorts

  scope :discount,  -> { where("name ~* ?", 'discount') }

end