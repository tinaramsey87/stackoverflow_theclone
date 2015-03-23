require 'rails_helper'

describe "the answer a question process" do
  it "adds an answer to a question" do
    question = Question.create(question: "What is 2 + 2 ?")
    visit question_path(question)
    fill_in "Answer", :with => "4"
    click_on "Answer"
    expect(page).to have_content "successfully"
  end
end

describe "the edit answer process" do
  it "updates an existing answer" do
    question = Question.create(question: "What is 2 + 2 ?")
    answer = question.answers.create(answer: "4")
    visit question_path(question)
    click_on "Edit answer"
    click_on "Update Answer"
    expect(page).to have_content "successfully"
  end
end

describe "the delete answer process" do
  it "deletes an existing answer" do
    question = Question.create(question: "What is 2 + 2 ?")
    answer = question.answers.create(answer: "4")
    visit question_path(question)
    click_on "Delete answer"
    :confirm
    expect(page).to have_content "successfully"
  end
end
