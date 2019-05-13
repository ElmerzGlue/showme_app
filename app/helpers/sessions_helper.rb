module SessionsHelper
  def login (user)
    session[:id] = user.id
  end

  def current_user
    if @current_user.nil?
      @current_user = User.find_by(id: session[:id])
    else
      @current_user
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def logout
    session.delete(:id)
    @current_user = nil
  end
end
