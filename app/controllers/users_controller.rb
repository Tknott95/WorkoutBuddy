class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      @user.needs_verification!
      session[:user_id] = @user.id
      redirect_to root_path,
        notice: "Thank you for signing up #{@user.first_name.titlecase}"
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:user_id])
  end


  private

  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :email, :password, :password_confirmation
    )
  end
end
