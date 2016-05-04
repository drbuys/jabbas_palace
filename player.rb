class Player

attr_accessor :name, :attribute, :score, :player_answer

  def initialize(name, attribute)
    @name = name
    @attribute = attribute
    @score = 0
    @player_answer = ""
  end

  def answer_question
    @player_answer = gets.chomp
    return @player_answer
  end

end
