class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Account created successfully!"
    else
      flash[:alert] = "Sign-up failed!"
      render :new
    end
  end  

   # Display the account information for the logged-in user
   def edit
    @user = current_user
  end

  # Update account information
  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to edit_user_path, notice: "Account information updated successfully!"
    else
      flash[:alert] = "Failed to update account information. Please check the form and try again."
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
