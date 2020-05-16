# frozen_string_literal: true

class AnswersController < ApplicationController
  before_action :set_answer, only: %i[show edit update destroy]

  CONGRATS = ['Bravo', 'Génial', 'Super', 'Woohaa', 'Fantastique', 'Trop fort', 'Champion', 'Trop Bien'].freeze
  CONGRATS_EMOJIS = %w[😀 😃 😇 🙂 😍 😉 😘 🤪 😋 😜 😺 👏 👍 🙌 👌 👌].freeze
  MISSED = ['Zut', 'Raté', 'Dommage', 'Presque', 'Encore un effort', 'Recommence'].freeze
  MISSED_EMOJIS = %w[☹️ 😡 😱 😨 😓 😰 🤔 😳].freeze

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/1
  # GET /answers/1.json
  def show; end

  # GET /answers/new
  def new
    @answer = Answer.new
  end

  # GET /answers/1/edit
  def edit; end

  # POST /answers
  # POST /answers.json
  def create
    @answer = Answer.new(answer_params)

    respond_to do |format|
      if @answer.save
        format.html { redirect_to @answer, notice: 'Answer was successfully created.' }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    respond_to do |format|
      @answer.update!(answer_params)
      if @answer.correct?
        flash[:congrats] = random_congrats_message
      else
        flash[:missed] = random_missed_message
      end
      format.html { redirect_to next_multiplications_path }
      format.json { render :show, status: :ok, location: @answer }
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_answer
    @answer = Answer.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def answer_params
    params.require(:answer).permit(:user_id, :operation_id, :text)
  end

  protected

  def random_congrats_message
    "#{CONGRATS.sample} #{CONGRATS_EMOJIS.sample}"
  end

  def random_missed_message
    "#{MISSED.sample} #{MISSED_EMOJIS.sample}"
  end
end
