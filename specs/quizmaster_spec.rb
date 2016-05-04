require 'minitest/autorun'
require('minitest/rg')
require_relative('../quizmaster.rb')
require_relative('../question.rb')

class TestQuizmaster < MiniTest::Test

  def setup
    @question1 = Question.new( {"In how many languages is C-3P0 fluent?" => [ "6 million", "16 million"]} )
    @question2 = Question.new({"What is the Wookiee's home world" => ['Kashyyyk', 'Tatooine']})
    @question3 = Question.new({"How many Dewbacks were in the original 1977 theatrical cut of the first Star Wars movie?" => ['Two', 'Five']})
    @questions = [@question1, @question2, @question3]
    @jabba = Quizmaster.new('Jabba', @questions)
  end

  def test_jabba_has_question_set
    assert_equal(3, @jabba.question_set.length)
  end

  def test_jabbas_name_is_jabba
    assert_equal("Jabba", @jabba.name)
  end

  def test_jabba_question_2_question
    assert_equal("What is the Wookiee's home world", @jabba.question_set[1].question)
  end

  def test_jabba_question_3_correct_answer
    assert_equal('Two', @jabba.question_set[2].correct_answer)
  end

  def test_jabba_ask_question
    assert_equal("How many Dewbacks were in the original 1977 theatrical cut of the first Star Wars movie?",@jabba.ask_question)
  end

  def test_player_gives_correct_answer
    @jabba.ask_question
    assert_equal(true, @jabba.is_correct?("Two"))
  end

end
