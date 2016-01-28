json.array!(@technical_words) do |technical_word|
  json.extract! technical_word, :id, :name, :description
  json.url technical_word_url(technical_word, format: :json)
end
