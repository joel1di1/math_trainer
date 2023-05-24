# frozen_string_literal: true

class TimeSessionsController < ApplicationController
  before_action :set_time_session, only: %i[show edit update destroy start next end]

  # GET /time_sessions or /time_sessions.json
  def index
    @time_sessions = current_user.time_sessions.order(created_at: :desc)
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
    @time_session = TimeSession.new(time_session_params)
    @time_session.user = current_user

    %w[addition subtraction multiplication division].each do |operation|
      operation_params = params[:time_session][operation]
      if operation_params.present?
        table_numbers = []
        frequencies = {}
        (1..10).each do |num|
          table_numbers << num if operation_params["table_#{num}"].present?
          frequencies[num] = operation_params["frequency_#{num}"].to_i if operation_params["frequency_#{num}"].present?
        end
        @time_session.operation_types[operation] = { table_numbers: table_numbers, frequencies: frequencies }
      end
    end

    respond_to do |format|
      if @time_session.save
        format.html { redirect_to next_time_session_path(@time_session), notice: 'Commencez !' }
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
    return redirect_to(end_time_session_path(@time_session)) if @time_session.ended?

    problem = @time_session.next_problem
    @answer = problem.create_answer!(current_user)
    @time_session.answers << @answer

    render 'problems/next'
  end

  def end; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_time_session
    @time_session = current_user.time_sessions.find(params[:session_id] || params[:id])
  end

  # Only allow a list of trusted parameters through.
  def time_session_params
    params.require(:time_session).permit(:minutes, :shuffle_hole_position)
  end
end
