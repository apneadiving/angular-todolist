class Api::SessionsController < ::Devise::SessionsController

  respond_to :json

  # POST /resource/sign_in
  def create
    self.resource = warden.authenticate(auth_options)
    render json: { status: 'error' } and return unless resource

    sign_in(resource_name, resource)
    render json: { status: 'ok', user: resource }
  end

  # DELETE /resource/sign_out
  def destroy
    redirect_path = after_sign_out_path_for(resource_name)
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    render json: { status: 'ok' }
  end

end
