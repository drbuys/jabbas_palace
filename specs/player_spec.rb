require 'minitest/autorun'
require('minitest/rg')
require_relative('../quizmaster.rb')
require_relative('../question.rb')
require_relative('../player.rb')

class TestPlayer < MiniTest::Test

  def setup
    @player1 = Player.new('Han', :rogue)
    @player2 = Player.new('Darth Vader', :sith)
    end

  def test_check_player_name
    assert_equal('Han', @player1.name)
    assert_equal('Darth Vader', @player2.name)
  end

  def test_check_player_attribute
    assert_equal(:sith, @player2.attribute)
    assert_equal(:rogue, @player1.attribute)
  end

  def test_player_score_adds
    @player1.score += 1
    assert_equal(1, @player1.score)
  end

  def test_player_answer
    @player1.answer_question
    assert_equal("Im a Wookiee", @player1.player_answer)
  end

end
