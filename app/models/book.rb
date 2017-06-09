class Book < ApplicationRecord
  belongs_to :publisher

  has_many :sorts

  has_and_belongs_to_many :authors

  has_and_belongs_to_many :genres

  scope :prime,     -> { where has_prime_length_of_name: true }

  scope :available, -> { where available: true }

  scope :search_by_name,      -> (name_query)      { where "name ~* ?", name_query }

  scope :search_by_publisher, -> (publisher_query) { joins(:publisher).where 'publishers.name ~* ?', publisher_query }

  scope :search_by_genre,     -> (genre_query)     { joins(:genres)   .where 'genres.name ~* ?',     genre_query }

  scope :search_by_author,    -> (author_query)    { joins(:authors)  .where 'authors.name ~* ?',    author_query }

  before_save :setup_has_prime_length_of_name

  private

  def setup_has_prime_length_of_name
    self.has_prime_length_of_name = Prime.prime? name.to_s.size
  end
end
