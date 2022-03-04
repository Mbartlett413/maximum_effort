class DummyWorkoutsController < ApplicationController
  before_action :set_dummy_workout, only: %i[ show edit update destroy ]

  # GET /dummy_workouts or /dummy_workouts.json
  def index
    @dummy_workouts = DummyWorkout.all
  end

  # GET /dummy_workouts/1 or /dummy_workouts/1.json
  def show
  end

  # GET /dummy_workouts/new
  def new
    @dummy_workout = DummyWorkout.new
  end

  # GET /dummy_workouts/1/edit
  def edit
  end

  # POST /dummy_workouts or /dummy_workouts.json
  def create
    @dummy_workout = DummyWorkout.new(dummy_workout_params)

    respond_to do |format|
      if @dummy_workout.save
        format.html { redirect_to @dummy_workout, notice: "Dummy workout was successfully created." }
        format.json { render :show, status: :created, location: @dummy_workout }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dummy_workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dummy_workouts/1 or /dummy_workouts/1.json
  def update

      respond_to do |format|
        if @dummy_workout.update(dummy_workout_params)
          format.html { redirect_to @dummy_workout, notice: "Dummy workout was successfully updated." }
          format.json { render :show, status: :ok, location: @dummy_workout }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @dummy_workout.errors, status: :unprocessable_entity }
        end
      end

  end

  # DELETE /dummy_workouts/1 or /dummy_workouts/1.json
  def destroy
    @dummy_workout.destroy
    respond_to do |format|
      format.html { redirect_to dummy_workouts_url, notice: "Dummy workout was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dummy_workout
      @dummy_workout = DummyWorkout.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dummy_workout_params
      params.require(:dummy_workout).permit(:user_id, :title, :program_day_id, :athlete_notes, :coach_notes)
    end
end
