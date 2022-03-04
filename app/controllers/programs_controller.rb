class ProgramsController < ApplicationController
  before_action :set_program, only: %i[ show edit update destroy ]

  # GET /programs or /programs.json
  def index
    @programs = Program.all
  end

  # GET /programs/1 or /programs/1.json
  def show
    @program_workouts = ProgramWorkout.all
  end

  # GET /programs/new
  def new
    @program = Program.new
  end

  # GET /programs/1/edit
  def edit
  end

  def assign_workout
    p 'hit'
    p current_user 
    Program.super_amazing_cloning_device_GO(params[:day_id], params[:workout_id], current_user)
  end 

  # POST /programs or /programs.json
  def create
    @program = Program.new(program_params)

    respond_to do |format|
      if @program.save

        Program.create_week_day(program_params, @program)
        
        format.html { redirect_to @program, notice: "Program was successfully created." }
        format.json { render :show, status: :created, location: @program }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /programs/1 or /programs/1.json
  def update
    respond_to do |format|
      if @program.update(program_params)
        format.html { redirect_to @program, notice: "Program was successfully updated." }
        format.json { render :show, status: :ok, location: @program }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /programs/1 or /programs/1.json
  def destroy
    @program.destroy
    respond_to do |format|
      format.html { redirect_to programs_url, notice: "Program was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def update_dummy 
    p 'hit'
    @dwc = DummyRepetitionCollection.find(params[:dummy_id])

    if params[:selection] == 'set_value'
      @dwc.update_attribute(:set_value, params[:update_value])
    elsif params[:selection] == 'percent_value'
      if params[:update_value] == 'false'
        @dwc.update_attribute(:percent_based, false)
      else
        @dwc.update_attribute(:percent_based, true)
      end 

    elsif params[:selection] == 'rep_value'
      @dwc.update_attribute(:rep_value, params[:update_value])
    else
      p 'log error in dummy update'
    end 
        
  end 

  def update_program
    p 'hit'
    @day = ProgramDay.find(params['day_id'])
    @dummy_workout = @day.dummy_workout

    if params['program_action'] == 'add_workout_collection'
      @action_settings = params['program_action']
      @dummy_workout_collection = DummyWorkoutCollection.new
      @exercises = Exercise.all
      @repetitions = Repetition.all
      # trigger js.erb to add dummy_workout_collections

    elsif params['program_action'] == 'exercise'
      @action_settings = params['program_action']
      @dummy_workout_collection = DummyWorkoutCollection.find(params['dwc_id'])
      @exercises = Exercise.all
      # trigger js.erb to add change exercise for dwc

    elsif params['program_action'] == 'rep'
      @action_settings = params['program_action']
      # trigger js.erb to modify dummy rep and rep collection
      @dummy_repetition = DummyRepetition.find(params['dr_id'])

      
    else
      logger.debug("Program Update Error")
    end

    respond_to do |format|
      format.js
    end 
  end 

  def add_day_to_program
    @program_day = ProgramDay.new
    @program_day.program_week_id = params[:week_id]
    p 'hit'
    respond_to do |format|
      format.js
    end
  end 


  def add_week_to_program
    
    respond_to do |format|
      format.js
    end
  end  

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_program
      @program = Program.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def program_params
      params.require(:program).permit(:user_id, :title, :number_of_weeks, :days_per_week)
    end
end
