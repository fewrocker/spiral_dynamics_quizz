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
q.options << 'It is important to build a solid carreer in order to live a comfortable life, provide for the family and create certainty for the future'
q.options << 'The more money, the more success, possessions and recognition I will have, and the happier I will be'
q.options << 'Money is important, but blindy pursuing it creates a sick society which destroys the environment and has a huge income inequality'
q.options << "Your career should not be focused on having more money than you need, but in reaching a life purpose and creating value for the world"
q.save
qnumber += 1
puts "Created question \##{q.number}"

q = Question.new
q.number = qnumber
q.nature = 'mchoice'
q.subject = 'the economy'
q.options << 'The economy is important to have a strong nation, traditions and values. It might be necessary to get into conflicts to protect the economy of our nation'
q.options << 'Less regulation, more competition and profit seeking will generate a better economy for everybody'
q.options << 'Economy should be more regulatd to ensure equality and prevent damage caused by the excesses of capitalism'
q.options << 'Economy is a very complex system, and many perspectives and theories, from left to right, should be integrated to devise a more functional solution'
q.save
qnumber += 1
puts "Created question \##{q.number}"

q = Question.new
q.number = qnumber
q.nature = 'mchoice'
q.subject = 'politics'
q.options << 'A firm president, rules and laws are very important to maintain civilization, traditions and the national identity'
q.options << 'Economy comes first: the state should be smaller and the market should be less regulated so that companies can bring more value to society'
q.options << 'Being politically engaged and joining discussion and protests is necessary to produce change in the right direction'
q.options << 'Politics is a rather complicated system full of interest clashes and nothing really changes. We need to integrate in a better way to have progress'
q.save
qnumber += 1
puts "Created question \##{q.number}"

q = Question.new
q.number = qnumber
q.nature = 'mchoice'
q.subject = 'science'
q.options << "Scientific study is important for develoment, but it should not be used as a tool to deny the highest truth, God"
q.options << 'Science is absolute truth. It generates progress and technology which ultimately makes the world a better place for everyone'
q.options << "Science and technology can help the world's problems, but only if more people have access to it and if it is used to create more well-being for everyone"
q.options << 'Science is a great tool and a huge advancement compared to religious dogma. However, reason and logic are still not sufficient to get to the absolute truth'
q.save
qnumber += 1
puts "Created question \##{q.number}"

q = Question.new
q.number = qnumber
q.nature = 'mchoice'
q.subject = 'religion'
q.options << 'Religion is the ultimate truth. People nowadays are losing touch with faith and this is is causing moral values to degrade'
q.options << 'Religion makes no logical sense. If people were more rational and less dogmatic the world would be developing faster'
q.options << "Religions are very opressive. It's views on humanistic subjects such as homosexuality and gender equality are archaic"
q.options << "Religions might, at their cores, point out to some deeper truth. However, the institutions have corrupted these teachings with ideology and dogma"
q.save
qnumber += 1
puts "Created question \##{q.number}"

q = Question.new
q.number = qnumber
q.nature = 'mchoice'
q.subject = 'the world'
q.options << "The world is controlled by a higher power that punishes evil and eventually rewards the good works and righteous living"
q.options << "The world is full of resources to develop and opportunities to make things better and bring prosperity to everyone"
q.options << "The habitat wherein humanity can find love and purposes through loving and sharing. We have to do our best to preserve the environment"
q.options << "A complex and chaotic system, in which inumerous forces mutually influence each other and function as a single living unit"

q.save
qnumber += 1
puts "Created question \##{q.number}"

q = Question.new
q.number = qnumber
q.nature = 'mchoice'
q.subject = 'others'
q.options << "We have to take care of ourselves, our family and our country first and fight against the enemies and push away bad people"
q.options << "The self comes first. You should strive to achieve success and it is good if you can provide value to other people with your work"
q.options << "We have to care more about the others and the extreme suffering and poverty that a huge part of the populaton faces"
q.options << "It is important to develop the self to be able to really have an impact and create meaningful change in the world and help other human beings"
q.save
qnumber += 1
puts "Created question \##{q.number}"

q = Question.new
q.number = qnumber
q.nature = 'mchoice'
q.subject = 'spirituality'
q.options << "Spirituality comes with prayer, faith in the creation and the practice of your true religion"
q.options << "Spirituality is a woo-woo new-age concept that doesn't make much logical sense"
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
q.options << "Being aware and befriending your emotions is very important to become a more intuitive person and to live a better life"
q.save
qnumber += 1
puts "Created question \##{q.number}"


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
q.subject = 'Society is lost in a blind pursuit of money and shallow materialism that creates misery and suffering for millions of people'
q.text = 'green'
q.save
qnumber += 1
puts "Created question \##{q.number}"

# ---------------------------------------------------------------------

q = Question.new
q.number = qnumber
q.nature = 'statement'
q.subject = "Beliefs such as the power of free market and fighting for minotiries' rights are frequently as dogmatic and ideological as religious beliefs"
q.text = 'yellow'
q.save
qnumber += 1
puts "Created question \##{q.number}"

q = Question.new
q.number = qnumber
q.nature = 'statement'
q.subject = 'People have lost touch with faith and good moral values: the youth is full of sexual promiscuity and lack of direction in life'
q.text = 'blue'
q.save
qnumber += 1
puts "Created question \##{q.number}"

q = Question.new
q.number = qnumber
q.nature = "statement"
q.subject = "Capitalism is inherently unfair, and some groups have a head start compared to others. This is wrong"
q.text = 'green'
q.save
qnumber += 1
puts "Created question \##{q.number}"

q = Question.new
q.number = qnumber
q.nature = 'statement'
q.subject = 'The combination of a free market and smaller state provides tremendous opportunity for people of all backgrounds, interests and abilities'
q.text = 'orange'
q.save
qnumber += 1
puts "Created question \##{q.number}"

# ---------------------------------------------------------------------

q = Question.new
q.number = qnumber
q.nature = 'statement'
q.subject = 'The human body and mind are a product of millions of years of evolution and in a nutshell are incredibly complex machines'
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
q.subject = "Always respect authorities, follow all laws and obey all rules so our national can work well"
q.text = 'blue'
q.save
qnumber += 1
puts "Created question \##{q.number}"

q = Question.new
q.number = qnumber
q.nature = 'statement'
q.subject = "I get really frustrated to see how unfair the world is, how we are destroying the environment and how many people don't seem to care"
q.text = 'green'
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
q.options << 'Logic, reasoning and science'
# Green
q.options << 'Creating a fair world'
q.options << 'World peace and spreading love'
q.options << 'Protecting minorities rights'
# Yellow
q.options << 'Personal development'
q.options << 'Studying and understanding the world as a complex system'
q.options << 'Understand and integrate all human perspectives'
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
q.options << "Consciousness and awareness"
q.options << "Systemic thinking"
q.options << "Radical open-mindedness"
q.save
qnumber += 1
puts "Created question \##{q.number}"
