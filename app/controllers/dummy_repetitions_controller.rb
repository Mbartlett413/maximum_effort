class DummyRepetitionsController < ApplicationController
  before_action :set_dummy_repetition, only: %i[ show edit update destroy ]

  # GET /dummy_repetitions or /dummy_repetitions.json
  def index
    @dummy_repetitions = DummyRepetition.all
  end

  # GET /dummy_repetitions/1 or /dummy_repetitions/1.json
  def show
  end

  # GET /dummy_repetitions/new
  def new
    @dummy_repetition = DummyRepetition.new
  end

  # GET /dummy_repetitions/1/edit
  def edit
    @drc = DummyRepetitionCollection.new
  end

  # POST /dummy_repetitions or /dummy_repetitions.json
  def create
    @dummy_repetition = DummyRepetition.new(dummy_repetition_params)

    respond_to do |format|
      if @dummy_repetition.save
        format.html { redirect_to @dummy_repetition, notice: "Dummy repetition was successfully created." }
        format.json { render :show, status: :created, location: @dummy_repetition }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dummy_repetition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dummy_repetitions/1 or /dummy_repetitions/1.json
  def update
    respond_to do |format|
      if @dummy_repetition.update(dummy_repetition_params)
        format.html { redirect_to @dummy_repetition, notice: "Dummy repetition was successfully updated." }
        format.json { render :show, status: :ok, location: @dummy_repetition }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dummy_repetition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dummy_repetitions/1 or /dummy_repetitions/1.json
  def destroy
    @dummy_repetition.destroy
    respond_to do |format|
      format.html { redirect_to dummy_repetitions_url, notice: "Dummy repetition was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dummy_repetition
      @dummy_repetition = DummyRepetition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dummy_repetition_params
      params.require(:dummy_repetition).permit(:title)
    end
end
