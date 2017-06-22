class Article < ApplicationRecord
  include Concerns::Nameble
  has_and_belongs_to_many :authors

  has_and_belongs_to_many :genres

  scope :search_by_publisher, Proc.new { none } # This column doesn't exist in articles

end
