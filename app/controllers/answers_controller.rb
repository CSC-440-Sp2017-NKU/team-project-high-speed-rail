class AnswersController < ApplicationController
    before_action :set_answer, only: [:update, :destroy, :edit]
    
    def create
        authorize Answer
        
        @question = Question.find(params[:question_id])
        @answer = @question.answers.build(answer_params)
        @answer.user = current_user
        
        if @answer.save
            flash[:success] = 'Answer was added.'
            redirect_to @question
        else
            flash[:danger] = 'Answer could not be added.'
            redirect_to @question
        end
    end
    
    def update
        authorize @answer
        
        if @answer.update(answer_params)
            flash[:success] = "Answer was updated."
            redirect_to @answer.question
        else
            flash[:danger] = "Answer could not be updated."
            redirect_to @answer.question
        end
    end
    
    def destroy
        authorize @answer
        
        @question = @answer.question
        @answer.destroy
        flash[:success] = "Answer was destroyed."
        redirect_to @question
    end
    
    def edit
        
    end
    
    private
    
        # Use callbacks to share common setup or constraints between actions.
        def set_answer
            @answer = Answer.find(params[:id])
        end
    
        def answer_params
            params.require(:answer).permit(:content)
        end
    
end
