class CreateTechnicalWordRelations < ActiveRecord::Migration
  def change
    create_table :technical_word_relations do |t|
      t.integer :source_word_id
      t.integer :target_word_id

      t.timestamps null: false
    end
  end
end
