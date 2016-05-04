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
      @question4 = Question.new({"What were Luke's aunt and uncle's job on Tatooine?" => ['Moisture farmers', 'Prostitutes']})
      @question5 = Question.new({"Which species stole the plans to the Death Star?" => ['Bothans', 'Jedi']})
      @question6 = Question.new({"Which bounty hunter in The Empire Strikes Back is wearing an old costume from a Doctor Who episode?" => ['Bossk', 'Boba Fett']})
      @question7 = Question.new({"Who kissed Leia first?" => ['Luke', 'Han']})
      @question8 = Question.new({"What does AT-AT stand for?" => ['All Terrain Armored Transport', 'Fish-People']})
      @question9 = Question.new({"Who was the puppeteer that voiced Yoda?" => ['Frank Oz', "Jim Henson"]})
      @question10 = Question.new({"What was the original name of Return of the Jedi?" => ["Revenge of the Jedi", "The New Republic"]})
      @question11 = Question.new({"What's Princess Leia's last name?" => ["Organa", "Antilles"]})
      @question12 = Question.new({"While filming The Empire Strikes Back, which actor wasn't sure if they wanted to return for a third movie?" => ["Harrison Ford", "Mark Hamill"]})
      # @questions = [@question1]
      @questions = [@question1, @question2, @question3, @question4, @question5, @question6, @question7, @question8, @question9, @question10, @question11, @question12]
      @jabba = Quizmaster.new('Jabba', @questions)
      @yoda = Quizmaster.new('Yoda', @questions)
      @quizmasters = [@jabba]
      @game = Game.new(@players, @quizmasters)

  end

  def play_game
    puts @game.next_turn
  end

end

game = Runner.new()

game.play_game
