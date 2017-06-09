class BaseController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action -> { request.format = :json unless params[:format] }
end
