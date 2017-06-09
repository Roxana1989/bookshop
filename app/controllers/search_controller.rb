class SearchController < ApplicationController
  def index
    if Article.respond_to? method_name && Book.respond_to? method_name
      articles = Article.send method_name, params[:query]

      books    = Book.send    method_name, params[:query]

      render json: { articles: articles, books: books }
    else
      render json: { error: I18n.t('errors.search.wrong_parameters') }, status: 400
    end
  end

  private
  def method_name
    @method_name ||= "search_by_#{ params[:parameter] }"
  end
end
