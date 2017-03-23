class AddUserToRating < ActiveRecord::Migration[5.0]
  def change
    add_reference :ratings, :user, foreign_key: true
  end
end
