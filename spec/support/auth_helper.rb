module AuthHelper

  def http_login(user = FactoryGirl.create(:user))
    email = user.email
    pw = user.password
    raise "Invalid password for #http_login" if pw.empty?
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(email,pw)
  end
end
