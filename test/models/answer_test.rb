require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  
  setup do
    @question = Question.create(title: "Wow", content: "Here's some content.")
  end
  
  test "should not save question without content" do
    answer = @question.answers.build()
    assert_not answer.save
  end
  
  # test "the truth" do
  #   assert true
  # end
  
end
