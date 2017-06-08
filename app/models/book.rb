class Book < ApplicationRecord

  require 'prime'

  has_and_belongs_to_many :authors
  has_and_belongs_to_many :genres

  belongs_to :publisher

  has_many :sorts

  scope :prime,     -> { where('LENGTH(name) IN (?)', prime_array) }

  scope :available, -> { where(available: true) }

  scope :search_by_name, -> (name_query) { where("name ~* ?", name_query) }

  scope :search_by_publisher, -> (publisher_query) { joins(:publisher).where 'publishers.name ~* ?', publisher_query }

  scope :search_by_genre, -> (genre_query) { joins(:genres).where 'genres.name ~* ?', genre_query }

  scope :search_by_author, -> (author_query) { joins(:authors).where 'authors.name ~* ?', author_query }

  private

  def self.name_max_length
    maximum(:name)&.size.to_i + 1
  end

  def self.prime_array
    primes = []

    (2...name_max_length).each do |num|
      primes << num if Prime.prime?(num)
    end

    primes
  end

end
