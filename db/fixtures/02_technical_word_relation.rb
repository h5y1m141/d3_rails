programming_language1 = TechnicalWord.find_by_name('Ruby')
programming_language2 = TechnicalWord.find_by_name('PHP')

web_applicatin_framework1 = TechnicalWord.find_by_name('Ruby on Rails')
web_applicatin_framework2 = TechnicalWord.find_by_name('CakePHP')

TechnicalWordRelation.create(source_word_id: programming_language1.id, target_word_id: web_applicatin_framework1.id)
TechnicalWordRelation.create(source_word_id: programming_language2.id, target_word_id: web_applicatin_framework2.id)
TechnicalWordRelation.create(source_word_id: web_applicatin_framework1.id, target_word_id: web_applicatin_framework2.id)




