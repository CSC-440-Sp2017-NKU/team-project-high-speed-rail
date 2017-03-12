class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.references :answer, foreign_key: true
      t.boolean :is_liked

      t.timestamps
    end
  end
end
