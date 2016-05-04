require 'minitest/autorun'
require('minitest/rg')
require_relative('../question.rb')

class TestQuestions < MiniTest::Test

  def setup
    @question1 = Question.new( {"In how many languages is C-3P0 fluent?" => [ "6 million", "16 million"]} )
  end

  def test_question_has_question()
    assert_equal("In how many languages is C-3P0 fluent?", @question1.question)
  end

  def test_question_has_answer()
    assert_equal([ "6 million", "16 million"], @question1.answer)
  end

  def test_question_has_correct_answer()
    assert_equal( "6 million", @question1.correct_answer)
  end

end
