module AuthenticationHelper
  # def sign_in(user)
  #   session[:user_id] = user.id
  # end

  def sign_in(user=nil)
    user ||= OpenStruct.new(id: 1)
    session[:user_id] = user.id
  end
end
