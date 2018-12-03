class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def get_user_score(user)
    # Initialize all scores as 0 (floating point since some scores will be floating points)
    score = [0.to_f, 0.to_f, 0.to_f, 0.to_f]

    score_per_mchoice = 1.5
    score_per_mchoice_other = -0.5
    score_ranking_12 = [2, 1.6, 1.2, 0.8, 0.4, 0, 0, -0.4, -0.8, -1.2, -1.6, -2]
    score_ranking_8 = [2, 1.2, 0.6, 0, 0, -0.6, -1.2, -2]
    score_statement = [-1, -0.5, 0, 0.5, 1]

    # --> Scoring multiple choice questions
    # Get all answers from user which question is of nature mchoice
    answers_to_score = Answer.all.select { |answer| answer.user == user && answer.question.nature == 'mchoice' }
    # Give points to the corresponding color based on the answer (0 blue, 1 orange, 2 green, 3 yellow)
    # Points given are score_per_mchoice
    # Take points to all the other colors given by score_per_mchoice_other
    answers_to_score.each do |answer|
      (0..score.length).to_a do |int|
        int == answer.text.to_i ? score[int] += score_per_mchoice : score[int] += score_per_mchoice_other
      end
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

    result = score.map { |sc| sc.round(2) }

    # A 100% resonance occurs when score = max_result
    # Negative and positive resonance have different max since there is more positive points than negative in the quizz
    max_result_pos = 25
    max_result_neg = 12
    # Start the result_resonance array to be populated
    result_resonance = []

    result.each do |scr|
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
      result_resonance << (resonance * 100).round(1)
    end

    return result_resonance
  end
end
