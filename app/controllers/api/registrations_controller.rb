class Api::RegistrationsController < ::Devise::RegistrationsController
  respond_to :json

  # POST /resource
  def create
    build_resource(sign_up_params)

    if resource.save
      sign_up(resource_name, resource)
      render json: { status: 'ok', user: resource }
    else
      clean_up_passwords resource
      render json: { status: 'error' }
    end
  end

end
