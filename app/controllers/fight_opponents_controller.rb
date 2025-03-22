# frozen_string_literal: true

class FightOpponentsController < ApplicationController
  before_action :set_fight_opponent, only: %i[show edit update destroy]

  # GET /fight_opponents or /fight_opponents.json
  def index
    @fight_opponents = FightOpponent.all
  end

  # GET /fight_opponents/1 or /fight_opponents/1.json
  def show; end

  # GET /fight_opponents/new
  def new
    @fight_opponent = FightOpponent.new
  end

  # GET /fight_opponents/1/edit
  def edit; end

  # POST /fight_opponents or /fight_opponents.json
  def create
    @fight_opponent = FightOpponent.new(fight_opponent_params)

    respond_to do |format|
      if @fight_opponent.save
        format.html do
          redirect_to fight_opponent_url(@fight_opponent), notice: 'Fight opponent was successfully created.'
        end
        format.json { render :show, status: :created, location: @fight_opponent }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fight_opponent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fight_opponents/1 or /fight_opponents/1.json
  def update
    respond_to do |format|
      if @fight_opponent.update(fight_opponent_params)
        format.html do
          redirect_to fight_opponent_url(@fight_opponent), notice: 'Fight opponent was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @fight_opponent }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fight_opponent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fight_opponents/1 or /fight_opponents/1.json
  def destroy
    @fight_opponent.destroy

    respond_to do |format|
      format.html { redirect_to fight_opponents_url, notice: 'Fight opponent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_fight_opponent
    @fight_opponent = FightOpponent.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def fight_opponent_params
    params.expect(fight_opponent: %i[name health speed color_rot])
  end
end
