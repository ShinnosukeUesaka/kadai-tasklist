class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    case login(email, password)
    when 0
      flash[:success] = 'ログイン成功'
      redirect_to @user
    when 1
      flash[:danger] = 'ユーザーが存在しません。'
      render :new
    when 2
      flash[:danger] = 'ユーザーが存在しません。' 
      render :new
    end 
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end
  
  private
  
  def login(email, password)
    @user = User.find_by(email: email)
    if @user
      if @user.authenticate(password)
        session[:user_id] = @user.id
        return 0
      else
        #wrong password
        return 1
      end
    else 
      #no account found
      return 2
    end
  end
end
