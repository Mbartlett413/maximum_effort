Rails.application.routes.draw do
  resources :regions
  resources :dummy_repetition_collections
  resources :dummy_workout_collections
  resources :dummy_repetitions
  resources :dummy_workouts
  resources :repetition_collections
  resources :repetitions
  resources :muscle_groups
  resources :max_efforts
  resources :exercises
  resources :exercise_collections
  resources :program_workouts
  resources :program_days
  resources :program_weeks
  resources :programs
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root to: "programs#index"

 post 'create_workout', to: 'program_workouts#create_workout'
 post 'assign_workout', to: 'programs#assign_workout'

 #dummy
 post 'update_dummy', to: 'programs#update_dummy'

 #program update js
 post 'update_program', to: 'programs#update_program'
 post 'add_day_to_program', to: 'programs#add_day_to_program' 
 post 'add_week_to_program', to: 'programs#add_week_to_program' 
 
 post 'update_exercise_collection', to: 'program_workouts#update_exercise_collection'
 post 'update_repetition_collection', to: 'repetitions#update_repetition_collection'
 post 'add_athlete_notes', to: 'program_days#add_athlete_notes'
 

 


end
