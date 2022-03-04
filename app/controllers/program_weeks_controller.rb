class ProgramWeeksController < ApplicationController
  before_action :set_program_week, only: %i[ show edit update destroy ]

  # GET /program_weeks or /program_weeks.json
  def index
    @program_weeks = ProgramWeek.all
  end

  # GET /program_weeks/1 or /program_weeks/1.json
  def show
  end

  # GET /program_weeks/new
  def new
    @program_week = ProgramWeek.new
  end

  # GET /program_weeks/1/edit
  def edit
  end

  # POST /program_weeks or /program_weeks.json
  def create
    @program_week = ProgramWeek.new(program_week_params)

    respond_to do |format|
      if @program_week.save
        format.html { redirect_to @program_week, notice: "Program week was successfully created." }
        format.json { render :show, status: :created, location: @program_week }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @program_week.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /program_weeks/1 or /program_weeks/1.json
  def update
    respond_to do |format|
      if @program_week.update(program_week_params)
        format.html { redirect_to @program_week, notice: "Program week was successfully updated." }
        format.json { render :show, status: :ok, location: @program_week }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @program_week.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /program_weeks/1 or /program_weeks/1.json
  def destroy
    @program_week.destroy
    respond_to do |format|
      format.html { redirect_to program_weeks_url, notice: "Program week was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_program_week
      @program_week = ProgramWeek.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def program_week_params
      params.require(:program_week).permit(:title, :program_id, :active_week)
    end
end
