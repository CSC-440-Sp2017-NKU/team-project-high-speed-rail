class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.text :content
      t.references :question, foreign_key: true

      t.timestamps
    end
    
    add_index :answers, [:question_id, :created_at]
  end
end
