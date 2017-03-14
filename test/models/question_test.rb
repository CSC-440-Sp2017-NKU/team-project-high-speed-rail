require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  
  test "should not save question without title" do
    question = Question.new(content: "blah blah blah")
    assert_not question.save
  end
  
  test "should not save question without content" do
    question = Question.new(title: "A fancy new question!")
    assert_not question.save
  end
  
  # test "the truth" do
  #   assert true
  # end
end
