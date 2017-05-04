class RatingsController < ApplicationController
  
  before_action :set_answer, only: [:upvote, :downvote]
  
  def upvote
    @vote = @answer.ratings.build(is_liked: true)
    @vote.user = @answer.user
    
    authorize @vote
    
    respond_to do |format|
      if @vote.save
        format.html { redirect_to @answer.question, notice: 'Upvoted Answer' }
      else
        format.html { redirect_to @answer.question, notice: 'Could not upvote the answer.' }
      end
    end
    
  end
  
  def downvote
    @vote = @answer.ratings.build(is_liked: false)
    @vote.user = current_user
    
    authorize @vote
    
    respond_to do |format|
      if @vote.save
        format.html { redirect_to @answer.question, notice: 'Downvoted Answer' }
      else
        format.html { redirect_to @answer.question, notice: 'Could not downvote the answer.' }
      end
    end
  end
  
  private
  
    def set_answer
      @answer = Answer.find(params[:id])
    end
  
end
