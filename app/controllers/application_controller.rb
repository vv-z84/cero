class ApplicationController < ActionController::Base
  before_action :authenticate_request
  attr_reader :current_user
  protect_from_forgery with: :null_session
  
  def index
      
  end
  
  private
  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not authorized' }, status: 401 unless @current_user
  end
end
