class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])

    # If the user exists AND the password entered is correct.
<<<<<<< HEAD
  # if user = User.authenticate_with_credentials(params[:email], params[:password])
=======
    if user && user.authenticate(params[:password])
    # if user = User.authenticate_with_credentials(params[:email], params[:password])

>>>>>>> master
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      if user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to '/signup'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # success logic, log them in
    else
      # failure, render login form
    end
  end

end