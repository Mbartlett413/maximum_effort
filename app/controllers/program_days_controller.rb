class ProgramDaysController < ApplicationController
  before_action :set_program_day, only: %i[ show edit update destroy ]

  # GET /program_days or /program_days.json
  def index
    @program_days = ProgramDay.all
  end

  # GET /program_days/1 or /program_days/1.json
  def show
    #@exerciseCollection = ExerciseCollection.where( :id => @program_day.program_workout_id)
    logger.debug("HERE #{@program_day.dummy_workout.inspect}")
    if @program_day.dummy_workout.present? #|| @program_day.dummy_workout.dummy_workout_collection.present?
      #show
      p 'SHOW'

    else
      #redirect to 
      p "Woo woo: #{params[:id]}"
      program_day = ProgramDay.find(params[:id])
      program_week = program_day.program_week
      @program = program_week.program
      respond_to do |format|          
          format.html { redirect_to @program, notice: "Assign a workout to #{program_week.title}, #{program_day.title}" }
          format.json { render :show, status: :created, location: @program }
      end

    end 
    
  end

  # GET /program_days/new
  def new
    @program_day = ProgramDay.new
    @program_workouts = ProgramWorkout.all
  end

  # GET /program_days/1/edit
  def edit
    @program_workouts = ProgramWorkout.all
    @dummy_workout = @program_day.dummy_workout
    @dummy_workout_collection = DummyWorkoutCollection.new

    @exercises = Exercise.all
    @repetitions = Repetition.all

  end

  # POST /program_days or /program_days.json
  def create
    @program_day = ProgramDay.new(program_day_params)

    respond_to do |format|
      if @program_day.save
        format.html { redirect_to @program_day, notice: "Program day was successfully created." }
        format.json { render :show, status: :created, location: @program_day }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @program_day.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_athlete_notes
    @dummy_workout_collection = DummyWorkoutCollection.find(params['dwc_id'])
  end 

  # PATCH/PUT /program_days/1 or /program_days/1.json
  def update
    p params[:program_day][:dummy_workout_id]
    #if a day has a dummy_workout_id, delete it and replace 
    #if @program_day.dummy_workout_id.present?
      #delete
    #else
      #create the dummyworkout
      #Program.super_amazing_cloning_device_GO(@program_day,PARAMS,current_user)
    #end 

=begin
    respond_to do |format|
      if @program_day.update(program_day_params)
        format.html { redirect_to @program_day, notice: "Program day was successfully updated." }
        format.json { render :show, status: :ok, location: @program_day }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @program_day.errors, status: :unprocessable_entity }
      end
    end
=end
  end

  # DELETE /program_days/1 or /program_days/1.json
  def destroy
    @program_day.destroy
    respond_to do |format|
      format.html { redirect_to program_days_url, notice: "Program day was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_program_day
      @program_day = ProgramDay.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def program_day_params
      params.require(:program_day).permit(:title, :program_week_id, :active_day, :program_workout_id)
    end
end
