class List < ApplicationRecord
  has_many :books

  has_many :sorts
end
