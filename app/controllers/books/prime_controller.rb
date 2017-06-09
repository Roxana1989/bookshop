class Books::PrimeController < BaseController
  def index
    books = Book.prime

    render json: books
  end
end
