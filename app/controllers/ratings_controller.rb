class RatingsController < ApplicationController
  
  before_action :set_answer, only: [:upvote, :downvote]
  
  def upvote
    @vote = @answer.ratings.build(is_liked: true)
    
    respond_to do |format|
      if @vote.save
        format.html { redirect_to @answer.question, notice: 'Upvoted answer.' }
      else
        format.html { redirect_to @answer.question, notice: 'Could not upvote the answer.' }
      end
    end
    
  end
  
  def downvote
    @vote = @answer.ratings.build(is_liked: false)
    
    respond_to do |format|
      if @vote.save
        format.html { redirect_to @answer.question, notice: 'Downvoted answer.' }
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
