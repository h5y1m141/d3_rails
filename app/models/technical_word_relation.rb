class TechnicalWordRelation < ActiveRecord::Base
  belongs_to :technical_word
  belongs_to :source, class_name: 'TechnicalWord', foreign_key: :source_word_id
  belongs_to :target, class_name: 'TechnicalWord', foreign_key: :target_word_id
  
  def self.relation_words(technical_word)
    source_words = TechnicalWordRelation.includes(:source).includes(:target).where(source_word_id: technical_word.id).map do |word|
      { source_id: word.source.id, source: word.source.name, target_id: word.target.id, target: word.target.name}
    end
    target_words = TechnicalWordRelation.includes(:source).includes(:target).where(target_word_id: technical_word.id).map do |word|
      { source_id: word.source.id, source: word.source.name, target_id: word.target.id, target: word.target.name}
    end
    return source_words + target_words
  end  
end
