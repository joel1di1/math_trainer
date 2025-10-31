# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :answers, dependent: :destroy
  has_many :time_sessions, dependent: :destroy

  attribute :uuid, :uuid, default: -> { SecureRandom.uuid }

  validates :uuid, uniqueness: true

  # Fix for Devise 4.9.4 with Ruby 3.4+
  # Override serialization methods to handle Ruby 3.4's block parameter changes
  def self.serialize_from_session(key, salt, *_extra_args)
    # Accept extra args that Ruby 3.4 might pass but ignore them
    record = key.is_a?(Array) ? find_by(id: key.first) : find_by(id: key)
    record if record && record.authenticatable_salt == salt
  end

  def self.serialize_into_session(record, *_extra_args)
    # Accept extra args that Ruby 3.4 might pass but ignore them
    [record.to_key, record.authenticatable_salt]
  end

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
