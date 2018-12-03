# Do a reset
Question.all.each do |question|
  question.destroy
end
puts "All questions erased"

qnumber = 1

# ----------------------------------
# QUESTION TYPE: MULTIPLE COICE
# ----------------------------------

q = Question.new
q.number = qnumber
q.nature = 'mchoice'
q.subject = 'money'
q.options << 'It is important to build a solid carreer in order to live a comfortable life and provide for the family'
q.options << 'The more money, the more success, possessions and recognition I will have, and the happier I will be'
q.options << 'Money is important, but blind pursuit of it creates a sick society with income inequality and destroys the environment'
q.options << "Your career should not be focused on money, but in reaching a life purpose and creating value for the world"
q.save
qnumber += 1
puts "Created question \##{q.number}"


q = Question.new
q.number = qnumber
q.nature = 'mchoice'
q.subject = 'the economy'
q.options << 'The economy is important to have a stronger country, traditions and values'
q.options << 'Less regulation, more competition and profit seeking will generate a better economy for everybody'
q.options << 'Economy should be more regulatd to ensure equality and prevent excesses caused by blind pursuit of money'
q.options << 'Economy is a very complex system, and all perspectives and theories, from left to right, should be studied to devise a more functional solution'
q.save
qnumber += 1
puts "Created question \##{q.number}"

q = Question.new
q.number = qnumber
q.nature = 'mchoice'
q.subject = 'politics'
q.options << 'A firm president, rules and laws are very important to maintain civilization, traditions and national identity'
q.options << 'Economy comes first: the state should be smaller and the market should be less regulated so that companies can flourish and bring more value to society'
q.options << 'Being politically engaged, speaking out and joining movements and protests is vital to produce change in the right direction'
q.options << 'Politics is a rather complicated system full of interest clashes and nothing really changes. We need to integrate in a better way to progress'
q.save
qnumber += 1
puts "Created question \##{q.number}"

q = Question.new
q.number = qnumber
q.nature = 'mchoice'
q.subject = 'science'
q.options << "Scientific knowledge is important for develoment, but it should not be used as a tool to deny the highest truth, God"
q.options << 'Science is absolute truth. It generates progress and technology which ultimately makes the world a better place for everyone'
q.options << "Science can help the world's problems, but not alone. We also need love, peace and empathy to make the World a better place"
q.options << 'Science is a great tool and a huge advancement compared to religious explanations. However, reason and logic are still not sufficient to get to the truth'
q.save
qnumber += 1
puts "Created question \##{q.number}"

q = Question.new
q.number = qnumber
q.nature = 'mchoice'
q.subject = 'religion'
q.options << 'Religion is the ultimate truth. People nowadays are losing touch with faith and this is a huge problem'
q.options << 'Religion makes no logical sense. If people were more rational and less dogmatic the world would be better'
q.options << "Religious are very opressive. It's views on humanistic subjects such as homosexuality and women's rights are archaic"
q.options << "Religion got corrupted by its corrupt institutions, but in its core each religion is a different perspective that might point to one same spiritual truth"
q.save
qnumber += 1
puts "Created question \##{q.number}"

q = Question.new
q.number = qnumber
q.nature = 'mchoice'
q.subject = 'the world'
q.options << "Controlled by a higher power that punishes evil and eventually rewards the good works and righteous living"
q.options << "Full of resources to develop and opportunities to make things better and bring prosperity"
q.options << "The habitat wherein humanity can find love and purposes through loving and sharing. We have to do our best to protect the habitat and preserve the environment"
q.options << "A complex and chaotic system, in which forces mutually influence each other and function as a single living organism. Change is the only constant"

q.save
qnumber += 1
puts "Created question \##{q.number}"

q = Question.new
q.number = qnumber
q.nature = 'mchoice'
q.subject = 'others'
q.options << "We have to care for ourselves, our family and our country first and fight against the enemies"
q.options << "The self comes first. You should strive to achieve success and it is good if you can provide value to other people with your work"
q.options << "We have to care more about the others and the extreme suffering and poverty that a huge part of the populaton faces"
q.options << "It is important to develop the self to be able to really have an impact and create meaningful change in the world and help everyone"
q.save
qnumber += 1
puts "Created question \##{q.number}"

q = Question.new
q.number = qnumber
q.nature = 'mchoice'
q.subject = 'spirituality'
q.options << "The spirituality comes with faith in the creation and the practice of your true religion"
q.options << "Spirituality is a woo-woo new-age concept which doesn't make much logical sense"
q.options << "Spirituality practice helps people be more calm and have more compassion towards others"
q.options << "Spirituality practice is deeply meaningful and helps you connect with your deeper self"
q.save
qnumber += 1
puts "Created question \##{q.number}"

q = Question.new
q.number = qnumber
q.nature = 'mchoice'
q.subject = 'emotions'
q.options << "It is important to have faith and pray so God can help you deal with the difficult situations in your life"
q.options << "Emotions are not very useful and usually clouds logical reasoning and creates conflicft and drama"
q.options << "If people had more contact with their emotions and had more empathy towards others, the world would be a better place"
q.options << "Befriending your emotions is very important to become a more intuitive person and to live a better life"
q.save
qnumber += 1
puts "Created question \##{q.number}"

