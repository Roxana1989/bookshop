class ArticlesController < BaseController
  def index
    articles = Article.all

    render json: articles
  end
end
