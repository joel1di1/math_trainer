# frozen_string_literal: true

class TimeSessionsController < ApplicationController
  before_action :set_time_session, only: %i[show edit update destroy start]

  # GET /time_sessions or /time_sessions.json
  def index
    @time_sessions = TimeSession.all
  end

  # GET /time_sessions/1 or /time_sessions/1.json
  def show; end

  # GET /time_sessions/new
  def new
    @time_session = TimeSession.new
  end

  # GET /time_sessions/1/edit
  def edit; end

  # POST /time_sessions or /time_sessions.json
  def create
    @time_session = TimeSession.new(time_session_params.merge(user: current_user))

    respond_to do |format|
      if @time_session.save
        format.html { redirect_to @time_session, notice: 'Time session was successfully created.' }
        format.json { render :show, status: :created, location: @time_session }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @time_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_sessions/1 or /time_sessions/1.json
  def update
    respond_to do |format|
      if @time_session.update(time_session_params)
        format.html { redirect_to @time_session, notice: 'Time session was successfully updated.' }
        format.json { render :show, status: :ok, location: @time_session }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @time_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_sessions/1 or /time_sessions/1.json
  def destroy
    @time_session.destroy
    respond_to do |format|
      format.html { redirect_to time_sessions_url, notice: 'Time session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def start
    redirect_to next_time_session_path(@time_session)
  end

  def next
    problem = @time_session.next_problem
    @answer = problem.create_answer!(current_user)

    render 'problems/next'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_time_session
    @time_session = TimeSession.find(params[:session_id] || params[:id])
  end

  # Only allow a list of trusted parameters through.
  def time_session_params
    params.require(:time_session).permit(:user_id, :minutes, :operation_types, :frequencies)
  end
end
