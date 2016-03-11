class LogoutController < ApplicationController
  def end

    #this clears the session when you click logout
    session[:user_name]=nil

    #we were able to test if the session cleared by doing 1/0 underneath and typing session[:user_name] in the console
    
  end
end
