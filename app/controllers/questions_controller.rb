class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.new(question_params)
    if @question.save
      flash[:notice] = "Your have successfully added a question!"
      redirect_to questions_path
    else
      flash[:alert] = "There were some problems adding your question."
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
     @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = "Question successfully updated"
      redirect_to question_path
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:alert] = "Question was destroyed successfully"
    redirect_to questions_path
  end

  private
    def question_params
      params.require(:question).permit(:question)
    end
end
