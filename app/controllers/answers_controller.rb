class AnswersController < ApplicationController
  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @answer = current_user.answers.new(answer_params)
    @answer.question_id = params[:question_id]
    @question = Question.find(params[:question_id])
    @user = User.find(@question.user_id)
    if @answer.save
      UserMailer.question_answered(@user).deliver_now
      flash[:message] = "Your question has been answered!"

      flash[:notice] = "You have successfully submitted your answer"
      redirect_to question_path(@question)
    else
      flash[:alert] = "There were some problems submitting your answer"
      render :new
    end
  end

  def edit
    @question = Question.find(params[:question_id])
    @answer = current_user.answers.find(params[:id])
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = current_user.answers.find(params[:id])
    if @answer.update(answer_params)
      flash[:notice] = "Your answer was updated successfully"
      redirect_to question_path(@question)
    else
      flash[:alert] = "There were some problems submitting your answer"
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    flash[:alert] = "Answer was destroyed successfully"
    redirect_to question_path(@question)
  end

  private
    def answer_params
      params.require(:answer).permit(:answer, :question_id, :user_id)
    end
end
