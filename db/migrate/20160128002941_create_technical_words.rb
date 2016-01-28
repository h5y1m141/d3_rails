class CreateTechnicalWords < ActiveRecord::Migration
  def change
    create_table :technical_words do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
