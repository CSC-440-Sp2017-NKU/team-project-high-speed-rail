class StaticPagesController < ApplicationController
  def home
    @recent_questions = Question.order(created_at: :asc).limit(5)
    @recent_topics = Topic.order(created_at: :asc).limit(5)

  end
end
