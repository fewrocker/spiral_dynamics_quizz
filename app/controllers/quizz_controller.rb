class QuizzController < ApplicationController
  def question
    # Pick question according to user proress
    @question = Question.find_by(number: current_user.progress + 1)
    # Save the question nature to render the correct view for the question
    @question_nature = @question.nature


    # Question type: mchoice or ranking
    if @question_nature == 'mchoice' || @question_nature == 'ranking'
      # Randomize options order
      @options_scramble = @question.options.shuffle
      # --> Save the order of the options as a string to be sent on a hidden form field
      # Initiate empty array
      @options_order = []
      # Populate the array with the original indexes of the options
      @options_scramble.each do |option|
        @options_order << @question.options.index(option)
      end
      # Turn the array into a string
      @options_order = @options_order.join
      # --------------------------------------------------------------------------
    end
  end

  def answer
    # Initiate answer basic parameters
    ans = Answer.new
    ans.question = Question.find_by(number: params[:question_number])
    ans.user = current_user

    # --> Compute answer according to question type and answer
    # If question type is ranking
    if ans.question.nature == 'ranking'
      raise
    end

    # If question type is mchoice, the answer is the option corrected by the scramble effect
    if ans.question.nature == 'mchoice'
      ans.text = params[:options_order][params[:answer_selected].to_i]
    end

    # Register the answer
    ans.save

    # Increase user progress
    ans.user.progress += 1
    ans.user.save

    # Go to next question
    redirect_to quizz_path
  end
end
