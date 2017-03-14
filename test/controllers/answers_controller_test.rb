require 'test_helper'

class AnswersControllerTest < ActionDispatch::IntegrationTest
  
  test "should create answer" do
    @question = Question.create(title: "Test Title", content: "Some content")
    assert_difference('Answer.count') do      
      post question_answers_url(@question), params: { answer: { content: "Test content...", question_id: @question.id } }    
    end 
  end
  
  # test "the truth" do
  #   assert true
  # end
end
