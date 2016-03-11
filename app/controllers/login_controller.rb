class LoginController < ApplicationController

  def login
  end

  def submit

    #we are seeing if the username is not not in the database
    if !User.find_by_name(params[:user_name]).nil? &&
      !User.find_by_password(params[:password]).nil?
      #we take in a user name in the text box (params) and then we store it in the session to appear in the info/display page
      session[:user_name] = params[:user_name]

      redirect_to '/info/display'
    else
      flash[:alert]= "Log in failed, try again"
      render '/login/login'
    end



  end
end
