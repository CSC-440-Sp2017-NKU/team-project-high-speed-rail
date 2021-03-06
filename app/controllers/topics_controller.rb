class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :destroy]
  
  def show
    @questions = @topic.questions
  end
  
  def new
    authorize Topic
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    authorize @topic
    if @topic.save
      flash[:success] = "Topic created."
      redirect_to @topic
    else
      flash.now[:danger] = "Topic not created."
      render :new
    end
  end

  def destroy
    authorize @topic
    @topic.destroy
  end
  
  def index
    @topics = Topic.all
  end
  
  private 
  
    def set_topic
      @topic = Topic.find(params[:id])
    end
  
    def topic_params
      params.require(:topic).permit(:title)
    end
end
