class WelcomeController < ApplicationController

  # we created an index as a default homepage
  def index

  end

# default register runs when the register button is clicked and post the information to the server, we use post instead of get so the information doesn't get put into the user URL
  def register

    if !User.find_by_name(params[:user_name]).nil?
       flash[:alert]= "User Name already taken, please choose another one"
       render 'index'
    else

      user = User.new

      if params[:user_name].strip.empty? || params[:password].strip.empty?
        # If user name and password, render index (ask user again)
        render 'index'
      else
        #its checks if the USER NAME has a key or is empty, and if it has a key, it converts to a string and saves it in the database through params
        user_name = params[:user_name].strip
        user.name = user_name
        password = params[:password].strip
        user.password = password

        if params.has_key?(:full_name) && !params[:full_name].strip.empty?
          full_name = params[:full_name].strip
          user.full_name = full_name
        end

        if params.has_key?(:address) && !params[:address].strip.empty?
          address = params[:address].strip
          user.address = address
        end

        if params.has_key?(:city) && !params[:city].strip.empty?
          city = params[:city].strip
          user.city = city
        end

        if params.has_key?(:postal) && !params[:postal].strip.empty?
          postal = params[:postal].strip
          user.postal = postal
        end

        if params.has_key?(:country) && !params[:country].strip.empty?
          country = params[:country].strip
          user.country = country
        end

        #email is linked to the migrate file
        #if nothing is inputed in the text box, then email = "null" and inputed into the database as null
        if params.has_key?(:email) && !params[:email].strip.empty?
          email = params[:email].strip
          user.email = email
        end

        # Saves user information to table users
        user.save



        if params.has_key?(:phone1) && !params[:phone1].strip.empty?
          phone1 = Phone.new
          phone1.number = params[:phone1].strip

          #we are shoveling the phone1 object we made into the merged table
          user.phones << phone1

          #we have to save it individually to the number column
          phone1.save
        end

        if params.has_key?(:phone2) && !params[:phone2].strip.empty?
          phone2 = Phone.new
          phone2.number = params[:phone2].strip
          user.phones << phone2

          phone2.save
        end

        if params.has_key?(:phone3) && !params[:phone3].strip.empty?
          phone3 = Phone.new
          phone3.number = params[:phone3].strip
          user.phones << phone3

          phone3.save
        end

        #we store the user name into a session so we can access it in the info controller
        session[:user_name] = user.name

        redirect_to "/info/display"
        # text: "User name is " + user.name


        #session[:user_id] = user.id.to_s
      end

    end

  end # end of register

end #end of class
