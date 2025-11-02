# frozen_string_literal: true

class GuestSessionsController < ApplicationController
  def save
    @user = current_user
    @answers_count = @user.answers.count
    @correct_answers_count = @user.answers.where(correct: true).count
    @current_streak = @user.current_streak
  end

  def update_uuid
    @user = current_user

    if @user.update(uuid: params[:uuid])
      # Update the cookie with new UUID
      cookies.encrypted.permanent[:guest_user_uuid] = @user.uuid

      flash[:success] = 'Code updated successfully!'
      redirect_to save_session_path
    else
      flash.now[:error] = @user.errors.full_messages.join(', ')
      @answers_count = @user.answers.count
      @correct_answers_count = @user.answers.where(correct: true).count
      @current_streak = @user.current_streak
      render :save, status: :unprocessable_entity
    end
  end

  def restore
    @current_user_stats = {
      answers_count: current_user.answers.count,
      correct_answers: current_user.answers.where(correct: true).count,
      streak: current_user.current_streak
    }
  end

  def restore_session
    user = User.find_by(uuid: params[:code])

    if user.blank?
      flash.now[:error] = 'Code not found. Please check and try again.'
      @current_user_stats = {
        answers_count: current_user.answers.count,
        correct_answers: current_user.answers.where(correct: true).count,
        streak: current_user.current_streak
      }
      render :restore, status: :unprocessable_entity
      return
    end

    # Sign out current user first
    sign_out(current_user) if user_signed_in?

    # Update cookie to new UUID (this will overwrite current session)
    cookies.encrypted.permanent[:guest_user_uuid] = user.uuid

    # Sign in the restored user
    sign_in(user)

    redirect_to root_path, notice: 'Session restored successfully!'
  end
end
