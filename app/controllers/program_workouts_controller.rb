class ProgramWorkoutsController < ApplicationController
  before_action :set_program_workout, only: %i[ show edit update destroy ]

  # GET /program_workouts or /program_workouts.json
  def index
    @program_workouts = ProgramWorkout.all
  end

  # GET /program_workouts/1 or /program_workouts/1.json
  def show
  end

  # GET /program_workouts/new
  def new
    @program_workout = ProgramWorkout.new
    @exercises = Exercise.all
    @repetitions = Repetition.all
  end

  # GET /program_workouts/1/edit
  def edit
    @exercises = Exercise.all
    @repetitions = Repetition.all
  end

  # POST /program_workouts or /program_workouts.json
  def create
    @program_workout = ProgramWorkout.new(program_workout_params)

    respond_to do |format|
      if @program_workout.save
        format.html { redirect_to @program_workout, notice: "Program workout was successfully created." }
        format.json { render :show, status: :created, location: @program_workout }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @program_workout.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_workout
    @program_workout = ProgramWorkout.new
    @program_workout.title = params[:title]
    @program_workout.workout_notes = params[:notes]
    respond_to do |format|
      if @program_workout.save

        ProgramWorkout.create_workout_collection(params[:exercises],params[:rep], @program_workout)

        format.html { redirect_to @program_workout, notice: "Program workout was successfully created." }
        format.json { render :show, status: :created, location: @program_workout }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @program_workout.errors, status: :unprocessable_entity }
      end
    end
  end 

  # PATCH/PUT /program_workouts/1 or /program_workouts/1.json
  def update
    respond_to do |format|
      if @program_workout.update(program_workout_params)
        format.html { redirect_to @program_workout, notice: "Program workout was successfully updated." }
        format.json { render :show, status: :ok, location: @program_workout }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @program_workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /program_workouts/1 or /program_workouts/1.json
  def destroy
    @program_workout.destroy
    respond_to do |format|
      format.html { redirect_to program_workouts_url, notice: "Program workout was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def update_exercise_collection
    p'hit'
        @exercises = Exercise.all
        @repetitions = Repetition.all

      if params['user_action'] == 'edit'
        @action_set = 'edit'

        @exercise_collection = ExerciseCollection.find(params['exercise_collection_id'])
      else
        #action better be add
        @action_set = 'add'
        @exercise_collection = ExerciseCollection.new
        @program_workout = ProgramWorkout.find(params['program_workout_id'])
      end 

    respond_to do |format|
      format.js
    end 

  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_program_workout
      @program_workout = ProgramWorkout.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def program_workout_params
      params.require(:program_workout).permit(:title, :workout_notes)
    end
end
