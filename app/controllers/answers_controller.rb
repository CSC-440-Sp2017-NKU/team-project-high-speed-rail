class AnswersController < ApplicationController
    
    def create
        @question = Question.find(params[:question_id])
        @answer = @question.answers.build(answer_params)
        
        if @answer.save
            respond_to do |format|
                format.html { redirect_to @question, notice: 'Answer was successfully added.' }
                format.js
            end
        else
            respond_to do |format|
                format.html { redirect_to @question, notice: 'Answer could not be added.' }
            end
        end
    end
    
    def update
        respond_to do |format|
        if @answer.update(answer_params)
            format.html { redirect_to @answer.question, notice: 'Answer was successfully updated.' }
        else
            format.html { redirect_to @answer.question, notice: 'Answer could not be updated.' }
        end
    end
    end
    
    def destroy
        @question = Question.find(params[:question_id])
        @answer = @question.answers.find(params[:id])
        @answer.destroy
        respond_to do |format|
            format.html { redirect_to @question, notice: 'Answer was successfully destroyed.' }
        end
    end
    
    private
    
        def answer_params
            params.require(:answer).permit(:content)
        end
    
end
