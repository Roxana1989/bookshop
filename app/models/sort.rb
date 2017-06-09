class Sort < ApplicationRecord
  belongs_to :book

  belongs_to :list

  scope :with_discount_list, -> { joins(:list).where 'lists.name ~* ?', 'discount' }

  validates :position, numericality: { only_integer: true }, allow_nil: true

  validates :book, presence: true

  validates :list, presence: true
end
