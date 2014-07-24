class UsersController < ApplicationController

  def new
  	@user = User.new 
  end

  def create
  	@user = User.new(user_params)

  	if @user.save 
  		redirect_to questions_url, :notice => "You have successfully signed up!"
  	else 
  		render 'new'
      flash.now[:alert] = "Sign up not successful"
  	end
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])

  	if @user.update_attributes(user_params)
  		redirect_to user_path(@user)
  	else
  		render 'edit'
  	end 
  end

  def show
  	@user = User.find(params[:id])
  end

  def destroy
  	@user = User.find(params[:id])
  	
  	@user.destroy
  end

  private 
	  def user_params
	  	params.require(:user).permit(:instructor, :name, :email, :password, :password_confirmation)
	  end
end
