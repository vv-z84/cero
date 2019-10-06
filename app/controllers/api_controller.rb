class ApiController < ApplicationController
  before_action :authenticate_request
  before_action :ensure_json_request
  protect_from_forgery with: :null_session

  private
  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not authorized' }, status: 401 unless @current_user
  end

  def ensure_json_request  
    return if request.format == :json
    head 406  
  end
end