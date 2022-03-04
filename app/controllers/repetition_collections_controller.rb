class RepetitionCollectionsController < ApplicationController
  before_action :set_repetition_collection, only: %i[ show edit update destroy ]

  # GET /repetition_collections or /repetition_collections.json
  def index
    @repetition_collections = RepetitionCollection.all
  end

  # GET /repetition_collections/1 or /repetition_collections/1.json
  def show
  end

  # GET /repetition_collections/new
  def new
    @repetition_collection = RepetitionCollection.new
  end

  # GET /repetition_collections/1/edit
  def edit
  end

  # POST /repetition_collections or /repetition_collections.json
  def create
    @repetition_collection = RepetitionCollection.new(repetition_collection_params)

    respond_to do |format|
      if @repetition_collection.save
        format.html { redirect_to @repetition_collection, notice: "Repetition collection was successfully created." }
        format.json { render :show, status: :created, location: @repetition_collection }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @repetition_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /repetition_collections/1 or /repetition_collections/1.json
  def update
    respond_to do |format|
      if @repetition_collection.update(repetition_collection_params)
        format.html { redirect_to @repetition_collection, notice: "Repetition collection was successfully updated." }
        format.json { render :show, status: :ok, location: @repetition_collection }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @repetition_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /repetition_collections/1 or /repetition_collections/1.json
  def destroy
    @repetition_collection.destroy
    respond_to do |format|
      format.html { redirect_to repetition_collections_url, notice: "Repetition collection was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_repetition_collection
      @repetition_collection = RepetitionCollection.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def repetition_collection_params
      params.require(:repetition_collection).permit(:repetition_id, :set_value, :percent_based, :rep_value)
    end
end
