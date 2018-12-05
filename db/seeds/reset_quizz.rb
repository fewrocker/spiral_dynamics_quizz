answer_save_all = []

User.all.each do |user|
  answer_save_user = []

  user.answers.each do |answer|
    answer_save_user << answer.text
    p answer.text
  end

  answer_save_all << answer_save_user

  user.answers.each do |answer|
    answer.destroy
  end
end

`rails db:seed`

user_saved = []

User.all.each do |user|


  (0..answer_save_all[user_saved.length - 1].length - 1).to_a.each do |int|
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

