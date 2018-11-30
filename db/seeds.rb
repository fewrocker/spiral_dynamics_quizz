# Do a reset
Question.all.each do |question|
  question.destroy
end
puts "All questions erased"

# First question: money
q = Question.new
q.number = 1
q.nature = 'mchoice'
q.subject = 'money'
q.options << 'It is important well-being for myself and my family'
q.options << 'Money is all there is. The more money, the more success, respect and achievement I will have, and the happier I will be'
q.options << 'Money is important, but blind pursuit of it creates a sick society with income inequality and destroys the environment'
q.options << 'Important to have enough to live comfortably, but far from being the answer to well-being. Having millions is not on top of my list'
q.save
puts "Created question \##{q.number}"

# Second question: economy
q = Question.new
q.number = 2
q.nature = 'mchoice'
q.subject = 'the economy'
q.options << 'The economy is important to have a stronger country, traditions and values'
q.options << 'Less regulation, more competition and profit seeking will generate a better economy for everybody'
q.options << 'Economy should be more regulatd to ensure equality and prevent excesses caused by blind pursuit of money'
q.options << 'Economy is a very complex system, and all perspectives and theories, from left to right, should be studied to devise a more functional solution'
q.save
puts "Created question \##{q.number}"

# Third question: politics
q = Question.new
q.number = 3
q.nature = 'mchoice'
q.subject = 'politics'
q.options << 'Rules and laws are very important to maintain civilization, traditions and national identity'
q.options << 'The state should be smaller and the market should be less regulated so that companies can flourish and bring more value to society'
q.options << 'Being politically engaged, speaking out and joining movements and protests is vital to produce change in the right direction'
q.options << 'Politics is a rather complicated system full of interest clashes that create a stalemate. We need to integrate in a better way to progress'
q.save
puts "Created question \##{q.number}"

# Fourth question: Science
q = Question.new
q.number = 4
q.nature = 'mchoice'
q.subject = 'science'
q.options << 'Scientific knowledge is important for develoment, but there are some higher truths that people are losing touch with, such as religion'
q.options << 'Science is absolute truth. It generates progress and technology which ultimately makes the world a better place for everyone'
q.options << "Science can help the world's problems, but not alone. We also need love, peace and empathy to make the World a better place"
q.options << 'Science is a great tool and a huge advancement compared to religious explanations. However, reason and logic are still not sufficient to get to the truth'
q.save
puts "Created question \##{q.number}"

# Fifth question: religion
q = Question.new
q.number = 5
q.nature = 'mchoice'
q.subject = 'religion'
q.options << 'Religion is the ultimate truth. People nowadays are losing touch with faith and this is a huge problem'
q.options << 'Religion makes absolutely no sense. All religious dogma should be replaced by science and rationality to get to the objective truth'
q.options << "Religious dogmas are very narrow-minded. It's views on humanistic subjects such as homosexuality and abortion are archaic"
q.options << 'Each religion is a different perspective that might all point to the one same truth, but have got perverted by religious structures. They have to be studied carefully'
q.save
puts "Created question \##{q.number}"

# Question: Overall values
q = Question.new
q.number = 6
q.nature = 'ranking'
q.subject = 'What do you value the most?'
# Blue
q.options << 'Family'
q.options << 'Religion and faith'
q.options << 'Tradition and good moral values'
# Orange
q.options << 'Carreer, wealth and achievement'
q.options << 'Power and recognition'
q.options << 'Logic, reasoning and science to make progress'
# Green
q.options << 'Creating a fair world with less inequality'
q.options << 'World peace and spreading love'
q.options << 'Fighting for minorities rights'
# Yellow
q.options << 'Personal and spiritual development'
q.options << 'Studying and understanding the world as a complex system'
q.options << 'Integrate different perspectives'
q.save
puts "Created question \##{q.number}"






