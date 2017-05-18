class ListsController < ApplicationController

  def index 
    lists = Sort.where(list_id: List.discount.pluck(:id)).order(:position).limit(5)
    render json: lists
  end

end