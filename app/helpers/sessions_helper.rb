module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end
  
  # 定义current_user存不存在
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
  
  def logged_in?
    # 如果是nil => False, 如果不是nil => true
    !current_user.nil?
  end
  
  def log_out
    # 和flash.now一样session也有method
    session.delete(:user_id)
    @current_user = nil
  end
  
  
end
