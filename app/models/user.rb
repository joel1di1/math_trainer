# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :answers

  def current_streak
    streak = 0
    answers.includes(:problem).where.not(text: nil).order(id: :DESC).each do |answer|
      next if answer.text.blank?
      break unless answer.correct?

      streak += 1
    end
    streak
  end
end
