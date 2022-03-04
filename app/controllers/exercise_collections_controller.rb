class ExerciseCollectionsController < ApplicationController
  before_action :set_exercise_collection, only: %i[ show edit update destroy ]

  # GET /exercise_collections or /exercise_collections.json
  def index
    @exercise_collections = ExerciseCollection.all
  end

  # GET /exercise_collections/1 or /exercise_collections/1.json
  def show
  end

  # GET /exercise_collections/new
  def new
    @exercise_collection = ExerciseCollection.new
    @exercises = Exercise.all
    @repetitions = Repetition.all
  end

  # GET /exercise_collections/1/edit
  def edit
  end

  # POST /exercise_collections or /exercise_collections.json
  def create
    @exercise_collection = ExerciseCollection.new(exercise_collection_params)

    respond_to do |format|
      if @exercise_collection.save
        format.html { redirect_to @exercise_collection, notice: "Exercise collection was successfully created." }
        format.json { render :show, status: :created, location: @exercise_collection }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @exercise_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exercise_collections/1 or /exercise_collections/1.json
  def update
    respond_to do |format|
      if @exercise_collection.update(exercise_collection_params)
        format.html { redirect_to @exercise_collection, notice: "Exercise collection was successfully updated." }
        format.json { render :show, status: :ok, location: @exercise_collection }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @exercise_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercise_collections/1 or /exercise_collections/1.json
  def destroy
    @exercise_collection.destroy
    respond_to do |format|
      format.html { redirect_to exercise_collections_url, notice: "Exercise collection was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercise_collection
      @exercise_collection = ExerciseCollection.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exercise_collection_params
      params.require(:exercise_collection).permit(:program_workout_id, :exercise_id, :repetition_id)
    end
end
