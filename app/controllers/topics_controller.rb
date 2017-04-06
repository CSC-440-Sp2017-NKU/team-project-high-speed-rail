class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :destroy]
  
  acts_as_paranoid
  
  def show
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
      flash[:danger] = "Topic not created."
      redirect_to new_topic_path
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
