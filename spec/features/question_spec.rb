require "rails_helper"

describe " the add a question process" do
  it "adds a new question" do
      FactoryGirl.create(:user)
      visit questions_path
      click_on 'Log In'
      fill_in 'Name', :with => "example name"
      fill_in 'Password', :with => "password"
      click_on 'log in'
      click_on 'Add question'
      fill_in 'Question', :with => 'Who did you pick?'
      click_on 'Create Question'
      expect(page).to have_content 'successfully'
  end
end

describe "the edit a question process" do
  it "updates an existing question" do
    user = FactoryGirl.create(:user)
    visit questions_path
    click_on 'Log In'
    fill_in 'Name', :with => "example name"
    fill_in 'Password', :with => "password"
    click_on 'log in'
    question = user.questions.create({:question => "Why?"})
    visit question_path(question)
    click_on 'Edit question'
    click_on 'Update Question'
    expect(page).to have_content "successfully"
  end
end

describe "the delete question process" do
  it "deletes a question permanently" do
    user = FactoryGirl.create(:user)
    visit questions_path
    click_on 'Log In'
    fill_in 'Name', :with => "example name"
    fill_in 'Password', :with => "password"
    click_on 'log in'
    question = FactoryGirl.create(:question, user: user)
    visit question_path(question)
    click_on 'Delete question'
    :confirm
    expect(page).to have_content "successfully"
  end
end
