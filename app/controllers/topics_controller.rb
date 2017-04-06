class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :destroy]
  
  def show
    @questions = @topic.questions
  end
  
  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      flash[:success] = "Topic created."
      redirect_to @topic
    else
      flash.now[:danger] = "Topic not created."
      render :new
    end
  end

  def destroy
    @topic.destroy
  end
  
  private 
  
    def set_topic
      @topic = Topic.find(params[:id])
    end
  
    def topic_params
      params.require(:topic).permit(:title)
    end
end
