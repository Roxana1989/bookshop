class Lists::BooksController < BaseController
  def index
    lists = Sort.with_discount_list.order(:position).limit 5

    render json: lists
  end
end
