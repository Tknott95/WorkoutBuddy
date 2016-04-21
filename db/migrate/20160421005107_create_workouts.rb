class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :workout_name
      t.string :body_part_hit
      t.integer :sets
      t.integer :reps

      t.timestamps null: false
    end
  end
end
