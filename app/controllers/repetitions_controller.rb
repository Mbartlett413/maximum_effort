class RepetitionsController < ApplicationController
  before_action :set_repetition, only: %i[ show edit update destroy ]

  # GET /repetitions or /repetitions.json
  def index
    @repetitions = Repetition.all
  end

  # GET /repetitions/1 or /repetitions/1.json
  def show
  end

  # GET /repetitions/new
  def new
    @repetition = Repetition.new
  end

  # GET /repetitions/1/edit
  def edit
  end

  # POST /repetitions or /repetitions.json
  def create
    p 'hit'

    @repetition = Repetition.new
    @repetition.user_id = current_user.id
    @repetition.title = params[:title]

    respond_to do |format|
      if @repetition.save

        Repetition.create_rep_collection(params[:percent_array], params[:sets], params[:reps], @repetition)

        format.html { redirect_to @repetition, notice: "Repetition was successfully created." }
        format.json { render :show, status: :created, location: @repetition }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @repetition.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /repetitions/1 or /repetitions/1.json
  def update
    respond_to do |format|
      if @repetition.update(repetition_params)
        format.html { redirect_to @repetition, notice: "Repetition was successfully updated." }
        format.json { render :show, status: :ok, location: @repetition }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @repetition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /repetitions/1 or /repetitions/1.json
  def destroy
    @repetition.destroy
    respond_to do |format|
      format.html { redirect_to repetitions_url, notice: "Repetition was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def update_repetition_collection
    p 'hit'
    @action_set = params['user_action']
    if params['user_action'] == 'add'
      @repetition_collection = RepetitionCollection.new
      #params rep c id is actually the repetition_id
      @repetition = Repetition.find(params['rep_collection_id'])
    else
      @repetition_collection = RepetitionCollection.find(params['rep_collection_id'])
    end
    

  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_repetition
      @repetition = Repetition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def repetition_params
      params.require(:repetition).permit(:user_id, :title)
    end
end
