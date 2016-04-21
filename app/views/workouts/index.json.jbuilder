json.array!(@workouts) do |workout|
  json.extract! workout, :id, :workout_name, :body_part_hit, :sets, :reps
  json.url workout_url(workout, format: :json)
end
