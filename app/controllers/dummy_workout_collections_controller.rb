class DummyWorkoutCollectionsController < ApplicationController
  before_action :set_dummy_workout_collection, only: %i[ show edit update destroy ]

  # GET /dummy_workout_collections or /dummy_workout_collections.json
  def index
    @dummy_workout_collections = DummyWorkoutCollection.all
  end

  # GET /dummy_workout_collections/1 or /dummy_workout_collections/1.json
  def show
  end

  # GET /dummy_workout_collections/new
  def new
    @dummy_workout_collection = DummyWorkoutCollection.new
  end

  # GET /dummy_workout_collections/1/edit
  def edit
  end

  # POST /dummy_workout_collections or /dummy_workout_collections.json
  def create
    getter = DummyWorkout.find(params['dummy_workout_collection']['dummy_workout'])

    @dummy_workout_collection = DummyWorkoutCollection.new
    @dummy_workout_collection.dummy_workout = getter
    @dummy_workout_collection.exercise_id = params['dummy_workout_collection']['exercise_id']

    #this is actually a repetition ID, make a dummy repetition ID
    selected_rep = Repetition.find(params['dummy_workout_collection']['dummy_repetition_id'])
    @new_rep = DummyRepetition.new
    @new_rep.title = selected_rep.title
    @new_rep.save

    rep_collections = selected_rep.repetition_collections
      rep_collections.each do |x|
        #create dummy rep associations
        drc = DummyRepetitionCollection.new
        drc.dummy_repetition = @new_rep
        drc.set_value = x.set_value
        drc.percent_based = x.percent_based
        drc.rep_value = x.rep_value
        drc.save
      end 

    @dummy_workout_collection.dummy_repetition_id = @new_rep.id

    respond_to do |format|
      if @dummy_workout_collection.save
        format.html { redirect_to @dummy_workout_collection, notice: "Dummy workout collection was successfully created." }
        format.json { render :show, status: :created, location: @dummy_workout_collection }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dummy_workout_collection.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /dummy_workout_collections/1 or /dummy_workout_collections/1.json
  def update

    if params['dummy_workout_collection'].present?
      p 'athlete_notes updated'
      dwc = DummyWorkoutCollection.find(params['id'].to_i)
      if params['dummy_workout_collection']['athlete_notes'].present?
        dwc.update_attribute(:athlete_notes, params['dummy_workout_collection']['athlete_notes'])
      elsif params['dummy_workout_collection']['coach_notes'].present?
        dwc.update_attribute(:coach_notes, params['dummy_workout_collection']['coach_notes'])
      else
        p 'error with update dwc'
      end 
    else
      
      p 'updating dwc object'

      respond_to do |format|
        if @dummy_workout_collection.update(dummy_workout_collection_params)
          format.html { redirect_to @dummy_workout_collection, notice: "Dummy workout collection was successfully updated." }
          format.json { render :show, status: :ok, location: @dummy_workout_collection }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @dummy_workout_collection.errors, status: :unprocessable_entity }
        end
      end

    end 
  end

  # DELETE /dummy_workout_collections/1 or /dummy_workout_collections/1.json
  def destroy
    @dummy_workout_collection.destroy
    respond_to do |format|
      format.html { redirect_to dummy_workout_collections_url, notice: "Dummy workout collection was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dummy_workout_collection
      @dummy_workout_collection = DummyWorkoutCollection.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dummy_workout_collection_params
      params.require(:dummy_workout_collection).permit(:exercise_id, :dummy_repetition_id, :dummy_workout)
    end
end
