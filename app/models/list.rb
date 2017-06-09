class List < ApplicationRecord
  has_many :books

  has_many :sorts

  validates :name, presence: true
end
