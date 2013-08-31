class ApiController < ActionController::Base

 before_filter :set_per_page

  PER_PAGE = 50

  respond_to :json

  def set_per_page
    params[:per_page] ||= PER_PAGE
  end

  def per_page
    params[:per_page].to_i
  end

  def page
    (params[:page] || 1).to_i
  end

end
