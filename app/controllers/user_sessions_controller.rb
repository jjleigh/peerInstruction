class UserSessionsController < ApplicationController
  skip_before_filter :require_login, except: [:destroy]

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password], params[:remember])
      redirect_back_or_to(:root )
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy 
      logout
      redirect_to(:root )
    end
  end

# put these back in the redirect 
  # notice: 'Logged out!'
  # notice: 'Login successful'