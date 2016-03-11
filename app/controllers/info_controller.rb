class InfoController < ApplicationController
  def display

    #we take the session from user name and use it to find the USER information from the user table in our database. we then store it in our instance variable @user -> display.html.erb
    if !session[:user_name].nil?
      @user = User.find_by_name(session[:user_name])
    else
      redirect_to '/welcome/index'
    end

  end
end
