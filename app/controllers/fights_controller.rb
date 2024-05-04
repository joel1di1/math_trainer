# frozen_string_literal: true

# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength
class FightsController < ApplicationController
  before_action :set_fight, only: %i[show play]

  # GET /fights or /fights.json
  def index
    @fights = Fight.all
    @fight_opponents = FightOpponent.all
  end

  # GET /fights/1 or /fights/1.json
  def show; end

  # GET /fights/new
  def new
    @fight_opponents = FightOpponent.all
  end

  # POST /fights or /fights.json
  def create
    fight_opponent = FightOpponent.find_by(id: params[:fight_opponent_id])

    if fight_opponent.nil?
      respond_to do |format|
        format.html { redirect_to new_fight_url, notice: 'Fight opponent not found.' }
        format.json { render json: {}, status: :unprocessable_entity }
      end

      return
    end

    @fight = Fight.new(
      fight_opponent_id: fight_opponent.id,
      user_id: current_user.id,
      remaining_player_health: 32,
      remaining_opponent_health: fight_opponent.health,
      round_duration: 20,
      name: params[:fight_name]
    )

    respond_to do |format|
      if @fight.save
        format.html { redirect_to play_fight_path(@fight), notice: 'Fight was successfully created.' }
        format.json { render :show, status: :created, location: @fight }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fight.errors, status: :unprocessable_entity }
      end
    end
  end

  def play
    last_answer = @fight.answers.last
    @actions = []
    if last_answer&.correct?
      attack = (1..3).to_a.sample
      @actions << ['player1', "Attack#{attack}"]
      @fight.remaining_opponent_health -= attack
    end

    if last_answer.present?

      elapsed = (Time.zone.now - last_answer.created_at).to_i
      roll = (1..100).to_a.sample
      speed = @fight.fight_opponent.speed
      if speed + elapsed > roll
        attack = (1..3).to_a.sample
        @actions << ['player2', "Attack#{attack}"]
        @fight.remaining_player_health -= attack
      end
    end

    @actions << %w[player1 Death] if @fight.remaining_player_health <= 0
    @actions << %w[player2 Death] if @fight.remaining_opponent_health <= 0

    @fight.save!

    problem = @fight.next_problem
    @answer = problem.create_answer!(current_user)
    @fight.answers << @answer
  end

  def answer
    @fight = Fight.find(params[:fight_id])
    @answer = Answer.find(params[:id])

    respond_to do |format|
      if params[:fight][:text].blank?
        format.html { redirect_to play_fight_path(@fight), notice: 'Blank answer detected' }
      else
        @answer.update!(params.require(:fight).permit(:text))
        if @answer.correct?
          flash[:congrats] = 'Hit!'
        else
          flash[:missed] = 'Missed!'
        end
        format.html { redirect_to play_fight_path(@fight) }
      end
    end
  end

  private

  def set_fight
    @fight = Fight.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def fight_params
    params.require(:fight).permit(:fight_opponent_id, :remaining_player_health, :remaining_opponent_health,
                                  :round_duration, :name)
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
