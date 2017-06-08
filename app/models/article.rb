class Article < ApplicationRecord

  has_and_belongs_to_many :authors
  has_and_belongs_to_many :genres

  scope :search_by_name, -> (name_query) { where("name ~* ?", name_query) }

  scope :search_by_genre, -> (genre_query) { joins(:genres).where(genres_articles:
    { genre_id: Genre.by_name(genre_query).pluck(:id) }) }

  scope :search_by_author, -> (author_query) { joins(:authors).where(articles_authors:
    { author_id: Author.by_name(author_query).pluck(:id) }) }

  scope :search_by_publisher, -> (publisher_query) { [] } # This column doesn't exist in articles

end
