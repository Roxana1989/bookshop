module Concerns
  module Nameble
    extend ActiveSupport::Concern

    included do

      scope :search_by_name,      -> (query) { where 'name ~* ?', query }

      scope :search_by_genre,     -> (query) { joins(:genres) .where 'genres.name ~* ?',  query }

      scope :search_by_author,    -> (query) { joins(:authors).where 'authors.name ~* ?', query }

    end

  end
end