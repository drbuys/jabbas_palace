require 'minitest/autorun'
require('minitest/rg')
require_relative('../quizmaster.rb')
require_relative('../question.rb')
require_relative('../player.rb')
require_relative('../game.rb')

class TestGame < MiniTest::Test

  def setup
      @player1 = Player.new('Han', :rogue)
      @player2 = Player.new('Darth Vader', :sith)
      @players = [@player1, @player2]
      @question1 = Question.new( {"In how many languages is C-3P0 fluent?" => [ "6 million", "16 million"]} )
      @question2 = Question.new({"What is the Wookiee's home world" => ['Kashyyyk', 'Tatooine']})
      @question3 = Question.new({"How many Dewbacks were in the original 1977 theatrical cut of the first Star Wars movie?" => ['Two', 'Five']})
      # @questions = [@question1]
      @questions = [@question1, @question2, @question3]
      @jabba = Quizmaster.new('Jabba', @questions)
      @yoda = Quizmaster.new('Yoda', [])
      @quizmasters = [@jabba]
      @game = Game.new(@players, @quizmasters)

  end

  def test_check_number_of_players_in_game
    assert_equal(2, @game.number_of_players)
  end

  def test_check_number_of_quizmasters_in_game
    assert_equal(1, @game.quizmasters.length)
  end

  def test_name_of_quizmaster_in_game
    assert_equal('Jabba', @game.quizmaster.name)
  end

  def test_name_of_current_player
    assert_equal('Han', @game.current_player.name)
  end

  def test_name_of_next_player
    assert_equal('Darth Vader', @game.update_current_player.name)
  end

  def test_winner_of_game
     @player1.score = (3)
     @player2.score = (7)
     assert_equal('Darth Vader', @game.winner_is)
   end

  def test_winner_of_game_for_one
    @player2.score = (7)
    assert_equal('Darth Vader', @game.winner_is)
  end

  # def test_if_game_is_over_at_next_turn
  #   @player1.score = (3)
  #   @player2.score = (7)
  #   assert_equal( "Darth Vader", @game.next_turn)
  # end

  def test_next_turn
    puts @game.next_turn
    assert_equal( 1 , @game.current_player.score)
  end
end
