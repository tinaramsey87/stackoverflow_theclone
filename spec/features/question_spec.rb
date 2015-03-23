require "rails_helper"

describe " the add a question process" do
  it "adds a new question" do
      visit questions_path
      click_on 'Add question'
      fill_in 'Question', :with => 'Who did you pick?'
      click_on 'Create Question'
      expect(page).to have_content 'successfully'
  end
end

describe "the edit a question process" do
  it "updates an existing question" do
    question = Question.create(question: "Who did you pick?")
    visit question_path(question)
    click_on 'Edit question'
    click_on 'Update Question'
    expect(page).to have_content "successfully"
  end
end

describe "the delete question process" do
  it "deletes a question permanently" do
    question = Question.create(question: "Who did you pick?")
    visit question_path(question)
    click_on 'Delete question'
    :confirm
    expect(page).to have_content "successfully"
  end
end
