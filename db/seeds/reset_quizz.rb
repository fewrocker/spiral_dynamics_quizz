Answer.all.each do |answer|
  answer.destroy
end

User.all.each do |user|
  user.progress = 0
  user.save
end

puts "All user progress reseted"

