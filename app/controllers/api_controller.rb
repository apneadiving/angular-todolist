class ApiController < ActionController::Base

  before_filter :restricted_area, except: :check_status

  respond_to :json

  def restricted_area
    render text: 'restricted_area', status: 401 unless current_user
  end

  def check_status
    if current_user
      render json: { status: 'ok', user: current_user }
    else
      render json: { status: 'error' }
    end
  end

end
