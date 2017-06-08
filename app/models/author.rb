class Author < ApplicationRecord

  has_and_belongs_to_many :books
  has_and_belongs_to_many :articles

  scope :by_name, -> (name) { Author.where("name ~* ?", name) }

end
