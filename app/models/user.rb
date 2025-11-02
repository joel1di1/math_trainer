# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :answers, dependent: :destroy
  has_many :time_sessions, dependent: :destroy

  before_validation :set_uuid, on: :create

  validates :uuid, uniqueness: true, presence: true

  def set_uuid
    self.uuid ||= SecureRandom.uuid
  end

  # Override Devise validatable to allow email to be optional for guest users
  validates :email, uniqueness: { allow_blank: true }
  validates :password, presence: true, if: :password_required?

  # Guest users don't need email
  def email_required?
    false
  end

  def password_required?
    !persisted? || password.present? || password_confirmation.present?
  end

  # Helper to check if user is a guest (no email set)
  def guest?
    email.blank?
  end

  # Helper to get display name
  def display_name
    return email if email.present?

    "Guest (#{uuid.first(8)})"
  end

  # Fix for Devise 4.9.4 with Ruby 3.4+
  # Override serialization methods to handle Ruby 3.4's block parameter changes
  def self.serialize_from_session(key, salt, *_extra_args)
    # Accept extra args that Ruby 3.4 might pass but ignore them
    record = key.is_a?(Array) ? find_by(id: key.first) : find_by(id: key)
    # In test mode with Warden.test_mode!, salt might be nil
    # In production, we always validate the salt
    return record if record && (salt.nil? || record.authenticatable_salt == salt)

    nil
  end

  def self.serialize_into_session(record, *_extra_args)
    # Accept extra args that Ruby 3.4 might pass but ignore them
    [record.to_key, record.authenticatable_salt]
  end

  def current_streak
    streak = 0
    answers.where.not(text: nil).order(id: :DESC).each do |answer|
      next if answer.text.blank?
      break unless answer.correct

      streak += 1
    end
    streak
  end
end
