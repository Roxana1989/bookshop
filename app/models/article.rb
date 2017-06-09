class Article < ApplicationRecord
  has_and_belongs_to_many :authors

  has_and_belongs_to_many :genres

  validates :name, presence: true

  scope :search_by_name, -> (name_query) { where 'name ~* ?', name_query }

  scope :search_by_genre, -> (genre_query) { joins(:genres).where 'genres.name ~* ?', genre_query }

  scope :search_by_author, -> (author_query) { joins(:authors).where 'authors.name ~* ?', author_query }

  scope :search_by_publisher, -> (publisher_query) { none } # This column doesn't exist in articles
end
