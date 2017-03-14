require 'test_helper'

class AnswersControllerTest < ActionDispatch::IntegrationTest

  test "should create answer" do 
   @question = Question.create(title: "Test Title", content: "Some content")
   assert_difference('Answer.count') do      
   post question_answers_url(@question), params: { answer: { content: "Test content...", question_id: @question.id } }    
   end 
  end
  
  test "should update answer" do
   @question = Question.create(title: "Test Title", content: "Some content")
   @answer = @question.answers.create(content: "Hello!", question_id: @question.id)
   patch question_answer_url(question_id: @question, id: @answer), params: {answer: { content: "New content!"} }
   assert_response :found
   assert_redirected_to question_url(@question)
  end
  
 test "should destroy answer" do
   @question = Question.create(title: "Test Title", content: "Some content")
   @answer = @question.answers.create(content: "Hello!", question_id: @question.id)
    assert_difference('Answer.count', -1) do
      delete question_answer_url(question_id: @question, id: @answer)
    end
 end
  
end
