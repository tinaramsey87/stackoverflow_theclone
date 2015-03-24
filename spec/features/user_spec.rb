require 'rails_helper'

describe "the add a user process" do
  it "adds a new user" do
    visit questions_path
    click_on "Sign Up"
    fill_in 'Name', :with => "Mike"
    fill_in "Password", :with => "1233"
    fill_in "Password confirmation", :with => "1233"
    click_on 'Sign Up'
    expect(page).to have_content "successful"
  end
end

describe "the log in process" do
  it "logs a user in" do
    FactoryGirl.create(:user)
    visit questions_path
    click_on 'Log In'
    fill_in 'Name', :with => "example name"
    fill_in 'Password', :with => "password"
    click_on 'log in'
    expect(page).to have_content 'successful'
  end
end

describe "the log out process" do
  it "logs a user out" do
    FactoryGirl.create(:user)
    visit questions_path
    click_on 'Log In'
    fill_in 'Name', :with => "example name"
    fill_in 'Password', :with => "password"
    click_on 'log in'
    click_on 'Log Out'
    expect(page).to have_content 'successfully'
  end
end
