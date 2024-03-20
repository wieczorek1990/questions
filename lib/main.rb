# frozen_string_literal: true

require 'pp'

##
# Provides answers for questions
class QuestionsAnswersProvider
  attr_reader :questions, :answers

  def initialize(questions)
    @questions = questions
    @answers = {}
  end

  def pp_object(questions_provider)
    questions_provider.answers.each do |key, value|
      puts "#{key} => #{value}"
    end
  end

  def ask_loop
    first_try = true
    loop do
      if first_try
        print ' (y/n)'
        first_try = false
      else
        puts '(y/n)'
      end

      ask_result = STDIN.gets.chomp
      if ask_result == 'y'
        return true
      elsif ask_result == 'n'
        return false
      end
    end
  end

  def main
    puts 'Questions:'
    @questions.each do |question|
      print question
      ask_result = ask_loop
      @answers[question] = ask_result
    end
    puts 'Answers:'
    pretty_print self
  end
end

if __FILE__ == $PROGRAM_NAME
  questions_provider = QuestionsAnswersProvider.new(ARGV)
  questions_provider.main
end
