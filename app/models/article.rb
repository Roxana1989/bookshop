class Article < ApplicationRecord
  has_and_belongs_to_many :authors

  has_and_belongs_to_many :genres

  scope :search_by_name,      -> (query) { where 'name ~* ?', query }

  scope :search_by_genre,     -> (query) { joins(:genres) .where 'genres.name ~* ?',  query }

  scope :search_by_author,    -> (query) { joins(:authors).where 'authors.name ~* ?', query }

  scope :search_by_publisher, -> (query) { none } # This column doesn't exist in articles
end
