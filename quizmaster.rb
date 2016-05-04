class Quizmaster

  attr_accessor( :name, :question_set, :last_question_asked )

  def initialize(name, question_set)
    @question_set = question_set
    @name = name
    @last_question_asked = []
  end

  def ask_question
    @last_question_asked << @question_set.pop
    return @last_question_asked[0].question
  end

  def is_correct?(players_answer)
    if players_answer == @last_question_asked.pop.correct_answer
      return true
    else
      return false
    end
  end

  def decide_fate
  end

end
