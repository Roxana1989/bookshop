class Sort < ApplicationRecord
  belongs_to :book

  belongs_to :list

  scope :with_discount_list, -> { joins(:list).where 'lists.name ~* ?', 'discount' }
end
