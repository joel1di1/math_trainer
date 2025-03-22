# frozen_string_literal: true

class CardSessionsController < ApplicationController
  before_action :set_card_session, only: %i[show edit update destroy next]

  # GET /card_sessions
  # GET /card_sessions.json
  def index
    @card_sessions = CardSession.all
  end

  # GET /card_sessions/1
  # GET /card_sessions/1.json
  def show; end

  # GET /card_sessions/new
  def new
    @card_session = CardSession.new
  end

  # GET /card_sessions/1/edit
  def edit; end

  # POST /card_sessions
  # POST /card_sessions.json
  def create
    @card_session = CardSession.new(card_session_params)

    respond_to do |format|
      if @card_session.save
        format.html { redirect_to @card_session, notice: 'Card session was successfully created.' }
        format.json { render :show, status: :created, location: @card_session }
      else
        format.html { render :new }
        format.json { render json: @card_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /card_sessions/1
  # PATCH/PUT /card_sessions/1.json
  def update
    respond_to do |format|
      if @card_session.update(card_session_params)
        format.html { redirect_to @card_session, notice: 'Card session was successfully updated.' }
        format.json { render :show, status: :ok, location: @card_session }
      else
        format.html { render :edit }
        format.json { render json: @card_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /card_sessions/1
  # DELETE /card_sessions/1.json
  def destroy
    @card_session.destroy
    respond_to do |format|
      format.html { redirect_to card_sessions_url, notice: 'Card session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def next
    @answer = @card_session.next&.create_answer!(current_user, card_session: @card_session)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_card_session
    @card_session = CardSession.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def card_session_params
    params.expect(card_session: %i[title user_id])
  end
end
