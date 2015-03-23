class UserMailer < ActionMailer::Base
  default from: "StackOverflow Clone"

  def question_answered(user)
    @user = user
    mail to: user.name, subject: "Question Answered"
  end
end
