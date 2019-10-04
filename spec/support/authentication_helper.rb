
module AuthenticationTestHelper
  def create_and_login(email, password)
    create_user(email, password)
    login_user(email, password)
  end

  private
  def create_user(email, password)
    User.create!(email: email, password: password)
  end

  def login_user(email, password)
    params = { email: email, password: password }
    post "/authenticate", { params: params, as: :json }
    response.body
  end
end
