
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
    token = AuthenticateUser.call(email, password).result
  end
end
