require_relative('quizmaster.rb')
require_relative('question.rb')
require_relative('player.rb')
require_relative('game.rb')

class Runner

  def initialize
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

  def play_game
    puts @game.next_turn
  end

end

game = Runner.new()

game.play_game
