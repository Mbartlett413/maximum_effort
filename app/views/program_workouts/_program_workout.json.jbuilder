json.extract! program_workout, :id, :title, :program_day_id, :workout_notes, :created_at, :updated_at
json.url program_workout_url(program_workout, format: :json)
