class BaseController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :setup_default_format

  private
  def setup_default_format
    request.format = :json unless params[:format].present?
  end
end
