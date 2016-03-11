#this is the rspec file that tests the features on our index.html.erb file

require 'rails_helper'

RSpec.feature "UserRegistrations", type: :feature do

    # Story: As an internet user, I can go to the registration from and register, which will take me to a confirmation page.

    describe "Index Page" do
      it "contains 'Welcome' on the homepage, and user enters Username and Password and user clicks register to confirmation page" do
        visit "/"
        expect(page).to have_content("Welcome")
        fill_in "user_name", with: "Josh"
        fill_in "password", with:"hello"
        click_button "Register"
        expect(page).to have_content("Registration Info")
        end

    # Story: As an registered user, I can login into the web site by providing user ID and password. If log in is successful, I am taken to a page saying "Hello <user ID>".

    describe "Login Page" do
      it "contains 'Login' on the login page, and user enters User Name and Password and user clicks Submit and it says " do
        visit "/"
        fill_in "user_name", with: "Josh"
        fill_in "password", with:"hello"

        click_button "Register"
        click_button "Logout"
        click_button "Home Page"
        click_button "Login"

        expect(page).to have_content("Login")
        fill_in "user_name", with: "Josh"
        fill_in "password", with:"hello"
        click_button "Submit"
        expect(page).to have_content("Registration Info")
        end

    # Story: As an registered user, I can login into the web site. If log in is successful, I am taken to a page showing my registration information, with the exception of the password.
    describe "Display Info Page" do
      it "contains registration info without the password" do
        visit "/"
        fill_in "user_name", with: "Josh"
        fill_in "password", with:"hello"

        click_button "Register"
        click_button "Logout"
        click_button "Home Page"
        click_button "Login"

        fill_in "user_name", with: "Josh"
        fill_in "password", with:"hello"
        click_button "Submit"
        expect(page).to have_content("Hello Josh!")
        end

    # Story: As an registered user, I can login into the web site. If log in is fails, I am taken back to the log in page.

    # Story: As an registered user, I can login into the web site. If log in is fails, I am taken to the log in page which now also contains the text "Log in failed, try again".

    # Story: As an internet user, I cannot register with a user ID that is already in use. If the user ID is taken, I am taken back to the registration page, which now also contains the text "User ID taken, try another".

    # Story: As a logged in user, I can go to a page and log out.



      end
    end
  end
end
