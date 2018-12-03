class QuizzController < ApplicationController
  def question
    # Go to result if quizz is complete
    if current_user.progress == Question.all.length
      redirect_to result_path
    else

      # Pick question according to user proress
      @question = Question.find_by(number: current_user.progress + 1)
      # Save the question nature to render the correct view for the question
      @question_nature = @question.nature


      # Question type: mchoice or ranking
      if @question_nature == 'mchoice'
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
      elsif @question_nature == 'ranking'
        # Randomize options order
        @options_scramble = @question.options.shuffle
        # --> Save the order of the options as a string to be sent on a hidden form field
        # Initiate empty array
        @options_order_index = []
        # Populate the array with the original indexes of the options
        @options_scramble.each do |option|
          @options_order_index << @question.options.index(option)
        end
        # Turn the array into a string, considering all indexes as a 2 char string, with 0 at the left if index is one-digit
        # This is done to create a pattern between ruby and javascript to interpret the answer correctly in pairs of chars
        # Since "111" could be interpreted as 1 and then 11, or 11 and then 1. The string "0111" eliminates this issue
        @options_order = ""
        @options_order_index.each do |index|
          @options_order += "0" if index >= 0 && index < 10
          @options_order += index.to_s
        # --------------------------------------------------------------------------
        end

      elsif @question_nature == 'statement'
        @questions = []
        @questions << @question
        # Include 3 more questions with the picked question
        3.times do
          @questions << Question.find_by(number: @questions.last.number + 1)
        end
      end
    end
  end

  def answer

    if current_user.progress == Question.all.length
      redirect_to result_path
    else

      # Initiate answer basic parameters
      ans = Answer.new
      ans.question = Question.find_by(number: params[:question_number])
      # Obs.: if question type is statements (comes in 4 at a time), the question_number will be of the first question
      # Just so the controller can understand that the questions will come in 4s, which will be treated later
      ans.user = current_user

      # --> Compute answer according to question type and answer
      # If question type is ranking
      if ans.question.nature == 'ranking'

        # Get the order that the default sentences were sent to the question render
        original_order = []
        params[:options_order].scan(/.{1,2}/).each do |pair|
          original_order << pair.to_i
        end

        # Get the order that the user placed all items on the shuffled list
        answer_order = []
        params[:ranking_order].scan(/.{1,2}/).each do |pair|
          answer_order << pair.to_i
        end

        # Combine the two lists to get the order the user placed all items of the original sentence list
        corrected_order = []
        answer_order.each do |value|
          corrected_order << original_order[value]
        end

        # Transform into a string to be interpreted in the result calculation
        ans.text = ""
        corrected_order.each do |value|
          ans.text += "0" if value >= 0 && value < 10
          ans.text += value.to_s
        end

        # Register the answer
        ans.save

      # If question type is mchoice, the answer is the option corrected by the scramble effect
      elsif ans.question.nature == 'mchoice'
        # Transform into a string to be interpreted in the result calculation
        ans.text = params[:options_order][params[:answer_selected].to_i]

        # Register the answer
        ans.save

      # If question type is statement, save all the answers from the 4 questions
      elsif ans.question.nature == 'statement'
        # Include the three other questions
        ans2 = Answer.new
        ans2.question = Question.find_by(number: (params[:question_number].to_i + 1))
        ans2.user = current_user
        ans3 = Answer.new
        ans3.question = Question.find_by(number: (params[:question_number].to_i + 2))
        ans3.user = current_user
        ans4 = Answer.new
        ans4.question = Question.find_by(number: (params[:question_number].to_i + 3))
        ans4.user = current_user

        # Input the answers
        ans.text = params[:answer_one]
        ans2.text = params[:answer_two]
        ans3.text = params[:answer_three]
        ans4.text = params[:answer_four]

        # Save all answers
        ans.save
        ans2.save
        ans3.save
        ans4.save
      end

      # Increase user progress
      ans.user.progress += 1
      # If question type is statement, each page comes with 4 questions at a time
      ans.user.progress += 3 if ans.question.nature == 'statement'
      # Save the user progress into the database
      ans.user.save

      # Go to next question or go to result page if quizz is completed
      if current_user.progress != Question.all.length
        redirect_to quizz_path
      else
        redirect_to result_path
      end
    end

  end

  def result
    if current_user.progress != Question.all.length
      redirect_to quizz_path
    else

      # Define the user which the score will be calculated
      user = current_user

      # Initialize all scores as 0 (floating point since some scores will be floating points)
      score = [0.to_f, 0.to_f, 0.to_f, 0.to_f]

      score_per_mchoice = 1
      score_ranking_12 = [2, 1.6, 1.2, 0.8, 0.4, 0, 0, -0.4, -0.8, -1.2, -1.6, -2]
      score_ranking_8 = [2, 1.2, 0.6, 0, 0, -0.6, -1.2, -2]
      score_statement = [-1, -0.5, 0, 0.5, 1]

      # --> Scoring multiple choice questions
      # Get all answers from user which question is of nature mchoice
      answers_to_score = Answer.all.select { |answer| answer.user == user && answer.question.nature == 'mchoice' }
      # Give points to the corresponding color based on the answer (0 blue, 1 orange, 2 green, 3 yellow)
      answers_to_score.each do |answer|
        score[answer.text.to_i] += score_per_mchoice
      end

      # --> Scoring ranking questions
      # Get all answers from user which question is of nature ranking
      answers_to_score = Answer.all.select { |answer| answer.user == user && answer.question.nature == 'ranking' }
      # Get each question
      answers_to_score.each do |answer|
        # Separate the ans.text string into the order of elements as integers
        ordered_options = answer.text.scan(/.{1,2}/).map { |el| el.to_i }
        # Build the arrays corresponding to what options are related to what colors based on number of statements
        # The lines below give blue = [0,1] orange = [1,2] green = [3,4] yellow = [5,6] for 8 items and
        # blue = [0,1,2] orange = [3,4,5] green = [6,7,8] yellow = [9,10,11] for 12 items
        span = ordered_options.length / 4
        blue_ranking = (0 * span .. 0 * span + (span - 1)).to_a
        orange_ranking = (1 * span .. 1 * span + (span - 1)).to_a
        green_ranking = (2 * span .. 2 * span + (span - 1)).to_a
        yellow_ranking = (3 * span .. 3 * span + (span - 1)).to_a
        # For each element on the answer text elements, give score according to position on array and corresponding color
        ordered_options.each do |option|
          # Place all possible groups into an array
          all_groups = [blue_ranking, orange_ranking, green_ranking, yellow_ranking]
          # Set the desired group as the index of the group that contains the index
          desired_group = all_groups.index(all_groups.select { |group| group.include?(option) }[0])
          # Give the points according to the scoring array and the position of the element in the ordered_options and no of options
          if ordered_options.length == 8
            score[desired_group] += score_ranking_8[ordered_options.index(option)]
          else
            score[desired_group] += score_ranking_12[ordered_options.index(option)]
          end
        end
      end

      # --> Scoring statement questions
      # Get all answers from user which question is of nature statement
      answers_to_score = Answer.all.select { |answer| answer.user == user && answer.question.nature == 'statement' }
      # Iterate through each answer
      answers_to_score.each do |answer|
        # Build the array to translate question.text into the color group
        translate_colors = ['blue', 'orange', 'green', 'yellow']

        # Give points according to the scoring to the correct color (given by the question.text attribute) and the picked option
        desired_group = translate_colors.index(answer.question.text)
        score[desired_group] += score_statement[answer.text.to_i]
      end

      @result = score.map { |sc| sc.round(2) }

      # A 100% resonance occurs when score = max_result
      # Negative and positive resonance have different max since there is more positive points than negative in the quizz
      max_result_pos = 25
      max_result_neg = 15
      # Start the result_resonance array to be populated
      @result_resonance = []

      @result.each do |scr|
        # The resonance is given by score/max_result. It is negative when score is negative, positive if score is positive
        # Therefore, results range from -100% to 100%
        # If score is higher than max_result, bring it back down to max_result so it results full resonance
        if scr >= 0
          scr = max_result_pos if scr > max_result_pos
          resonance = (scr.abs / max_result_pos.to_f)
        else
          scr = max_result_neg if scr > max_result_neg
          resonance = -(scr.abs / max_result_neg.to_f)
        end
        @result_resonance << (resonance * 100).round(1)
      end
    end

    # List of qualities to be shown, sorted alphabetically
    @blue_qualities = ['family', 'good and evil', 'moral values', 'pride', 'nation', 'risk-averse', 'anticipation', 'benevolence', 'right and wrong', 'religion', 'carefulness', 'certainty', 'chastity', 'conformity', 'consistency', 'control', 'conviction', 'devotion', 'dignity', 'diligence', 'duty', 'discipline', 'faith', 'fidelity', 'holy', 'loyalty', 'modesty', 'order', 'prudence', 'purity', 'restraint', 'saintliness', 'solidarity', 'stability', 'structure', 'thrift', 'virtue'].sort
    @orange_qualities = ['ambition', 'boldness', 'materialistic', 'strategic', 'individualistic', 'capability', 'sex', 'thrive',  'celebrity', 'challenge', 'confidence', 'reason', 'science', 'career', 'decisiveness', 'direction', 'drive', 'efficiency', 'excellence', 'fame', 'independence', 'capitalism', 'competition', 'investing', 'liberty', 'logic', 'money', 'motivation', 'prosperity', 'professionalism', 'proactive', 'persistence', 'success', 'recognition', 'recreation', 'status', 'wealth'].sort
    @green_qualities = ['acceptance', 'altruism', 'sensitive', 'open sexuality', 'appreciation', 'community', 'sustainable', 'environment', 'emotions', 'awareness', 'balance', 'compassion', 'contribution', 'co-operation', 'diversity', 'empathy', 'encouragement', 'fairness', 'equality', 'generosity', 'happiness', 'world-peace', 'harmony', 'mindfulness', 'openness', 'respect', 'selflessness', 'sharing', 'spirituality', 'humanistic', 'caring', 'protect minorities'].sort
    @yellow_qualities = ['conceptual', 'adaptability', 'congruence', 'directness', 'functionality', 'flexibility', 'humility', 'insightfulness', 'creativity', 'curiosity', 'intuition', 'integrity', 'mastery', 'perceptive', 'reflection', 'spontaneity', 'self-awareness', 'spirituality', 'integral', 'understanding', 'systemic thinking', 'big picture view', 'integration', 'open to all perspectives'].sort

    # Stats are [% of world population, % of world power]
    @blue_stats = ['50%', '30%']
    @orange_stats = ['40%', '50%']
    @green_stats = ['10%', '15%']
    @yellow_stats = ['1%', '5%']
  end

  def users

    @users = []
    @result_collection = []

    User.all.each do |user|
      @users << user.email

      # Repeat the process in the "result" action
      score = [0.to_f, 0.to_f, 0.to_f, 0.to_f]
      score_per_mchoice = 1
      score_ranking_12 = [2, 1.6, 1.2, 0.8, 0.4, 0, 0, -0.4, -0.8, -1.2, -1.6, -2]
      score_ranking_8 = [2, 1.2, 0.6, 0, 0, -0.6, -1.2, -2]
      score_statement = [-1, -0.5, 0, 0.5, 1]
      answers_to_score = Answer.all.select { |answer| answer.user == user && answer.question.nature == 'mchoice' }
      answers_to_score.each do |answer|
        score[answer.text.to_i] += score_per_mchoice
      end
      answers_to_score = Answer.all.select { |answer| answer.user == user && answer.question.nature == 'ranking' }
      answers_to_score.each do |answer|
        ordered_options = answer.text.scan(/.{1,2}/).map { |el| el.to_i }
        span = ordered_options.length / 4
        blue_ranking = (0 * span .. 0 * span + (span - 1)).to_a
        orange_ranking = (1 * span .. 1 * span + (span - 1)).to_a
        green_ranking = (2 * span .. 2 * span + (span - 1)).to_a
        yellow_ranking = (3 * span .. 3 * span + (span - 1)).to_a
        ordered_options.each do |option|
          all_groups = [blue_ranking, orange_ranking, green_ranking, yellow_ranking]
          desired_group = all_groups.index(all_groups.select { |group| group.include?(option) }[0])
          if ordered_options.length == 8
            score[desired_group] += score_ranking_8[ordered_options.index(option)]
          else
            score[desired_group] += score_ranking_12[ordered_options.index(option)]
          end
        end
      end
      answers_to_score = Answer.all.select { |answer| answer.user == user && answer.question.nature == 'statement' }
      answers_to_score.each do |answer|
        translate_colors = ['blue', 'orange', 'green', 'yellow']
        desired_group = translate_colors.index(answer.question.text)
        score[desired_group] += score_statement[answer.text.to_i]
      end
      @result = score.map { |sc| sc.round(2) }
      max_result_pos = 25
      max_result_neg = 15
      @result_resonance = []
      @result.each do |scr|
        if scr >= 0
          scr = max_result_pos if scr > max_result_pos
          resonance = (scr.abs / max_result_pos.to_f)
        else
          scr = max_result_neg if scr > max_result_neg
          resonance = -(scr.abs / max_result_neg.to_f)
        end
        @result_resonance << (resonance * 100).round(1)
      end

      @result_collection << @result_resonance
    end


  end
end
