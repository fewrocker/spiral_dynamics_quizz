answer_save_all = []

User.all.sort_by {|user| user.id }.each do |user|
  answer_save_user = []

  user.answers.each do |answer|
    answer_save_user << answer.text
  end

  answer_save_all << answer_save_user

  user.answers.each do |answer|
    answer.destroy
  end
end

`rails db:seed`

user_saved = []

User.all.sort_by {|user| user.id }.each do |user|

  ans_length = answer_save_all[user_saved.length].length
  if ans_length == 0
    length_array = []
  else
    length_array = (0..ans_length - 1).to_a
  end

  length_array.each do |int|
    a = Answer.new
    a.user = user
    a.question = Question.find_by(number: int + 1)
    a.text = answer_save_all[user_saved.length][a.question.number - 1]
    a.save
    p "Recovered answer of question #{a.question.number} as #{a.text}"
  end

  user_saved << user
  user.progress = user.answers.length
  user.save

end

puts "All user progress reseted"

