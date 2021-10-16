class SessionsController < ApplicationController
  # GET /login
  def new
    
  end
  
  # POST / login
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  # DELETE /logout
  def destroy
    log_out
    redirect_to root_path
  end
  
  # root_url也可以都一样
end
