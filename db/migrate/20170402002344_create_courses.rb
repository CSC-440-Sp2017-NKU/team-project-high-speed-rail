class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :code
      t.string :title
      t.string :days
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
