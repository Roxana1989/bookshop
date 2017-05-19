class Book < ActiveRecord::Base

  require 'prime'

  has_and_belongs_to_many :authors
  has_and_belongs_to_many :genres
  belongs_to :publisher
  has_many :sorts

  scope :prime,     -> { where("length(name) IN (#{prime_array})") }
  scope :available, -> { where(available: true) }
  scope :search_by_name, -> (name_query) { where("name ~* ?", name_query) }
  scope :search_by_publisher, -> (publisher_query) { where(publisher_id: 
    Publisher.where("name ~* ?", publisher_query).pluck(:id)) }

  scope :search_by_genre, -> (genre_query) { joins(:genres).where(genres_books: 
    { genre_id: Genre.by_name(genre_query).pluck(:id) }) }

  scope :search_by_author, -> (author_query) { joins(:authors).where(authors_books: 
    { author_id: Author.by_name(author_query).pluck(:id) }) }

  private

  def self.name_max_length
    order('length(name) DESC').first.name.size
  end

  def self.prime_array
    primes = []
    (2...name_max_length+1).each do |num|
      primes << num if Prime.prime?(num)
    end
    primes.join(', ')
  end

end