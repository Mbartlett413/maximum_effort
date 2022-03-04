class DummyRepetitionCollectionsController < ApplicationController
  before_action :set_dummy_repetition_collection, only: %i[ show edit update destroy ]

  # GET /dummy_repetition_collections or /dummy_repetition_collections.json
  def index
    @dummy_repetition_collections = DummyRepetitionCollection.all
  end

  # GET /dummy_repetition_collections/1 or /dummy_repetition_collections/1.json
  def show
  end

  # GET /dummy_repetition_collections/new
  def new
    @dummy_repetition_collection = DummyRepetitionCollection.new
  end

  # GET /dummy_repetition_collections/1/edit
  def edit
  end

  # POST /dummy_repetition_collections or /dummy_repetition_collections.json
  def create
    @dummy_repetition_collection = DummyRepetitionCollection.new(dummy_repetition_collection_params)

    respond_to do |format|
      if @dummy_repetition_collection.save
        format.html { redirect_to @dummy_repetition_collection, notice: "Dummy repetition collection was successfully created." }
        format.json { render :show, status: :created, location: @dummy_repetition_collection }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dummy_repetition_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dummy_repetition_collections/1 or /dummy_repetition_collections/1.json
  def update
    respond_to do |format|
      if @dummy_repetition_collection.update(dummy_repetition_collection_params)
        format.html { redirect_to @dummy_repetition_collection, notice: "Dummy repetition collection was successfully updated." }
        format.json { render :show, status: :ok, location: @dummy_repetition_collection }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dummy_repetition_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dummy_repetition_collections/1 or /dummy_repetition_collections/1.json
  def destroy
    @dummy_repetition_collection.destroy
    respond_to do |format|
      format.html { redirect_to dummy_repetition_collections_url, notice: "Dummy repetition collection was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dummy_repetition_collection
      @dummy_repetition_collection = DummyRepetitionCollection.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dummy_repetition_collection_params
      params.require(:dummy_repetition_collection).permit(:dummy_repetition_id, :set_value, :percent_based, :rep_value)
    end
end
