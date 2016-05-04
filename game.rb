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
      puts "#{@current_player.name}, its your turn"
      puts @quizmaster.ask_question
      puts "#{@current_player.name}, please enter your answer. \nYour choices are: #{@quizmaster.question_set.answers}"
      answer = @current_player.answer_question
      if @quizmaster.is_correct?(answer)
        puts "Well done #{@current_player.name}, you got it right!"
        @current_player.score += 1
      else
        puts "The Rancor is hungry..."
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
        else
          return @players[1].name
        end
      end
  end



end
