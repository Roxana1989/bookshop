class SearchController < ApplicationController

  PARAMETERS = ["name", "author", "genre", "publisher"]

  def index
    parameter = params[:parameter]
    check_parameters(parameter, params[:query])
    method_name = "search_by_#{parameter}"
    articles = Article.send(method_name, params[:query])
    books = Book.send(method_name, params[:query])
    render json: {articles: articles, 
                  books:    books}
  rescue ArgumentError => error
    render status: 400, json: { error: error }
  end

  private
  
  def check_parameters(parameter, query)
    raise ArgumentError.new("You should pass parameters") unless (parameter && query)
    raise ArgumentError.new("Parameter should be one of #{PARAMETERS}") unless 
      PARAMETERS.include?(parameter)
  end

end
