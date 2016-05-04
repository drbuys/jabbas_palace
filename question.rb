class Question

attr_reader(:question, :answer, :correct_answer, :answers)

  def initialize(q_a_hash)
    @question = q_a_hash.keys[0]
    @answer = q_a_hash.values[0]
    @answers = q_a_hash.values
    @correct_answer = q_a_hash.values[0][0]
  end

end
