class StaticPagesController < ApplicationController
  
  def home
    @recent_questions = Question.order(created_at: :asc).limit(5)
    @recent_topics = Topic.order(created_at: :asc).limit(5)
  end
  
  def search
    @query = params[:search]
    @results = Question.where("title LIKE ? OR content LIKE ?", "%#{@query}%", "%#{@query}%")
  end
  
end