# ----------------------------------
# QUESTION TYPE: RANKING
# ----------------------------------

q = Question.new
q.number = qnumber
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
q.options << 'Understand and integrate all human perspectives to create a better world'
q.save
qnumber += 1
puts "Created question \##{q.number}"

q = Question.new
q.number = qnumber
q.nature = 'ranking'
q.subject = 'What traits are more valuable to a person?'
# Blue
q.options << "Morality"
q.options << "Discipline"
q.options << "Faith"
# Orange
q.options << "Ambition"
q.options << "Professionalism"
q.options << "Success"
# Green
q.options << "Fairness"
q.options << "Compassion"
q.options << "Loving and Caring"
# Yellow
q.options << "Conscious and awareness"
q.options << "Systemic thinking"
q.options << "Radical open-mindedness"
q.save
qnumber += 1
puts "Created question \##{q.number}"

# # Question eleven: Beliefs
# q = Question.new
# q.number = qnumber
# q.nature = 'ranking'
# q.subject = 'What are your core beliefs'
# # Blue
# q.options << "\"There is a higher power that governs all creation\""
# q.options << "\"Traditions and moral values should be followed so we can have a functioning society\""
# # Orange
# q.options << "\"Each individual is fully responsible to determine his own success and wealth\""
# q.options << "\"All decisions, be it in life, business or relationships, should be made after logical consideration\""
# # Green
# q.options << "\"The world would be a better place if only people cared more, loved more, and were more engaged in political discussions\""
# q.options << "\"Capitalism, taken to its extreme, generates huge inequality and suffering for its victims, especially for minorities\""
# # Yellow
# q.options << "\"Every person has a different perspective which has a partial truth to it, and should be respected\""
# q.options << "\"Instead of being in a never-ending battle between right and wrong, left and right, we should integrate all worldviews to create a better system\""
# q.save
# qnumber += 1
# puts "Created question \##{q.number}"

# ----------------------------------
# QUESTION TYPE: STATEMENT
# ----------------------------------

q = Question.new
q.number = qnumber
q.nature = 'statement'
q.subject = 'Homosexuality is an abnormal behavior'
q.text = 'blue'
q.save
qnumber += 1
puts "Created question \##{q.number}"

q = Question.new
q.number = qnumber
q.nature = 'statement'
q.subject = 'Logic and reasoning are the best way to arrive at trustworthy conclusions'
q.text = 'orange'
q.save
qnumber += 1
puts "Created question \##{q.number}"

q = Question.new
q.number = qnumber
q.nature = 'statement'
q.subject = 'Left, right and center all have perspectives with partial truths that can be integrated to create a better system'
q.text = 'yellow'
q.save
qnumber += 1
puts "Created question \##{q.number}"

q = Question.new
q.number = qnumber
q.nature = 'statement'
q.subject = 'Society is lost in a blind pursuit of money and materialism that creates misery and suffering for millions of individuals'
q.text = 'green'
q.save
qnumber += 1
puts "Created question \##{q.number}"

# ---------------------------------------------------------------------

q = Question.new
q.number = qnumber
q.nature = 'statement'
q.subject = 'Materialism, money and success will not make the world better. Also, loving, caring and sharing are not sufficient'
q.text = 'yellow'
q.save
qnumber += 1
puts "Created question \##{q.number}"

q = Question.new
q.number = qnumber
q.nature = 'statement'
q.subject = 'The free market, when it is allowed to do so, provides tremendous opportunity for people of all backgrounds, interests and abilities'
q.text = 'orange'
q.save
qnumber += 1
puts "Created question \##{q.number}"

q = Question.new
q.number = qnumber
q.nature = 'statement'
q.subject = 'People nowadays have lost touch with faith and values, and you see that in a lot of sexual promiscuity and lack of direction in life'
q.text = 'blue'
q.save
qnumber += 1
puts "Created question \##{q.number}"

q = Question.new
q.number = qnumber
q.nature = "statement"
q.subject = "People don't realize that capitalism is inherently unfair, and majority groups have a head start compared with minorities, and this is wrong"
q.text = 'green'
q.save
qnumber += 1
puts "Created question \##{q.number}"


# ---------------------------------------------------------------------

q = Question.new
q.number = qnumber
q.nature = 'statement'
q.subject = 'Low taxes and competition among companies seeking profits creates more prosperity and a better world for everyone'
q.text = 'orange'
q.save
qnumber += 1
puts "Created question \##{q.number}"

q = Question.new
q.number = qnumber
q.nature = 'statement'
q.subject = "I don't like to judge and label anything as right or wrong. I believe it is not that simple"
q.text = 'yellow'
q.save
qnumber += 1
puts "Created question \##{q.number}"

q = Question.new
q.number = qnumber
q.nature = 'statement'
q.subject = "It is really important to respect authorities, follow laws and obey rules to society can work well"
q.text = 'blue'
q.save
qnumber += 1
puts "Created question \##{q.number}"

q = Question.new
q.number = qnumber
q.nature = 'statement'
q.subject = "I get really frustrated to see how unfair the world is, how we are destroying the environment and how many people doesn't seem to care"
q.text = 'green'
q.save
qnumber += 1
puts "Created question \##{q.number}"






