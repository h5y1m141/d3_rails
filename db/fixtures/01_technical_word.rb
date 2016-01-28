require "csv"

CSV.foreach('db/fixtures/technical_word.csv') do |row|
  TechnicalWord.seed do |s|
    s.name          = row[0]
    s.description   = row[1]
  end
end
