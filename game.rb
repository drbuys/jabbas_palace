class Game

  attr_accessor :players, :quizmasters, :quizmaster, :current_player

  def initialize(players, quizmasters)
    @players = players
    @quizmasters = quizmasters
    @quizmaster = @quizmasters[0]
    @current_player = players[0]
  end

  def number_of_players
    return @players.length
  end

  def update_current_player
    @current_player = @players.rotate![0]
  end

  def next_turn
    if @quizmaster.question_set.length == 0
      return winner_is
    else
      puts "\n#{@current_player.name}, its your turn"
      puts "\n#{@quizmaster.name}: #{@quizmaster.ask_question}"
      puts "\n#{@current_player.name}, please enter your answer. Your choices are: '#{@quizmaster.last_question_asked[0].answers[0]}', or '#{@quizmaster.last_question_asked[0].answers[1]}'"
      answer = @current_player.answer_question
      if @quizmaster.is_correct?(answer)
        puts "Well done #{@current_player.name}, you got it right!"
        puts "\n ---------------------------"
        @current_player.score += 1
      else
        puts "The Rancor is hungry..."
        puts "\n ^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      end
    end
    update_current_player
    next_turn
  end


  def winner_is
      if @players.length == 1
        return @current_player.name
      else
        if @players[0].score > @players[1].score
          return @players[0].name
        elsif @players[0].score == @players[1].score
          for x in @players
            return x.name if x.attribute == :sith
          end
        else
          puts "#{@players[0].name}, your score is: #{@players[0].score}"
          puts "#{@players[1].name}, your score is: #{@players[1].score}"
          puts "#{@players[1].name} is the winner!"
        end
      end
  end



end
