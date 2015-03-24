require 'rails_helper'

describe "the answer a question process" do
  it "adds an answer to a question" do
    user = FactoryGirl.create(:user)
    visit questions_path
    click_on 'Log In'
    fill_in 'Name', :with => "example name"
    fill_in 'Password', :with => "password"
    click_on 'log in'
    question = user.questions.create({:question => "Why?"})
    visit question_path(question)
    fill_in "Answer", :with => "4"
    click_on "Answer"
    expect(page).to have_content "successfully"
  end
end

describe "the edit answer process" do
  it "updates an existing answer" do
    user = FactoryGirl.create(:user)
    visit questions_path
    click_on 'Log In'
    fill_in 'Name', :with => "example name"
    fill_in 'Password', :with => "password"
    click_on 'log in'
    question = user.questions.create({:question => "Why?"})
    visit question_path(question)
    answer = user.answers.create({:answer => "4"})
    click_on "Edit answer"
    click_on "Update Answer"
    expect(page).to have_content "successfully"
  end
end

describe "the delete answer process" do
  it "deletes an existing answer" do
    user = FactoryGirl.create(:user)
    question = FactoryGirl.create(:question)
    answer = question.answers.create(answer: "4")
    visit question_path(question)
    click_on "Delete answer"
    :confirm
    expect(page).to have_content "successfully"
  end
end
